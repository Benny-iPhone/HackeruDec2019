//
//  MovieCell.swift
//  SearchMovies
//
//  Created by Teacher on 19/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var releaseDateLabel : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    
    func populate(with movie : Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.release_date

        //clean up, to avoid synch issue
        imageView.image = nil
        imageView.sd_cancelCurrentImageLoad()
        //load image from url using SDWebImage
        imageView.sd_setImage(with: movie.posterURL)
    }
    
}


















