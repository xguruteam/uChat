//
//  OnlineStatusView.swift
//  uChat-project
//
//  Created by Guru on 5/29/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

@IBDesignable
class OnlineStatusView: UIView {
    enum OnlineStatus {
        case online
        case away
        case offline
    }
    
    let innerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    var status: OnlineStatus = .offline
    
    func setOnlineStatus(onlineStatusObject: AnyObject) {
        if let onlineStatusStringStamp = onlineStatusObject as? String {
            if onlineStatusStringStamp == statusOnline { // user online
                status = .online
            } else { // user got a timstamp converted to string (was in earlier versions of app)
                status = .away
            }
        } else if let onlineStatusTimeIntervalStamp = onlineStatusObject as? TimeInterval {
            status = .away
        }
        setNeedsLayout()
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    private func configure() {
        
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.0
        backgroundColor = UIColor(hexString: "#34C083")

        addSubview(innerView)
//        innerView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        innerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        innerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -8).isActive = true
        innerView.heightAnchor.constraint(equalTo: heightAnchor, constant: -8).isActive = true
        innerView.backgroundColor = .white
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width / 2.0
        innerView.layer.cornerRadius = innerView.bounds.size.width / 2.0
        

        switch status {
        case .online:
            isHidden = false
            innerView.isHidden = true
        case .away:
            isHidden = false
            innerView.isHidden = false
        default:
            isHidden = true
            innerView.isHidden = true
        }
    }
}
