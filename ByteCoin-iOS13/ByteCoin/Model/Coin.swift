import Foundation

struct Coin{
    let price:Double
    var priceString:String{
        String(format: "%.2f", price)
    }
    let currency:String
}
