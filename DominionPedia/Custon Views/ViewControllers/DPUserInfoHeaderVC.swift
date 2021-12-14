//
//  DPUserInfoHeaderVC.swift
//  DominionPedia
//
//  Created by billy pak on 8/29/21.
//

import UIKit

class DPUserInfoHeaderVC: UIViewController {
    
    let avatarImageView = DPCardImageView(frame: .zero)
    let cardNameLabel = DPTitleLabel(textAlignment: .left, fontSize: 34)
    let expansionLabel = DPSecondaryTitleLabel(fontSize: 18)
    let cardCostImageView = UIImageView()
    let cardCostLabel = DPSecondaryTitleLabel()
    let cardTypeLabel = DPSecondaryTitleLabel(fontSize: 18)
    let cardTextLabel = DPBodyLabel(textAlignment: .left)

    var card: Card!
    
    init(card: Card) {
        super.init(nibName: nil, bundle: nil)
        self.card = card
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        layoutUI()
        configureUIElements()
    }
    
    func addSubview() {
        view.addSubview(avatarImageView)
        view.addSubview(cardNameLabel)
        view.addSubview(expansionLabel)
        view.addSubview(cardCostImageView)
        view.addSubview(cardCostLabel)
        view.addSubview(cardTypeLabel)
        view.addSubview(cardTextLabel)
        
        cardCostImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        let textRowPadding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
          
            cardNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            cardNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            cardNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cardNameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            expansionLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: textRowPadding),
            expansionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            expansionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            expansionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            cardCostImageView.topAnchor.constraint(equalTo: expansionLabel.bottomAnchor, constant: textRowPadding),
            cardCostImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            cardCostImageView.widthAnchor.constraint(equalToConstant: 20),
            cardCostImageView.heightAnchor.constraint(equalToConstant: 20),
            
            cardCostLabel.centerYAnchor.constraint(equalTo: cardCostImageView.centerYAnchor),
            cardCostLabel.leadingAnchor.constraint(equalTo: cardCostImageView.trailingAnchor, constant: 5),
            cardCostLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cardCostLabel.heightAnchor.constraint(equalToConstant: 20),
            
            cardTextLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            cardTextLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            cardTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cardTextLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureUIElements() {
        let cardText:String = card.cardText.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\d", with: "\n")
        
        
        avatarImageView.loadImage(card: card)
        cardNameLabel.text = card.cardName
        expansionLabel.text = card.setName
        cardCostLabel.text = card.cost
        cardTextLabel.text = cardText
        cardTextLabel.numberOfLines = 0
        
        //sf sumbols setup
        cardCostImageView.image = SFSymbols.money
        cardCostImageView.tintColor = .secondaryLabel
    }
    

}
