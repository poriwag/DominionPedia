//
//  CardListCell.swift
//  DominionPedia
//
//  Created by billy pak on 8/6/21.
//

import UIKit

class CardListCell: UICollectionViewCell {
    
    static let reuseID = "CardListCell"
    
    let avatarImageView = DPCardImageView(frame: .zero)
    let cardNameLabel = DPTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureAvatarImageView()
        configureUserNameLabel()
    }
    
    func set(card: Card) {
        cardNameLabel.text = card.cardName
        avatarImageView.image = loadImage(card: card)
    }
    
    func loadImage(card: Card) -> UIImage {
        
        let imageText = UIHelper.convertSpaceWithDash(str: card.cardName)
        if let image = UIImage(named: imageText) {
            return image
        }
        return UIImage(named: "CardBack")!
    }
    
    private func configureAvatarImageView() {
        addSubview(avatarImageView)
        
        let padding: CGFloat = 8
        let height = CGFloat(avatarImageView.frame.width) + 150
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    private func configureUserNameLabel() {
        addSubview(cardNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            cardNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            cardNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cardNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cardNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
