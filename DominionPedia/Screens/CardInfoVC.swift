//
//  CardInfoVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/28/21.
//

import UIKit

protocol CardInfoVCDelegate: AnyObject {
    func didTapCardInfo(for card: Card)
    func didTapGetExpansion(for card: Card)
}

class CardInfoVC: UIViewController {

    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    
    let callToSafariButton = DPButton(color: .purple, title: "Get More Info", systemImage: SFSymbolString.search)
    let callToExpansionButton = DPButton(color: .blue, title: "Get Expansion List", systemImage: SFSymbolString.book)
    
    weak var delegate: CardsVCDelegate!
    
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
        configureViewController()
        configureCallToSafariButton()
        configureCallToExpansionButton()
        layoutUI()
        configureUIElements(with: card)
        imageFullScreen()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = doneButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureUIElements(with card: Card) {
        self.add(childVC: DPUserInfoHeaderVC(card: card), to: self.headerView)
    }
    
    func configureCallToSafariButton() {
        view.addSubview(callToSafariButton)
        callToSafariButton.addTarget(self, action: #selector(didTapSafariButton), for: .touchUpInside)
    }
    
    func configureCallToExpansionButton() {
        view.addSubview(callToExpansionButton)
        callToExpansionButton.addTarget(self, action: #selector(didTapExpansionButton), for: .touchUpInside)
    }
    
    @objc func didTapSafariButton() {
        showLoadingView()
        
        let url = cardToURL(with: card)
        
        guard let checkUrl = url else {
            presentDPAlertOnMainThread(title: "Inavlid URL", message: "URL With this card is Invalid", buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: checkUrl)
        dismissLoadingView()
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let buttonHeight: CGFloat = 50
        
        view.addSubview(headerView)
        view.addSubview(itemViewOne)
        view.addSubview(itemViewTwo)
    
        headerView.translatesAutoresizingMaskIntoConstraints = false
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 400),
            
            callToSafariButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            callToSafariButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            callToSafariButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            callToSafariButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            callToExpansionButton.topAnchor.constraint(equalTo: callToSafariButton.bottomAnchor, constant: padding),
            callToExpansionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            callToExpansionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            callToExpansionButton.heightAnchor.constraint(equalToConstant: buttonHeight)

        ])
    }
    
    func imageFullScreen() {
        
        headerView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        headerView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        presentImageFullScreenOnMainThread(cardName: card.cardName)
    }
    
    @objc func addButtonTapped() {
        
        PersistenceManager.updateWith(favorite: card, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            
            guard let error = error else {
                self.presentDPAlertOnMainThread(title: "Sucess!", message: "You have successfully added this user", buttonTitle: "OK")
                return
            }
            self.presentDPAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
        }
    }
    
    @objc func didTapExpansionButton() {
        var setName = card.setName
        
        if setName == "Dark Ages" {
            setName = "dark"
        }
        
        let cardsVC = CardsVC(expansionName: setName, endpoint: DominionEndPoints.Expansion)
        navigationController?.pushViewController(cardsVC, animated: true)
    }
}

extension CardInfoVC: CardInfoVCDelegate {
    func didTapCardInfo(for card: Card) {
        print("CardInfo Tapped")
    }
    
    func didTapGetExpansion(for card: Card) {
        print("Get Expansion Tapped")
    }
    
    
}
