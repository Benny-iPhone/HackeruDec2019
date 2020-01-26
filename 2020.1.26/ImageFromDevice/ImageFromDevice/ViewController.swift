//
//  ViewController.swift
//  ImageFromDevice
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraAction(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        
        //setup buttons
        func actionHandler(_ action : UIAlertAction) {
            let title = action.title ?? ""
            
            let imagePicker = UIImagePickerController()
            
            switch title {
            case "Rear Camera":
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    imagePicker.cameraDevice = .rear
                } else {
                    imagePicker.sourceType = .photoLibrary
                }
            case "Selfie Camera":
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    imagePicker.sourceType = .camera
                    imagePicker.cameraDevice = .front
                } else {
                    imagePicker.sourceType = .photoLibrary
                }
            case "Photo Album":
                imagePicker.sourceType = .photoLibrary
            default:
                return
            }
            //make crop possible
            imagePicker.allowsEditing = true
            
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        
        actionSheet.addAction(UIAlertAction(title: "Rear Camera", style: .default, handler: actionHandler(_:)))
        actionSheet.addAction(UIAlertAction(title: "Selfie Camera", style: .default, handler: actionHandler(_:)))
        actionSheet.addAction(UIAlertAction(title: "Photo Album", style: .destructive, handler: actionHandler(_:)))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //present
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage
    
        picker.dismiss(animated: true) {
            self.imageView.image = image
        }
    
    }
    
}
