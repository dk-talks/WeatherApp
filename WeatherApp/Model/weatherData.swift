//
//  weatherData.swift
//  weatherApp
//
//  Created by Dinesh Sharma on 20/11/22.
//

import Foundation

struct WeatherData: Decodable {
    		
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Main: Decodable {
    
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
