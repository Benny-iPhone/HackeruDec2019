//
//  ViewController.swift
//  MultiThreading
//
//  Created by Teacher on 15/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var indicatorView : UIActivityIndicatorView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        print(#function)
        
        //asyncDelayedOperationOnMainQueue()
        //syncVsAsyncOperationDemo()
        performShortBackgroundOperation()
    }
    
    private func performShortBackgroundOperation() {
        print(#function)
        //DispatchQueue.global(qos: .)
        DispatchQueue.global().async {
            //read very long file
            sleep(1)
            guard let url = Bundle.main.url(forResource: "MOCK_DATA_FIXED", withExtension: "json") else {
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            DispatchQueue.main.async {
                self.label.text = "\(data.count) bytes"
                self.label.sizeToFit()
            }
        }
        
    }
    
    
    
    private func syncVsAsyncOperationDemo() {
        DispatchQueue.main.async {
            print("async operation")
        }
                
        print("going to sleep")
        sleep(1)
        print("woke up")
    }
    
    private func asyncDelayedOperationOnMainQueue() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print("show 42")
            self.label.text = "42"
        }
    }
    
    @IBAction func malfunctionInitProcess(_ sender: Any) {
        
        indicatorView.startAnimating()
        
        let queue = DispatchQueue.global() //concurrent
        queue.async {
            self.dataManagerLoad()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            queue.async {
                self.dataManagerLoad()
            }
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//
//            self.indicatorView.stopAnimating()
//        }
        
        print("animation started")
        
    }
    
    private func dataManagerLoad() {
        DataManager.manager.loadDataFromDisk()
        if Thread.isMainThread {
            self.indicatorView.stopAnimating()
        } else {
            DispatchQueue.main.async {
                self.indicatorView.stopAnimating()
            }
        }
    }
    
    var myNumbers : [Int] = []

    @IBAction func balaganArrayAction(_ sender: Any) {
        
        //cleanup
        myNumbers.removeAll()
        
        for i in 0...100 {
            DispatchQueue.global().async { 
                self.myNumbers.append(i)
            }
        }
        
        //wrong place because append take place async
        //print("first :\(self.myNumbers)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print(self.myNumbers)
        }
        
    }
}

