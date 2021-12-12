//
//  CardRandomizerCell.swift
//  DominionPedia
//
//  Created by billy pak on 11/13/21.
//

import UIKit
import ViewAnimator

class CardRandomizerCell: UICollectionViewCell {
    
    static let reuseID = "CardRandomizerCell"
    
    let cardImage = DPCardImageView(frame: .zero)
    let cardNameLabel = DPTitleLabel(textAlignment: .center, fontSize: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
        //cardImage.frame = contentView.frame
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
        cardImage.image = loadImage(card: card)
    }
    
    func loadImage(card: Card) -> UIImage {
        
        let imageText = UIHelper.convertSpaceWithDash(str: card.cardName)
        if let image = UIImage(named: imageText) {
            return image
        }
        return UIImage(named: "CardBack")!
    }
    
    private func configureAvatarImageView() {
        addSubview(cardImage)
        
        let padding: CGFloat = 8
        let height = CGFloat(cardImage.frame.width) + 150
        
        
        
        NSLayoutConstraint.activate([
            cardImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configureUserNameLabel() {
        addSubview(cardNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            cardNameLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 12),
            cardNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cardNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cardNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1.3
        }
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func transFormToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.layer.borderWidth = 0
            self.transform = CGAffineTransform.identity
        }
    }
}
