//
//  AuthVerificationController.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit


class AuthVerificationController: EnterVerificationCodeController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setRightBarButton(with: "Next")
  }
  
  override func rightBarButtonDidTap() {
    super.rightBarButtonDidTap()
    authenticate()
  }
}
