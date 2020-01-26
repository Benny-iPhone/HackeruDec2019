//
//  ViewController.swift
//  ImageFromURL
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func downloadAction(_ sender: UIButton) {
        
        imageView.image = nil
        
        let urlString = "https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2020/01/25/9743082/97430810100589640360no.jpg"
        guard let url = URL(string: urlString) else {
            return
        }
        
        imageView.sd_setImage(with: url)
        
        /*
        //background thread
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            let image = UIImage(data: data)
            //back to main thread
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.imageView.image = image
            }
            
        }
        */
        
        
    }
    
}

