//
//  UIHelper.swift
//  DominionPedia
//
//  Created by billy pak on 7/30/21.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        
        let avaliableWidth = width - (padding * 3) - (minimumItemSpacing * 2)
        let itemWidth = avaliableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 90)
        
        
        return flowLayout
    }
    
    static func convertSpaceWithDash(str: String) -> String {
        let result = str.replacingOccurrences(of: " ", with: "-").lowercased()
        return result
    }
}
