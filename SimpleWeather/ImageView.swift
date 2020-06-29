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
            print("first")
            return
        }
        
        if let cachedImage = getCachedImage(url: url) {
            image = cachedImage
            print("second")
            return
        }
        
        ImageManager.shared.getImage(from: url) { (data, response) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                print("ImageManager.shared.getImage")
            }
            self.saveDataToCach(with: data, and: response)
        }
        
    }
       
    private func getCachedImage(url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            print("getCachedImage success")
            return UIImage(data: cachedResponse.data)
        }
        print("getCachedImage fail")
        return nil
    }
    
    private func saveDataToCach(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
        print("saveDataToCach")
    }
}
