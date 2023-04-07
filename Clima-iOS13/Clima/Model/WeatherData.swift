//
//  WeatherData.swift
//  Clima
//
//  Created by Md. Mahinur Rahman on 4/5/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name:String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp:Double
}

struct Weather: Decodable{
    let id: Int
}
