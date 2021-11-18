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
    
//    static func createCardCollectionFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
//        let itemHeight = 200
//        let itemWidth = 100
//
//        let flowLayout = UICollectionViewFlowLayout()
//
//
//        return flowLayout
//    }
}

class CardCollectionFlowLayout: UICollectionViewFlowLayout {
    let itemHeight = 200
    let itemWidth = 100
    let inset: CGFloat = 100
    //prepare() method is called to tell the collectionView layout object to update
    //layout updates occur first time collectionView presets its content or invalidated

    override func prepare() {
        guard let collectionView = collectionView else { return }
        

        scrollDirection = .horizontal
        itemSize = CGSize(width: collectionView.frame.size.width - inset * 2, height: collectionView.frame.size.height)
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        minimumLineSpacing = 0
        

//        let peekingItemWidth = itemSize.width / 10
//        let horizontalInsets = (collectionView.frame.size.width - itemSize.width) / 2
//
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0 , right: 20)
    }
}


class PagingCollectionViewLayout: UICollectionViewFlowLayout {
    
    var velocityThresholdPerPage: CGFloat = 2
    var numberOfItemsPerPage: CGFloat = 1
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let pageLength: CGFloat
        let approxPage: CGFloat
        let currentPage: CGFloat
        let speed: CGFloat
        
        if scrollDirection == .horizontal {
            pageLength = (self.itemSize.width + self.minimumLineSpacing) * numberOfItemsPerPage
            approxPage = collectionView.contentOffset.x / pageLength
            speed = velocity.x
        } else {
            pageLength = (self.itemSize.height + self.minimumLineSpacing) * numberOfItemsPerPage
            approxPage = collectionView.contentOffset.y / pageLength
            speed = velocity.y
        }
        
        
        
        if speed < 0 {
            currentPage = ceil(approxPage)
        } else if speed > 0 {
            currentPage = floor(approxPage)
        } else {
            currentPage = round(approxPage)
        }
        
        guard speed != 0 else {
            if scrollDirection == .horizontal {
                return CGPoint(x: currentPage * pageLength, y: 0)
            } else {
                return CGPoint(x: 0, y: currentPage * pageLength)
            }
        }
        
        var nextPage: CGFloat = currentPage + (speed > 0 ? 1 : -1)
        
        let increment = speed / velocityThresholdPerPage
        nextPage += (speed < 0) ? ceil(increment) : floor(increment)
        
        if scrollDirection == .horizontal {
            return CGPoint(x: nextPage * pageLength, y: 0)
        } else {
            return CGPoint(x: 0, y: nextPage * pageLength)
        }
    }
}
