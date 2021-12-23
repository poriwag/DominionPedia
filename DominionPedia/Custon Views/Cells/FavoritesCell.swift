//
//  FavoritesCell.swift
//  DominionPedia
//
//  Created by billy pak on 8/1/21.
//

import UIKit

class FavoritesCell: UITableViewCell {

    static let reuseID = "FavoriteCell"
    
    let avatarImageView = DPCardImageView(frame: .zero)
    let usernameLabel = DPTitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        
        let padding :CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(favorites: Card) {
        usernameLabel.text = favorites.cardName
        avatarImageView.image = loadImage(card: favorites)
    }
    
    func loadImage(card: Card) -> UIImage {
        
        let imageText = UIHelper.convertSpaceWithDash(str: card.cardName)
        if let image = UIImage(named: imageText) {
            return image
        }
        return UIImage(named: "CardBack")!
    }

}
