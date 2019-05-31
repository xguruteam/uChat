//
//  TypingIndicatorCell.swift
//  Avalon-Print
//
//  Created by Luccas Beck on 5/19/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit
import FLAnimatedImage

class TypingIndicatorCell: UICollectionViewCell {
  
  var typingIndicator: FLAnimatedImageView = {
    var typingIndicator = FLAnimatedImageView()
  
    typingIndicator.backgroundColor = .clear
  
    return typingIndicator
  }()

  override init(frame: CGRect) {
    super.init(frame: frame.integral)

    addSubview(typingIndicator)
    typingIndicator.frame = CGRect(x: 10, y: 0, width: 65, height: 40).integral
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    typingIndicator.image = nil
  }
}
