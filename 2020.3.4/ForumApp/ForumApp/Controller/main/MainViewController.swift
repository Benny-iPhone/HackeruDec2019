//
//  MainViewController.swift
//  ForumApp
//
//  Created by Teacher on 26/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    var tableArray : [Chatroom] = []
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showGreeting()
        
        //Chatroom(title: "Test Chatroom")?.save()
        tableView.dataSource = self
        tableView.delegate = self
        
        loadData()
    }
    
    private func loadData() {
        FirebaseManager.manager.getAllChatrooms { [weak self](chatrooms) in
            guard let self = self else { return }
            
            self.tableArray = chatrooms
            self.tableView.reloadData()
        }
    }
    
    private func showGreeting() {
        //obtain user's display name
        guard let nickname = Auth.auth().currentUser?.displayName else {
            return
        }
        
        //show it on navigation item
        navigationItem.title = "Hello " + nickname
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            FlowController.shared.determineRoot()
        } catch {
            print(error)
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Create Chatroom", message: nil, preferredStyle: .alert)
        
        alert.addTextField {
            $0.placeholder = "Chatroom name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let createAction = UIAlertAction(title: "Create", style: .default) { (_) in
            //.. create stuff goes here
            guard let title = alert.textFields?.first?.text, title.count > 0 else {
                return
            }
            
            FirebaseManager.manager.createChatroom(with: title)
            
        }
        alert.addAction(createAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let nextVC = segue.destination as? ChatMessagesViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            nextVC.room = tableArray[indexPath.row]
            
        }
        
    }
    

}

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let room = tableArray[indexPath.row]
        cell.textLabel?.text = room.title
        cell.detailTextLabel?.text = "Created by " + room.ownerName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let currentUid = FirebaseManager.manager.userId else {
            //user not logged in
            return false
        }
        
        //user can delete chatroom only if he is the owner
        return tableArray[indexPath.row].owner == currentUid
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        //remove from array
        let room = tableArray.remove(at: indexPath.row)
        
        //remove from firebase
        FirebaseManager.manager.deleteChatroom(room)
        
        //remove from tableview
        tableView.deleteRows(at: [indexPath], with: .left)
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
 
        //show next view controller using code
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "detailsVC") else {
//            return
//        }
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
