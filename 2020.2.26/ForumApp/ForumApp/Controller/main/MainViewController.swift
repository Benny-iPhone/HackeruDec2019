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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showGreeting()
        
        Chatroom(title: "Test Chatroom")?.save()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
