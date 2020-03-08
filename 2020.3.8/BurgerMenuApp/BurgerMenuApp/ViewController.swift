//
//  ViewController.swift
//  BurgerMenuApp
//
//  Created by Teacher on 08/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetVC = segue.destination as? SideMenuNavigationController,
            let menuVC = targetVC.viewControllers.first as? MenuTableViewController{
            targetVC.statusBarEndAlpha = 1
            menuVC.delegate = self
        }
    }
}

extension ViewController : MenuTableViewControllerDelegate {
    private var tabBarVC : UITabBarController? {
        return children.compactMap{ $0 as? UITabBarController}.first
    }
    
    func menuTableViewController(_ controller: MenuTableViewController, didSelectItem item: MenuTableViewController.MenuItem) {
        
        //close menu
        SideMenuManager.default.leftMenuNavigationController?.dismiss(animated: true, completion: nil)
        //handle item
        tabBarVC?.selectedIndex = item.rawValue
    }
}

