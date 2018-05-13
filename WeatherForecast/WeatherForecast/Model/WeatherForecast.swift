//
//  WeatherForecast.swift
//  WeatherForecast
//
//  Created by Iciar Novo Fernandez on 10/05/2018.
//  Copyright © 2018 Icica. All rights reserved.
//

import Foundation

struct WeatherForecast {
    let mainWeather: String
    let description: String
    let temperature: Temperature
    let minTemp: Temperature
    let maxTemp: Temperature
    let humidity: Int
    let windSpeed: Double
    let windDeg: Int
    let pressure: Int
    let clouds: Int
    let sunrise: NSDate
    let sunset: NSDate
    
//    static func dateStringFromUnixTime(unixTime: Double) -> Date  {
//        let timeInSeconds = TimeInterval(unixTime)
//        let weatherDate = NSDate(timeIntervalSince1970:unixTime)
        // Returns date formatted as 12 hour time.
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "hh:mm a"
//        print(dateFormatter.string(from: weatherDate as Date))
//        return dateFormatter.string(from: weatherDate as Date)
//        return weatherDate as Date
//    }
    
    init(dictionary: WeatherForecastJSON) {

        let sys = dictionary["sys"] as! NSDictionary
        let weatherArray = dictionary["weather"] as! NSArray
        let main = dictionary["main"] as! NSDictionary
        let clouds = dictionary["clouds"] as! NSDictionary
        let wind = dictionary["wind"] as! NSDictionary
        
        let weather = weatherArray[0] as! NSDictionary
        
        let sunriseUnixTime = sys["sunrise"] as! Double
        let sunsetUnixTime = sys["sunset"] as! Double
        
        self.mainWeather = weather["main"] as! String
        self.description = weather["description"] as! String
        self.temperature = Temperature(kelvin: main["temp"] as! Double)
        self.minTemp = Temperature(kelvin: main["temp_min"] as! Double)
        self.maxTemp = Temperature(kelvin: main["temp_max"] as! Double)
        self.humidity = main["humidity"] as! Int
        self.windSpeed = wind["speed"] as! Double
        self.windDeg = wind["deg"] as! Int
        self.pressure = main["pressure"] as! Int
        self.clouds = clouds["all"] as! Int
        self.sunrise = NSDate(timeIntervalSince1970: sunriseUnixTime)
        self.sunset = NSDate(timeIntervalSince1970: sunsetUnixTime)
    }
}
