//
//  LeaveGroupAndChangeAdminController.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

class LeaveGroupAndChangeAdminController: SelectNewAdminTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupRightBarButton(with: "Leave the group")
  }
  
  override func rightBarButtonTapped() {
    super.rightBarButtonTapped()
    leaveTheGroupAndSetAdmin()
  }
}
