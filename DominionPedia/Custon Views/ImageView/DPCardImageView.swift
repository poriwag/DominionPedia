//
//  DPCardImageView.swift
//  DominionPedia
//
//  Created by billy pak on 7/30/21.
//

import UIKit

class DPCardImageView: UIImageView {

    let placeHolderImage = Images.defaultImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 3
        clipsToBounds = true
        image = placeHolderImage
        contentMode = .scaleAspectFit
    }
    
    func setImage(image: UIImage){
        self.image = image
    }
}


/*   func loadImage(card: Card) {
       
       let imageText = UIHelper.convertSpaceWithDash(str: card.cardName)
       guard let avatar = UIImage(named: imageText) else {
           image = Images.defaultImage
           return
       }
       image = avatar
   } */
