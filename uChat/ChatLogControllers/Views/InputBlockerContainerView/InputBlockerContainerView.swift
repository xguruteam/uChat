//
//  InputBlockerContainerView.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/25/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

class InputBlockerContainerView: UIView {
  
  let backButton: UIButton = {
    let backButton = UIButton()
    backButton.setTitleColor(FalconPalette.dismissRed, for: .normal)
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.setTitle("Delete and Exit", for: .normal)
    backButton.backgroundColor = .clear
    
    return backButton
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = ThemeManager.currentTheme().inputTextViewColor
    
    addSubview(backButton)
    backButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
    backButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    backButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    backButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
