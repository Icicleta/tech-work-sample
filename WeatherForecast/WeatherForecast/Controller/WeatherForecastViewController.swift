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
    var weatherForecastData: WeatherForecast?
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var mainWeather: UILabel!
    @IBOutlet weak var temperatureText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var minTempText: UILabel!
    @IBOutlet weak var maxTempText: UILabel!
    @IBOutlet weak var humidityText: UILabel!
    @IBOutlet weak var windText: UILabel!
    @IBOutlet weak var pressureText: UILabel!
    @IBOutlet weak var cloudsText: UILabel!
    @IBOutlet weak var sunriseText: UILabel!
    @IBOutlet weak var sunsetText: UIView!
  
    @IBOutlet weak var weatherScaleSegment: UISegmentedControl!
    
    func weatherScalePressed(_ segment: UISegmentedControl) {
        guard let data = weatherForecastData else { return }
        switch segment.selectedSegmentIndex
        {
        case 0:
            temperatureText.text = "\(Int(round(data.tempCelsius)))°"
        case 1:
            temperatureText.text = "\(Int(round(data.tempFahrenheit)))°"
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateWeatherForecast()
    }
    
    func updateWeatherForecast() {
        guard let data = weatherForecastData else { return }
        weatherScalePressed(weatherScaleSegment)
        descriptionText.text = data.description
        mainWeather.text = "\(data.mainWeather)"
        minTempText.text = "\(data.minTemp)K"
        maxTempText.text = "\(data.maxTemp)K"
        humidityText.text = "\(data.humidity)%"
        windText.text = "Speed: \(data.windSpeed)m/s Degree: \(data.windDeg)%"
        pressureText.text = "\(data.pressure)hPa"
        cloudsText.text = "\(data.clouds)%"
    }
}

