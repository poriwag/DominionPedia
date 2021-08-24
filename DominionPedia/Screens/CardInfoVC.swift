//
//  CardInfoVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/28/21.
//

import UIKit



class CardInfoVC: UIViewController {

    var cardName: String!
    
    
    init(cardName: String) {
        super.init(nibName: nil, bundle: nil)
        self.cardName = cardName
        title = cardName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = doneButton
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
