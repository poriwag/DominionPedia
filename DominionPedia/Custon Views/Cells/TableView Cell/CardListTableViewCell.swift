//
//  CardListTableViewCell.swift
//  DominionPedia
//
//  Created by billy pak on 11/24/21.
//

import UIKit

class CardListTableViewCell: UITableViewCell {

    static let reuseID = "CardListTableViewCell"
    
    let cardImageView = DPCardImageView(frame: .zero)
    let usernameLabel = DPTitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configure() {
        addSubview(cardImageView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        
        let padding :CGFloat = 12
        
        NSLayoutConstraint.activate([
            cardImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            cardImageView.heightAnchor.constraint(equalToConstant: 90),
            cardImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(card: Card) {
        usernameLabel.text = card.cardName
        cardImageView.image = loadImage(card: card)
    }
    
    func loadImage(card: Card) -> UIImage {
        
        let imageText = UIHelper.convertSpaceWithDash(str: card.cardName)
        if let image = UIImage(named: imageText) {
            return image
        }
        return UIImage(named: "CardBack")!
    }

}
