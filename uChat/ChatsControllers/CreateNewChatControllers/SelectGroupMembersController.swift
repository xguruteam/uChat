//
//  SelectGroupMembersController.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit


class SelectGroupMembersController: SelectParticipantsViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupRightBarButton(with: "Next")
    setupNavigationItemTitle(title: "New group")
  }
  
  override func rightBarButtonTapped() {
    super.rightBarButtonTapped()
    
    createGroup()
  }
}
