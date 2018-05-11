//
//  WeatherForecast.swift
//  WeatherForecast
//
//  Created by Iciar Novo Fernandez on 10/05/2018.
//  Copyright © 2018 Icica. All rights reserved.
//

import Foundation

struct WeatherForecast {
    let title: String
    let description: String
    let temperature: Double
    let minTemp: Double
    let maxTemp: Double
    let humidity: Int
    let windSpeed: Double
    let windDeg: Int
    let pressure: Int
    let clouds: Int
    let sunrise: Int
    let sunset: Int
    
    init(dictionary: WeatherForecastJSON) {
        
        let sys = dictionary["sys"] as! [String: Any]
        let weatherArray = dictionary["weather"] as! NSArray
        let main = dictionary["main"] as! [String: Any]
        let clouds = dictionary["clouds"] as! [String: Any]
        let wind = dictionary["wind"] as! [String: Any]
        
        var weather = weatherArray[0] as! [String: Any]
        
        self.title = weather["main"] as! String
        self.description = weather["description"] as! String
        self.temperature = main["temp"] as! Double
        self.minTemp = main["temp_min"] as! Double
        self.maxTemp = main["temp_max"] as! Double
        self.humidity = main["humidity"] as! Int
        self.windSpeed = wind["speed"] as! Double
        self.windDeg = wind["deg"] as! Int
        self.pressure = main["pressure"] as! Int
        self.clouds = clouds["all"] as! Int
        self.sunrise = sys["sunrise"] as! Int
        self.sunset = sys["sunset"] as! Int
    }
}
