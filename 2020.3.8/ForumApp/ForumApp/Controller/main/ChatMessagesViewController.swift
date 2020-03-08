//
//  ChatMessagesViewController.swift
//  ForumApp
//
//  Created by Teacher on 01/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import FirebaseUI

class ChatMessagesViewController: UIViewController {
    
    var messages : [ChatMessage] = []
    
    @IBOutlet weak var stackViewBottomLayout: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    
    var room : Chatroom!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hook send action
        textField.addTarget(self, action: #selector(sendAction(_:)), for: .editingDidEndOnExit)

        //show chat room title in screen title
        self.navigationItem.title = room.title
        
        //listen to keyboard open
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardOpen(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        
        //listen to new messages
        FirebaseManager.manager.listenToNewMessage(in: self.room) { [weak self](msg) in
            guard let self = self else { return }
            let rowIndex = self.messages.count
            self.messages.append(msg)
            let rowIndexPath = IndexPath(row: rowIndex, section: 0)
            self.tableView.insertRows(at: [rowIndexPath], with: .automatic)
            //scroll to new message
            self.tableView.scrollToRow(at: rowIndexPath, at: .bottom, animated: true)
            
        }
        
        //set tableview datasource
        self.tableView.dataSource = self
        
        showAvatar()
    }
    
    //show room image on navigation item
    func showAvatar() {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        let button = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = button
        
        let ref = FirebaseManager.manager.getStorageRefence(for: self.room)
        imageView.sd_setImage(with: ref)
    }
    
    deinit {
        //do not listen to room updates any more
        FirebaseManager.manager.stopListen(to: self.room)
        
        //do not listen to keyboard events any more
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //open keyboard
        textField.becomeFirstResponder()
    }
    
    @objc func sendAction(_ sender : UITextField) {
        guard let text = sender.text, text.count > 0 else {
            return
        }
        
        //add message to database
        FirebaseManager.manager.createMessage(with: text, in: room)
        
        //clear text
        sender.text = ""
        //close keyboard
        sender.resignFirstResponder()
        
        //update stackview's bottom
        self.stackViewBottomLayout.constant = 0
        UIView.animate(withDuration: 0.28) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func handleKeyboardOpen(notification : Notification) {
        
        //get keyboard height
        let key = UIResponder.keyboardFrameEndUserInfoKey
        guard let value = notification.userInfo?[key] as? NSValue else {
            return
        }
        
        let height = value.cgRectValue.height
        
        //update UI according to keyboard's height
        self.stackViewBottomLayout.constant = height
        UIView.animate(withDuration: 0.28) {
            self.view.layoutSubviews()
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

extension ChatMessagesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier : String
        if messages[indexPath.row].authorId == FirebaseManager.manager.userId {
            //sent message
            identifier = "cell_out"
        } else {
            //received message
            identifier = "cell_in"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ChatMessageCell
        
        cell.populate(with: messages[indexPath.row])
        //cell.textLabel?.text = messages[indexPath.row].text
        
        return cell
    }
}
