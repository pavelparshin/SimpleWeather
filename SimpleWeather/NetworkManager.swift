//
//  NetworkManager.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static func getRequest(city: Cities, with complition: @escaping (CityWeather) -> Void) {
        let url = DataManager.shared.getUrl(cityid: city.id)
        AF.request(url).validate()
            .responseJSON { cityData in
                
                switch cityData.result {
                case .success(let jsonValue):

                    guard let cityWeather = CityWeather.setCityWeather(from: jsonValue) else { return }
                    complition(cityWeather)
                              
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    /*
    static func getImage(imageUrl: String, complition: @escaping (UIImage) -> Void) {
        AF.request(imageUrl).validate()
            .responseData { weatherIcon in
                switch weatherIcon.result {
                case .success(let jsonValue):
                    
                    guard let icon = UIImage(data: jsonValue) else { return }
                    complition(icon)
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
 */
}
