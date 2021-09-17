//
//  UIImage+Ext.swift
//  DominionPedia
//
//  Created by billy pak on 9/9/21.
//

import UIKit


extension UIImageView {
    
    func loadImage(card: Card) {
        
        let imageText = UIHelper.convertSpaceWithDash(str: card.cardName)
        guard let avatar = UIImage(named: imageText) else {
            image = Images.defaultImage!
            return
        }
        image = avatar
    }
    
    func loadImage(name cardName: String) {
        
        let imageText = UIHelper.convertSpaceWithDash(str: cardName)
        guard let avatar = UIImage(named: imageText) else {
            image = Images.defaultImage!
            return
        }
        image = avatar
    }
}
