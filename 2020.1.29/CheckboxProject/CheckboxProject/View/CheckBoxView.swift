//
//  CheckBoxView.swift
//  CheckboxProject
//
//  Created by Teacher on 29/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class CheckBoxView: UIImageView {

    //MARK: - Sub Types -
    
    enum State {
        case checked
        case unchecked
        
        var imageName : String {
            switch self {
            case .checked: return "icons8-checked_checkbox"
            case .unchecked: return "icons8-unchecked_checkbox"
            }
        }
        
        func nextState() -> State {
            switch self {
            case .checked: return .unchecked
            case .unchecked: return .checked
            }
        }
    }
    
    //MARK: - Properties -
    
    var state : State = .unchecked {
        didSet {
            stateRefreshed()
        }
    }
    
    //MARK: - Init -

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        //create gesture
        self.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.addGestureRecognizer(tapGesture)
        
        //update UI
        stateRefreshed()
    }
    
    //MARK: - UI Logic -
    
    @objc func tapAction(_ sender : Any) {
        self.state = state.nextState()
    }
    
    private func stateRefreshed() {
        self.image = UIImage(named: state.imageName)
    }
    
}
