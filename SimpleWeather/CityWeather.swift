//
//  CityWeather.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import Foundation

struct Cities {
    var name: String
    var id: Int
}

struct City {
    var city: [CityWeather]
}

struct CityWeather {
    var name: String?
    var id: Int?
    var weather: Weather?
    var main: Temperature?
    
    init(from cityWeather: [String: Any]) {
        self.name = cityWeather["name"] as? String
        self.id = cityWeather["id"] as? Int
        self.weather = Weather(from: cityWeather["weather"] as! [[String : Any]])
        self.main = Temperature(from: cityWeather["main"] as! [String : Any])
    }
    
    static func setCityWeather(from data: Any?) -> CityWeather? {
        guard let data = data as? [String: Any] else { return nil}
        return CityWeather(from: data)
    }
}

struct Weather {
    var main: String?
    var description: String?
    var icon: String?
    
    init(from weather: [[String: Any]]) {
        guard let weather = weather.first else { return }
        self.main = weather["main"] as? String
        self.description = weather["description"] as? String
        self.icon = weather["icon"] as? String
    }
}

struct Temperature {
    var temp: Double?
    var pressure: Double?
    var humidity: Int?
    var temp_min: Double?
    var temp_max: Double?
    
    init(from cityTemp: [String: Any]) {
        //Так как с Api приходит данные температуры в градусах кельвина, то при инициалиции конвертируем их в цельсии
        self.temp = (cityTemp["temp"] as? Double ?? 0) - 273.15
        self.pressure = (cityTemp["pressure"] as? Double ?? 0) - 273.15
        self.humidity = cityTemp["humidity"] as? Int
        self.temp_min = (cityTemp["temp_min"] as? Double ?? 0) - 273.15
        self.temp_max = (cityTemp["temp_max"] as? Double ?? 0) - 273.15
    }
}
