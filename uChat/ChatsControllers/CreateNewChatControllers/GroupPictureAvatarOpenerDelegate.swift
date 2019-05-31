//
//  GroupPictureAvatarOpenerDelegate.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/13/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

extension GroupProfileTableViewController: AvatarOpenerDelegate {
  func avatarOpener(avatarPickerDidPick image: UIImage) {
    groupProfileTableHeaderContainer.profileImageView.image = image
  }
  
  func avatarOpener(didPerformDeletionAction: Bool) {
    groupProfileTableHeaderContainer.profileImageView.image = nil
  }
}
