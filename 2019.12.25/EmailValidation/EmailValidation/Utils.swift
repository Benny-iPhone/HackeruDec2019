//
//  Utils.swift
//  EmailValidation
//
//  Created by Teacher on 25/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import Foundation

extension String {
      var isEmail: Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
         let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
      }
  }
