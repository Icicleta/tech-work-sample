//
//  ChooseCountryViewController.swift
//  WeatherForecast
//
//  Created by Iciar Novo Fernandez on 07/05/2018.
//  Copyright © 2018 Icicleta. All rights reserved.
//

import UIKit

class ChooseCountryViewController: UIViewController {

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    var country: String?
    var weatherForecastInfo: WeatherForecast?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendCountryWeatherData(_ sender: Any) {
        getWeatherForecast {
            guard self.weatherForecastInfo != nil else {
                self.errorText.text = "Data for this country couldn't be retrieved, try again please"
                return
            }
            self.performSegue(withIdentifier: "displayCountryWeather", sender: self)
        }
    }

    func getWeatherForecast(completion: @escaping () -> Void) {
        guard let country = countryTextField.text else { return }
        OpenWeatherMapAPI.getWeatherForecastJSON(country: country) { (json) in
            guard let feed = json else { print("JSON data hasn't been found"); return }
            print(feed)
            if let error = feed["message"] {
                print(error)
                return
            } else {
                self.weatherForecastInfo = WeatherForecast(dictionary: feed)
                completion()
            }
        }
    }
    
    @IBAction func unwindToChooseCountryTableView(segue: UIStoryboardSegue)
    {}
    
}
