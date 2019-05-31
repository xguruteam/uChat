//
//  UIImageView+uChat.swift
//  uChat-project
//
//  Created by Guru on 5/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
