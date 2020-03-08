//
//  CreateRoomViewController.swift
//  ForumApp
//
//  Created by Teacher on 08/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class CreateRoomViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //open keyboard
        textField.becomeFirstResponder()
    }
    
    @IBAction func tapAction(_ sender: Any) {
        //close keyboard
        textField.resignFirstResponder()
    }
    
    @IBAction func selectImageAction(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        func handler(_ action : UIAlertAction) {
            //open image picker
            let picker = UIImagePickerController()
            picker.delegate = self
            
            if action.title == "Camera" && UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
            } else {
                picker.sourceType = .photoLibrary
            }
            
            self.present(picker, animated: true, completion: nil)
        }
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: handler))
        actionSheet.addAction(UIAlertAction(title: "Album", style: .destructive, handler: handler))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func createRoomAction(_ sender: Any) {
        guard let name = textField.text, name.count > 0 else {
            return
        }
        
        let image = imageView.image
        
        FirebaseManager.manager.createChatroom(with: name, image: image) { [weak self](success) in
            guard let self = self else { return }
            if !success {
                print("failed")
                return
            }
            
            //do 'back'
            self.navigationController?.popViewController(animated: true)
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

extension CreateRoomViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
