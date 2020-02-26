//
//  SearchMoviesViewController.swift
//  SearchMovies
//
//  Created by Teacher on 19/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import PKHUD
import CCBottomRefreshControl

class SearchMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    var collectionArray : [Movie] = []
    let networking = Networking()
    var page : Int = 1
    var currentQuery : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Movie Title"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
        searchBar.becomeFirstResponder()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.triggerVerticalOffset = 60
        refreshControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        self.collectionView.bottomRefreshControl = refreshControl
    }
    
    @objc func loadNextPage() {
        self.page += 1
        loadData()
    }
    
    private func loadData() {
        guard let query = self.currentQuery, query.count > 0 else {
            self.collectionArray = []
            self.collectionView.reloadData()
            return
        }
        
        //show progress
        HUD.show(.progress)
        //fetch data from server
        networking.searchMovies(with: query, page: self.page) { [weak self](result) in
            guard let self = self else { //view controller still alive
                return
            }
            
            //remove progress
            self.collectionView.bottomRefreshControl?.endRefreshing()
            HUD.hide(animated: true)
            
            //handle result
            switch result {
            case .failure(let error):
                HUD.flash(.labeledError(title: error.localizedDescription, subtitle: nil), delay: 3)
            case .success(let movies):
                if self.page == 1 {
                    self.collectionArray = movies
                } else {
                    self.collectionArray += movies
                }
                self.collectionView.reloadData()
                print(movies)
            }
            
        }
    }
    
}

extension SearchMoviesViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        
        cell.populate(with: collectionArray[indexPath.item])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //create
        guard let detailsVC = self.storyboard?.instantiateViewController(identifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            return
        }
        
        //pass data
        detailsVC.movie = collectionArray[indexPath.item]
        
        //show
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
}


extension SearchMoviesViewController : UISearchBarDelegate {
    //Cancel
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //close keyboard
        searchBar.resignFirstResponder()
        //'refresh' data
        self.currentQuery = nil
        self.page = 1
        loadData()
    }
    
    //Search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //close keyboard
        searchBar.resignFirstResponder()
        //refresh data
        self.currentQuery = searchBar.text
        self.page = 1
        loadData()
    }
    
}
