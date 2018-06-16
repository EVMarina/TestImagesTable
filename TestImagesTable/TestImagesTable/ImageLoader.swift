//
//  ImageLoader.swift
//  TestImagesTable
//
//  Created by Marina on 16/06/2018.
//  Copyright © 2018 Marina. All rights reserved.
//

import UIKit


class ImageLoader {
    
    private static var cahedImages = NSCache<NSString, UIImage>()
    
    class func isImageInCache(url: URL) -> Bool {
        
        let image = cahedImages.object(forKey: url.absoluteString as NSString)
        return image != nil
    }
    
    class func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        
        if let image = cahedImages.object(forKey: url.absoluteString as NSString) {
            completion(image)
        }
        else {
            getDataFromUrl(url: url) { (data, response, error) in
                guard let data = data, error == nil, let image = UIImage(data: data) else {
                    return
                }
                
                cahedImages.setObject(image, forKey: url.absoluteString as NSString)
                completion(image)
            }
        }
    }
    
    private class func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
