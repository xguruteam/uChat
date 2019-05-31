//
//  CreateProfileController+keyboardHandlers.swift
//  uChat-project
//
//  Created by Luccas Beck on 5/28/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
