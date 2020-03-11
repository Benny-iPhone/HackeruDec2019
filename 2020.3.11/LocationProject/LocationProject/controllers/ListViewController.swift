//
//  ListViewController.swift
//  LocationProject
//
//  Created by Teacher on 11/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

class ListViewController: UIViewController {

    var tableArray : [PointOfInterest] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshData()

        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleLocationUpdateNotification(_:)), name: .locationUpdate, object: nil)
    }
    
    @objc func handleLocationUpdateNotification(_ note : Notification) {
        refreshData()
        tableView.reloadData()
    }
    
    private func refreshData() {
        self.tableArray = DataManager.manager.poiArray
        guard let userLocation = UserLocationManager.manager.location else {
            //do not sort if user location is nil
            return
        }
        
        self.tableArray.sort { (poi1, poi2) -> Bool in
            let dist1 = userLocation.distance(from: poi1.location)
            let dist2 = userLocation.distance(from: poi2.location)
            return dist1 < dist2
        }
        
        //or use this...
//        self.tableArray.sort {
//            return userLocation.distance(from: $0.location) <  userLocation.distance(from: $1.location)
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            let detailsVC = segue.destination as? PoiDetailsViewController {
            detailsVC.poi = tableArray[indexPath.row]
        }
    }
    
}


extension ListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let poi = tableArray[indexPath.row]
        
        cell.textLabel?.text = poi.title
        
        if let userLocation = UserLocationManager.manager.location {
            let distance = userLocation.distance(from: poi.location) //meters
            cell.detailTextLabel?.text = String(format: "%.2f km", distance / 1000)
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
        
    }
}












