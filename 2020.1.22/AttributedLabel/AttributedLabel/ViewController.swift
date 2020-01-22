//
//  ViewController.swift
//  AttributedLabel
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var creditLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateCredit(100)
    }
    
    private func updateCredit(_ credit : Int) {
        
        let fullText = "Credit \(credit)"
        
        let attString = NSMutableAttributedString(string: fullText)
        let spaceRange : NSRange = (fullText as NSString).range(of: " ")
        let endOfSpace = spaceRange.length + spaceRange.location
        let strLen = (fullText as NSString).length
        let creditRange = NSRange(location: endOfSpace, length: strLen - endOfSpace)
        
        let attributes : [NSAttributedString.Key:Any] = [
            .font               : UIFont.boldSystemFont(ofSize: 24),
            .foregroundColor    : UIColor.systemYellow,
            .backgroundColor    : UIColor.black.withAlphaComponent(0.6),
            .underlineStyle     : NSUnderlineStyle.single.rawValue
        ]
        
        attString.addAttributes(attributes, range: creditRange)
        
        creditLabel.attributedText = attString
    }


}

