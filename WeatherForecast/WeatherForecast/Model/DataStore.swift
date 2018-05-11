////
////  DataStore.swift
////  WeatherForecast
////
////  Created by Iciar Novo Fernandez on 10/05/2018.
////  Copyright © 2018 Icicleta. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//final class DataStore {
//    
//    static let sharedInstance = DataStore()
//    fileprivate init() {}
//    
//    var weatherForecast: WeatherForecast?
//    
//    func getWeatherForecast(completion: @escaping () -> Void) {
//        
//        OpenWeatherMapAPI.getWeatherForecastJSON(country) { (json) in
//            let feed = json? as? WeatherForecastJSON
//            weatherForecast = WeatherForecast(dictionary: json)
//                }
//                completion()
//            }
//        }
//    }
//
//    func getBookImages(completion: @escaping () -> Void) {
//        getBooks {
//            for book in self.audiobooks {
//                let url = URL(string: book.coverImage)
//                let data = try? Data(contentsOf: url!)
//                if let imageData = data {
//                    let image = UIImage(data: imageData)
//                    self.images.append(image!)
//                }
//            }
//            OperationQueue.main.addOperation {
//                completion()
//            }
//        }
//    }
//}
