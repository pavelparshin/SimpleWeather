//
//  ImageManager.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 29.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import Alamofire

class ImageManager {
    static let shared = ImageManager()
    private init() {}

    func getImage(from url: URL, completion: @escaping (Data, URLResponse) -> Void) {
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let imageData):
                
                guard let urlResponse = response.response else { return }
                completion(imageData, urlResponse)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
