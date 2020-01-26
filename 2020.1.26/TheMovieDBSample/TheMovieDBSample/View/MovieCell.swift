//
//  MovieCell.swift
//  TheMovieDBSample
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    func populate(with movie : Movie) {
        nameLabel.text = movie.title
        overviewLabel.text = movie.overview
        
        posterImageView.sd_cancelCurrentImageLoad()
        posterImageView.image = nil
        posterImageView.sd_setImage(with: movie.postPathURL)
    }
    
}
