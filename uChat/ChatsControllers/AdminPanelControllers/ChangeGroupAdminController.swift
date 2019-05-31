//
//  ChangeGroupAdminController.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

class ChangeGroupAdminController: SelectNewAdminTableViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupRightBarButton(with: "Change administrator")
  }
  
  override func rightBarButtonTapped() {
    super.rightBarButtonTapped()
    setNewAdmin(membersIDs: getMembersIDs())
  }
}
