//
//  FlowController.swift
//  ForumApp
//
//  Created by Teacher on 26/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class FlowController {
    //reference to root UI
    weak var window : UIWindow?
    
    //shared instance make this accessible from anywhere
    static let shared = FlowController()
    
    private var didLogin : Bool {
        return Auth.auth().currentUser != nil
    }
    
    //call this method to refresh application root UI (main / login)
    func determineRoot() {
        //1. Validate Main Thread
        guard Thread.isMainThread else {
            //fallback to main thread if not
            DispatchQueue.main.async {
                FlowController.shared.determineRoot()
            }
            return
        }
        
        //2. create storyboard instance
        let storyboard = UIStoryboard(name: didLogin ? "Main" : "Login", bundle: nil)
        
        //3. generate initial (→) view controller
        let initialVC = storyboard.instantiateInitialViewController()
        
        //4. update main UI
        window?.rootViewController = initialVC
        
    }
    
}













