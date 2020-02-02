//
//  ViewController.swift
//  Dialer
//
//  Created by Teacher on 02/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Digit : Int {
        case zero, one, two, three, four, five, six, seven, eight, nine
        case asterix, sharp
        
        var displayString : String {
            switch self {
            case .zero: return "\u{6f0}"
            case .one: return "\u{6f1}"
            case .two: return "\u{6f2}"
            case .three: return "\u{6f3}"
            case .four: return "\u{6f4}"
            case .five: return "\u{6f5}"
            case .six: return "\u{6f6}"
            case .seven: return "\u{6f7}"
            case .eight: return "\u{6f8}"
            case .nine: return "\u{6f9}"
            case .asterix: return "﹡"
            case .sharp: return "#"
            }
        }
    }
    
    var text : String = ""{
        didSet{
            label.text = text
        }
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet var digitButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = " "

        for button in (digitButtons ?? []) {
            //styling...
            button.layer.cornerRadius = 16
            button.layer.masksToBounds = true
            button.layer.borderWidth = 1
            button.layer.borderColor = button.tintColor.cgColor
            
            //hook IBAction progromatically
            button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        }
        
        label.adjustsFontSizeToFitWidth = true
    }

    @objc func buttonPressed(_ sender : UIButton) {
        guard let digit = Digit(rawValue: sender.tag) else {
            print("unsportted tag \(sender.tag)")
            return
        }
        
        text += digit.displayString
    }

}

