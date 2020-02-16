//
//  ItemsViewController.swift
//  PasswordManager
//
//  Created by Teacher on 16/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController , UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var results : Results<PasswordItem>! = nil
    var notificationToken : NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.results = DBManager.manager.getObjects(sort: "title")
        
        self.notificationToken = results.observe({ [weak self](change) in
            guard let self = self else { return }
            self.tableView.reloadData()
        })
    }
    
    deinit {
        self.notificationToken?.invalidate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        
        let item : PasswordItem = results[indexPath.row]
        cell.populate(with: item)
        //cell.textLabel?.text = item.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        DBManager.manager.remove(object: results[indexPath.row])
    }
}
