//
//  OpenWeatherMapAPI.swift
//  WeatherForecast
//
//  Created by Iciar Novo Fernandez on 09/05/2018.
//  Copyright © 2018 Icicleta. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

typealias WeatherForecastJSON = [String: Any]

struct OpenWeatherMapAPI {
//    var sys: [String: String]
//    var weather: [[String: String]]
//    var main: [String: String]
//    var wind: [String: String]
//    var rain: [String: String]
//    var clouds: [String: String]
//
//    enum Keys: String, CodingKey {
//        case sys
//        case weather
//        case main
//        case wind
//        case rain
//        case clouds
//    }
//
//    init(from decoder: Decoder) throws {
//        let valueContainer = try decoder.container(keyedBy: Keys.self)
//        self.sys = try valueContainer.decode([String: String].self, forKey: Keys.sys)
//        self.weather = try valueContainer.decode([[String: String]].self, forKey: Keys.weather)
//        self.main = try valueContainer.decode([String: String].self, forKey: Keys.main)
//        self.wind = try valueContainer.decode([String: String].self, forKey: Keys.wind)
//        self.rain = try valueContainer.decode([String: String].self, forKey: Keys.rain)
//        self.clouds = try valueContainer.decode([String: String].self, forKey: Keys.clouds)
//    }
//}

    static func getWeatherForecastJSON(country: String, completion: @escaping (WeatherForecastJSON?) -> Void) {
        let WEATHER_URL = "https://samples.openweathermap.org/data/2.5/weather"
        let query: [String: String] = [
            "appid": "62fc4256-8f8c-11e5-8994-feff819cdc9f",
            "q": country
        ]

        let url = URL(string: WEATHER_URL)!.withQueries(query)
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        //fetching the data from the url
        let dataTask = URLSession.shared.dataTask(with: unwrappedURL) { data, response, error in

            guard let unwrappedData = data else { print("Error unwrapping data"); return }

//            do {
            if let responseJSON = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as? WeatherForecastJSON {
                completion(responseJSON)
            }
//            } catch {
//                print("Could not get API data. \(error), \(error.localizedDescription)")
//            }
//            let jsonDecoder = JSONDecoder()
//            if let data = data,
//                let weatherForecastInfo = try? jsonDecoder.decode(WeatherForecastAPI.self, from: data) {
//                completion(weatherForecastInfo)
//            }
        }
        dataTask.resume()
    }
}

