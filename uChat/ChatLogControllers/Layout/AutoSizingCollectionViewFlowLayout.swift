//
//  AutoSizingCollectionViewFlowLayout.swift
//  Avalon-Print
//
//  Created by Luccas Beck on 4/27/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

var isInsertingCellsToTop: Bool = false
var contentSizeWhenInsertingToTop: CGSize?

class AutoSizingCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  override func prepare() {
    super.prepare()
    minimumLineSpacing = 2
    if isInsertingCellsToTop == true {
      if let collectionView = collectionView, let oldContentSize = contentSizeWhenInsertingToTop {
        let newContentSize = collectionViewContentSize
        let contentOffsetY = collectionView.contentOffset.y + (newContentSize.height - oldContentSize.height)
        let newOffset = CGPoint(x: collectionView.contentOffset.x, y: contentOffsetY)
        collectionView.setContentOffset(newOffset, animated: false)
      }
      contentSizeWhenInsertingToTop = nil
      isInsertingCellsToTop = false
    }
  }
}
