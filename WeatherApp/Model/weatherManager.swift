//
//  weatherManager.swift
//  weatherApp
//
//  Created by Dinesh Sharma on 19/11/22.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func updateUI(weather: WeatherModel)
}


struct WeatherManager {
    
    let string = "https://api.openweathermap.org/data/2.5/weather?appid=75d298f13b2202200c6a43f135187dda&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let stringWithCityName = string + "&q=\(cityName)"
        if let urlString = URL(string: stringWithCityName) {
            makeRequest(with: urlString)
        }
    }
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees){
        let newString = string + "&lat=\(lat)&lon=\(lon)"
        if let urlString = URL(string: newString) {
            makeRequest(with: urlString)
        }
    }
    
    func makeRequest(with url: URL){
        
        let request = URLSession.shared
        
        let task = request.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print(error.localizedDescription)
            }else {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{
                        
                        if let safeData = data {
                            if let parsedData = parseJSON(weatherData: safeData){
                                delegate?.updateUI(weather: parsedData)
                            }
                        
                        }
                        
                    }else {
                        print(httpResponse.statusCode)
                        print("Response code not right")
                    }
                }
            }
            
        }
        task.resume()
        
        func parseJSON(weatherData: Data) -> WeatherModel?{
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                
                let name = decodedData.name
                let temp = decodedData.main.temp
                let conditionId = decodedData.weather[0].id
                let description = decodedData.weather[0].description
                let feels_like = decodedData.main.feels_like
                let temp_min = decodedData.main.temp_min
                let temp_max = decodedData.main.temp_max
                let pressure = decodedData.main.pressure
                let humidity = decodedData.main.humidity
                
               
                let weather = WeatherModel(name: name, temp: temp, conditionId: conditionId, description: description, feels_like: feels_like, temp_min: temp_min, temp_max: temp_max, pressure: pressure, humidity: humidity)
                return weather
                
            }catch {
                print(error.localizedDescription)
                return nil
            }
            
        }
        
        
    }
    
    
}
