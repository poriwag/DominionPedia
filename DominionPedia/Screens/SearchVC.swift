//
//  DPSearchVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let cardTextField = DPTextField()
    let callToActionButton = DPButton(backgroundColor: .systemBlue, title: "Get Card Data")
    
    var isCardNameEntered: Bool { return !cardTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureCardTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //Configure func
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.dominionLogo
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    private func configureCardTextField() {
        view.addSubview(cardTextField)
        cardTextField.delegate = self
        
        NSLayoutConstraint.activate([
            cardTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            cardTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cardTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            cardTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushCardView), for: .touchUpInside)
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushCardView() {
        
        guard isCardNameEntered else {
            print("error")
            return
        }
        cardTextField.resignFirstResponder()
        
        // let cardInfoVC = CardInfoVC(cardPass: card)
       // cardInfoVC.delegate = self
        
       // let navController = UINavigationController(rootViewController: cardInfoVC())
       // present(navController, animated: true)
        
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushCardView()
        return true
    }
}
