//
//  ViewController.swift
//  MultiFileDownloader
//
//  Created by Teacher on 15/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let downloader = MultiFileDownloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urls : [URL] = [
            "https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200108214800-coronavirus.jpg",
            "https://www.hopkinsmedicine.org/-/media/images/health/1_-conditions/infectious-diseases/coronavirus-hero.ashx?h=500&la=en&mh=500&mw=1300&w=1297&hash=6464CC9E4F6364821A5973E670CFB3342C2D9AF4",
            "https://cdn.mos.cms.futurecdn.net/JtVH5Khvihib7dBDFY9ZDR.jpg"
            ].compactMap{ URL(string: $0)}
        
        downloader.download(urls: urls) {
            print("download finished")
            print("images count \(self.downloader.downloadedImages.count)")
        }
    }


}

