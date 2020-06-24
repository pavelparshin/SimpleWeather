//
//  NetworkManager.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import Alamofire

class NetworkManager {
    
//    static func getRequest(city: Cities, cityData: @escaping (CityWeather) -> Void) {
    static func getRequest(city: Cities) {
        let url = DataManager.shared.getUrl(cityid: city.id)
        AF.request(url).validate()
            .responseJSON { cityData in
                
                switch cityData.result {
                case .success(let jsonValue):
                    
                    guard let cityWeather = CityWeather.setCityWeather(from: jsonValue) else { return }
                    print(cityWeather)
                              
                case .failure(let error):
                    print(error)
                }
        }
    }
}
