//
//  ViewController.swift
//  TheMovieDBSample
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var tableArray : [Movie] = []
    @IBOutlet weak var tableView: UITableView!
    let networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        fetchData()
    }
    
    private func fetchData() {
        networking.discoverMovies { [weak self](movies) in
            guard let self = self else { return }
            
            self.tableArray = movies
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        cell.populate(with: self.tableArray[indexPath.row])
        
        return cell
    }


}

