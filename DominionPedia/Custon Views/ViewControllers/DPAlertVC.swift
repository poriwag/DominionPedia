//
//  DPAlertVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/30/21.
//

import UIKit

class DPAlertVC: UIViewController {

    let containerView = DPAlertContainerView()
    let titleLabel = DPTitleLabel(textAlignment: .center, fontSize: 20)
    let bodyLabel = DPBodyLabel(textAlignment: .center)
    let actionButton = DPButton(backgroundColor: .systemTeal, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
        
        
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong ( no message)"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureBodyLabel() {
        containerView.addSubview(bodyLabel)
        bodyLabel.text = message ?? "unable to complete request"
        bodyLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok" , for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside) 
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func dismissAlertOnClick() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}
