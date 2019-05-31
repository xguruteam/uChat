//
//  OnboardingController.swift
//  uChat-project
//
//  Created by Luccas Beck on 5/27/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {

  let onboardingContainerView = OnboardingContainerView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = ThemeManager.currentTheme().generalBackgroundColor
    view.addSubview(onboardingContainerView)
    onboardingContainerView.frame = view.bounds
    setColorsAccordingToTheme()
  }
  
  fileprivate func setColorsAccordingToTheme() {
    let theme = ThemeManager.currentTheme()
    ThemeManager.applyTheme(theme: theme)
    view.backgroundColor = ThemeManager.currentTheme().generalBackgroundColor
    onboardingContainerView.backgroundColor = view.backgroundColor
  }
  
  @objc func startMessagingDidTap () {
    let destination = AuthPhoneNumberController()
    navigationController?.pushViewController(destination, animated: true)
  }

}
