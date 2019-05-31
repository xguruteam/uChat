//
//  AddGroupMembersController.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

class AddGroupMembersController: SelectParticipantsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupRightBarButton(with: "Add")
    setupNavigationItemTitle(title: "Add users")
  }
  
  override func rightBarButtonTapped() {
    super.rightBarButtonTapped()
    
    addNewMembers()
  }
}
