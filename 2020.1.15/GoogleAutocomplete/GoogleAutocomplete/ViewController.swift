//
//  ViewController.swift
//  GoogleAutocomplete
//
//  Created by Teacher on 15/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController , GMSAutocompleteViewControllerDelegate{
    @IBOutlet weak var label: UILabel!

    @IBAction func buttonAction(_ sender: Any) {
        let vc = GMSAutocompleteViewController()
        vc.delegate = self
        
        vc.placeFields = .all
        
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        filter.country = "il"
        vc.autocompleteFilter = filter
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        label.text = place.name
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}

