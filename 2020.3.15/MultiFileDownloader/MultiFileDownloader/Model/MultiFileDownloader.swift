//
//  MultiFileDownloader.swift
//  MultiFileDownloader
//
//  Created by Teacher on 15/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class MultiFileDownloader {
    
    private var queue : DispatchQueue
    private(set) var downloadedImages : [UIImage] = []
    
    init() {
        self.downloadedImages = []
        self.queue = DispatchQueue(label: UUID().uuidString)
    }
    
    func download(urls : [URL], completion : @escaping ()->Void) {
        
        let group = DispatchGroup()
        
        for url in urls {
            group.enter()
            URLSession.shared.dataTask(with: url) { [weak self](data, response, error) in
                guard let self = self else {
                    group.leave()
                    return
                }
                
                guard let data = data else {
                    print("Failed to download data at url \(url)")
                    group.leave()
                    return
                }
                guard let image = UIImage(data: data) else {
                    print("data at url \(url) is not a valid image")
                    group.leave()
                    return
                }
                
                self.queue.async {
                    self.downloadedImages.append(image)
                    group.leave()
                }
                
            }.resume()
        }
        
        group.notify(queue: .main) {
            completion()
        }
    }
    
}
