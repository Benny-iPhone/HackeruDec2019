//
//  ChatMessagesViewController.swift
//  ForumApp
//
//  Created by Teacher on 01/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ChatMessagesViewController: UIViewController {
    
    var room : Chatroom!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = room.title
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
