//
//  ImageView.swift
//  SimpleWeather
//
//  Created by Pavel Parshin on 26.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            image = #imageLiteral(resourceName: "load")
            return
        }
        
        if let cachedImage = getCachedImage(url: url) {
            image = cachedImage
            return
        }
        
        ImageManager.shared.getImage(from: url) { (data, response) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            self.saveDataToCache(with: data, response: response)
        }
        
        
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
    
    private func saveDataToCache(with data: Data, response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
