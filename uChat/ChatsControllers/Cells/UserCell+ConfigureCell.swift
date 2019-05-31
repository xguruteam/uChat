//
//  ChatsTableViewController+ConfigureCell.swift
//  uChat-project
//
//  Created by Luccas Beck on 3/14/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

extension UserCell {
  
  func configureCell(for indexPath: IndexPath, conversations: [Conversation]) {
    
    let isPersonalStorage = conversations[indexPath.row].chatID == Auth.auth().currentUser?.uid
    let isConversationMuted = conversations[indexPath.row].muted != nil && conversations[indexPath.row].muted!
    let chatName = isPersonalStorage ? NameConstants.personalStorage : conversations[indexPath.row].chatName
    let isGroupChat = conversations[indexPath.row].isGroupChat ?? false
    
    var placeHolderImage = isGroupChat ? UIImage(named: "GroupIcon") : UIImage(named: "UserpicIcon")
    placeHolderImage = isPersonalStorage ? UIImage(named: "PersonalStorage") : placeHolderImage
    
    nameLabel.text = chatName
    muteIndicator.isHidden = !isConversationMuted
    messageLabel.text = conversations[indexPath.row].messageText()
    
    if let lastMessage = conversations[indexPath.row].lastMessage, let lastStamp = lastMessage.timestamp as? TimeInterval {
      let date = Date(timeIntervalSince1970: lastStamp)
      timeLabel.text = timestampOfLastMessage(date)
    }
  
    profileImageView.image = placeHolderImage
    
//    if let isGroupChat = conversations[indexPath.row].isGroupChat, isGroupChat {
//        if let participantsIds = conversations[indexPath.row].chatParticipantsIDs {
//            for chatID in participantsIds {
//                guard let currentUserID = Auth.auth().currentUser?.uid else { return }
//                if chatID == currentUserID { continue }
//
//                let userDataReference = Database.database().reference().child("users").child(chatID)
//                userDataReference.observeSingleEvent(of: .value, with: { (snapshot) in
//                    guard var dictionary = snapshot.value as? [String: AnyObject] else { return }
//                    dictionary.updateValue(chatID as AnyObject, forKey: "id")
//
//                    let user = User(dictionary: dictionary)
//                    print("group thumb \(user.thumbnailPhotoURL)")
//                })
//            }
//        }
//    }
//    else {
        if let url = conversations[indexPath.row].chatThumbnailPhotoURL, !isPersonalStorage, url != "" {
            profileImageView.sd_setImage(with: URL(string: url), placeholderImage: placeHolderImage, options:
            [.continueInBackground, .scaleDownLargeImages, .avoidAutoSetImage]) { (image, error, cacheType, url) in
                guard image != nil, cacheType != SDImageCacheType.memory, cacheType != SDImageCacheType.disk else {
                    self.profileImageView.image = image
                    return
                }
                
                UIView.transition(with: self.profileImageView, duration: 0.2, options: .transitionCrossDissolve,
                                  animations: { self.profileImageView.image = image }, completion: nil)
            }
        }
        
//    }
    
    if let toId = conversations[indexPath.row].chatID {
        userStatusReference = Database.database().reference().child("users").child(toId)
        userHandler = userStatusReference.observe(.value, with: { (snapshot) in
            guard snapshot.exists() else { print("snapshot not exists returning"); return }
            print("exists")
            
            let value = snapshot.value as? NSDictionary
            let status = value?["OnlineStatus"] as AnyObject
            self.onlineStatusIndicator.setOnlineStatus(onlineStatusObject: status)
        })
    }

    let badgeString = conversations[indexPath.row].badge?.toString()
    let badgeInt = conversations[indexPath.row].badge ?? 0
    
    guard badgeInt > 0, conversations[indexPath.row].lastMessage?.fromId != Auth.auth().currentUser?.uid else {
      newMessageIndicator.isHidden = true
      badgeLabel.isHidden = true
      badgeLabelRightConstraint.constant = 0
      badgeLabelWidthConstraint.constant = badgeLabelRightConstantForHidden
      return
    }
    
    badgeLabel.text = badgeString
//    badgeLabel.isHidden = false
    badgeLabelWidthConstraint.constant = badgeLabelWidthConstant
    badgeLabelRightConstraint.constant = badgeLabelRightConstant
    newMessageIndicator.isHidden = false
    return
  }
}
