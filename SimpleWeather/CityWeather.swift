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
    var name: String
    var id: Int
    var weather: Weather
    var main: Temperature
}

struct Weather {
    var main: String
    var description: String
    var icon: String
}

struct Temperature {
    var temp: Float
    var pressure: Float
    var humidity: Int
    var temp_min: Float
    var temp_max: Float
}
