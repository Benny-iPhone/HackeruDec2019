//
//  MovieDetailsViewController.swift
//  SearchMovies
//
//  Created by Teacher on 23/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import SDWebImage
import SafariServices

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var homePageButton: UIButton!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    
    var movie : Movie?
    weak var bgImageView : UIImageView?
    let networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildBackgroundImageView()
        populateUI()
        
        guard let movie = self.movie else { return }
        networking.fetchMovieDetails(with: movie) { [weak self](result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                self.movie = movie
                self.populateUI()
            }
        }
    }
    
    private func buildBackgroundImageView() {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        [
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].forEach{ $0.isActive = true }
        
        self.bgImageView = imageView
        self.view.sendSubviewToBack(imageView)
    }
    
    private func populateUI() {
        guard let movie = self.movie else {
            return
        }
        
        self.navigationItem.title = movie.title
        bgImageView?.sd_setImage(with: movie.largePosterURL)
        
        textView.text = movie.overview
        
        if let revenue = movie.revenue {
            revenueLabel.text = "Revenue \(revenue)"
            revenueLabel.isHidden = false
        } else {
            revenueLabel.isHidden = true
        }
        
        if let budget = movie.budget {
            budgetLabel.text = "Budget \(budget)"
            budgetLabel.isHidden = false
        } else {
            budgetLabel.isHidden = true
        }
        
        if let homepage = movie.homepage, homepage.count > 0 {
            homePageButton.isHidden = false
        } else {
            homePageButton.isHidden = true
        }
        //homePageButton.isHidden = (movie.homepage == nil)
    }
    
    
    @IBAction func homePageAction(_ sender: Any) {
        guard let urlString = self.movie?.homepage,
            let url = URL(string: urlString) else {
                return
        }
        
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
    

}
