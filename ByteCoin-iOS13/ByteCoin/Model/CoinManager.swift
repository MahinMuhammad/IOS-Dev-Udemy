import Foundation

protocol CoinManagerDelegate{
    func didUpdatePrice(_ coinManager:CoinManager, coin:Coin)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = coinAPIKey
    
    let currencyArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate:CoinManagerDelegate?

    func getCoinPrice(for currency:String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let coin = parseJSON(safeData){
                        delegate?.didUpdatePrice(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ data: Data)->Coin?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            let currency = decodedData.asset_id_quote
            let coin = Coin(price: lastPrice, currency: currency)
            return coin
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
