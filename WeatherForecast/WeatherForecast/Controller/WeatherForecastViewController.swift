//
//  WeatherForecastViewController.swift
//  WeatherForecast
//
//  Created by Iciar Novo Fernandez on 07/05/2018.
//  Copyright © 2018 Icicleta. All rights reserved.
//

import UIKit


class WeatherForecastViewController: UITableViewController {
//    var country: String?
    var data: WeatherForecast?
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var mainWeather: UILabel!
    @IBOutlet weak var temperatureText: UILabel!

    @IBOutlet weak var minTempText: UILabel!
    @IBOutlet weak var maxTempText: UILabel!
    @IBOutlet weak var humidityText: UILabel!
    @IBOutlet weak var windText: UILabel!
    @IBOutlet weak var pressureText: UILabel!
    @IBOutlet weak var cloudsText: UILabel!
    @IBOutlet weak var sunriseText: UILabel!
    @IBOutlet weak var sunsetText: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateWeatherForecast()
    }
    
    func updateWeatherForecast() {
        guard let data = data else { return }
        minTempText.text = "\(data.minTemp)K"
        maxTempText.text = "\(data.maxTemp)K"
        humidityText.text = "\(data.humidity)%"
        windText.text = "Speed: \(data.windSpeed)m/s Degree: \(data.windDeg)%"
        pressureText.text = "\(data.pressure)hPa"
        cloudsText.text = "\(data.clouds)%"
    }
}

