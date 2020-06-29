//
//  DataManaer.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

class DataManager {
    
    static let shared = DataManager()
    private init() {
    }
    
    let cities = [Cities(name: "Moscow", id: 524894),
                  Cities(name: "Ufa", id: 479561),
                  Cities(name: "New York", id: 5128581),
                  Cities(name: "London", id: 2643743)]
    
    //MARK: get JSON URL
    let appid = "fb0a0fb25938cf3f0f4b11d60c3176c5"
    
    func getUrl(cityid: Int) -> String {
        return "https://api.openweathermap.org/data/2.5/weather?id=\(cityid)&appid=\(appid)&lang=ru"
    }
    
    //MARK: get weatcher icon URL
    func weatherIcon(icon: String?, size: String = "small") -> String? {
        guard let icon = icon else { return nil}
        switch size {
        case "big":
            return "https://openweathermap.org/img/wn/\(icon)@2x.png"
        default:
            return "https://openweathermap.org/img/wn/\(icon).png"
        }
    }
}
