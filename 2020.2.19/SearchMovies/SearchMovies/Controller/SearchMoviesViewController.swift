//
//  SearchMoviesViewController.swift
//  SearchMovies
//
//  Created by Teacher on 19/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import PKHUD

class SearchMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    var collectionArray : [Movie] = []
    let networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = "Movie Title"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
        searchBar.becomeFirstResponder()
    }
    
    private func load(with query : String?) {
        guard let query = query, query.count > 0 else {
            self.collectionArray = []
            self.collectionView.reloadData()
            return
        }
        
        //show progress
        HUD.show(.progress)
        //fetch data from server
        networking.searchMovies(with: query) { [weak self](result) in
            guard let self = self else { //view controller still alive
                return
            }
            
            //remove progress
            HUD.hide(animated: true)
            
            //handle result
            switch result {
            case .failure(let error):
                HUD.flash(.labeledError(title: error.localizedDescription, subtitle: nil), delay: 3)
            case .success(let movies):
                self.collectionArray = movies
                self.collectionView.reloadData()
                print(movies)
            }
            
        }
    }
    
}

extension SearchMoviesViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        
        cell.populate(with: collectionArray[indexPath.item])
        
        return cell
        
    }
}


extension SearchMoviesViewController : UISearchBarDelegate {
    //Cancel
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //close keyboard
        searchBar.resignFirstResponder()
        //'refresh' data
        load(with: nil)
    }
    
    //Search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //close keyboard
        searchBar.resignFirstResponder()
        //refresh data
        load(with: searchBar.text)
    }
    
}
