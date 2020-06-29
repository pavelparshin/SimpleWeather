//
//  TableViewCell.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 29.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatcherImage: ImageView! {
        didSet {
            weatcherImage.contentMode = .scaleAspectFit
            weatcherImage.clipsToBounds = true
        }
    }
    
    
    //MARK: Public method
    func configCell(with cityWeather: CityWeather) {
        guard let name = cityWeather.name else { return }
        guard let temperature = cityWeather.main?.temp else { return }
        guard let weatcherIconURL = DataManager.shared
            .weatherIcon(icon: cityWeather.weather?.icon) else { return }
        
        cityNameLabel.text = name
        temperatureLabel.text = "\(temperature)ºC"
        weatcherImage.fetchImage(from: weatcherIconURL)
    }
}
