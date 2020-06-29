//
//  ImageManager.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 29.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    func getImage(from url: URL, complition: @escaping (Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            guard responseURL == url else { return }
            complition(data, response)
        }
    }
}
