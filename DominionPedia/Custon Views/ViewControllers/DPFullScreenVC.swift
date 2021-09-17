//
//  DPFullScreenVC.swift
//  DominionPedia
//
//  Created by billy pak on 9/8/21.
//

import UIKit

class DPFullScreenVC: UIViewController {

    let containerView = DPFullScreenContainerView()
    let titleLabel = DPTitleLabel(textAlignment: .center, fontSize: 20)
    var cardImage = UIImageView()
    
    var cardName: String?
    
    var containerViewHeight: CGFloat = 650
    var containerViewWidth: CGFloat = 400
    
    init(cardName: String) {
        super.init(nibName: nil, bundle: nil)
        self.cardName = cardName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureExitViewController()
        configureTitleLabel()
        configureCardImage()
        dismissFullScreenWithTap()
    }
    

    
    func configureContainerView() {
        view.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: containerViewWidth),
            containerView.heightAnchor.constraint(equalToConstant: containerViewHeight),
            
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = cardName ?? "Something went wrong ( no message)"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
        ])

    }
    
    func configureExitViewController() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close , target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    func configureCardImage() {
        containerView.addSubview(cardImage)
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImage.loadImage(name: cardName ?? Strings.cardBack)
    
        NSLayoutConstraint.activate([
            cardImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            cardImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            cardImage.widthAnchor.constraint(equalToConstant: containerViewWidth),
            cardImage.heightAnchor.constraint(equalToConstant: containerViewHeight),
            
        ])
    }
    
    func dismissFullScreenWithTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
