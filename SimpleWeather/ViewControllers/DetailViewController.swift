//
//  DetailViewController.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatcherDescriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var temperatureRangeLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var weatcherImage: UIImageView!
    
    var city: CityWeather!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSettings()
    }
    
    //MARK: - Private method
    private func viewSettings() {
        guard let name = city.name else { return }
        guard let weatcherDescription = city.weather?.description else { return }
        guard let temperature = city.main?.temp else { return }
        guard let minTemp = city.main?.temp_min else { return }
        guard let maxTemp = city.main?.temp_max else { return }
        guard let humidity = city.main?.humidity else { return }
        guard let pressure = city.main?.pressure else { return }
        guard let weatcherIcon = city.weather?.icon else { return }
        
        cityNameLabel.text = name
        weatcherDescriptionLabel.text = "Сегодня: \(weatcherDescription)"
        temperatureLabel.text = "\(temperature)ºC"
        temperatureRangeLabel.text = "\(minTemp)ºC...\(maxTemp)ºC"
        humidityLabel.text = "Видимость: \(humidity)%"
        pressureLabel.text = "Давление: \(pressure)hPa"
        
        getBigIcon(icon: weatcherIcon)
    }
    
    private func getBigIcon(icon: String) {
        let iconUrl = DataManager.shared.weatherIcon(icon: icon, size: "big")
        NetworkManager.getImage(imageUrl: iconUrl) { icon in
            self.weatcherImage.image = icon
        }
    }
    
}
