//
//  DPExpansionsVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

class ExpansionsVC: UIViewController {

    var scrollView = UIScrollView()
    var stackView = UIStackView()
    
    var titleLabel = DPTitleLabel(textAlignment: .left , fontSize: 22)
    var titleName: String = ""
    
   // var collectionView = UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViewController()
        configureScrollView()
        configureStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.setContentOffset(.zero, animated: true)
       // navigationController?.setNavigationBarHidden(false, animated: true)
                
    }
    
    private func configureViewController() {
        title = "Expansion"
        navigationItem.largeTitleDisplayMode = .never
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = .systemGreen
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureStackView() {
        //view.addSubview(stackView)
        scrollView.addSubview(stackView)
        scrollView.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 80
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
     
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        addExpansionsToStackView()
    }
    
    private func addExpansionsToStackView() {
        let numberOfExpansion = listOfExpansions.count-1

        
        for i in 0..<numberOfExpansion {
            let expansionTitle = UILabel(frame: .zero)
            let imageView = UIImageView()
            imageView.image = UIImage(named: listOfExpansions[i].source)
            stackView.addArrangedSubview(imageView)
            
            configureExpansionTitleLabel(expansion: listOfExpansions[i].expansionName, label: expansionTitle)
            imageView.isUserInteractionEnabled = true
            
            let tapGesture = ExpansionTapGestureRecognizer(target: self, action: #selector(expansionTapped))
            tapGesture.arrayValue = i
            imageView.addGestureRecognizer(tapGesture)
            
            //constraints
            NSLayoutConstraint.activate([
                expansionTitle.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -10),
                expansionTitle.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
                
                //expansionTitle.heightAnchor.constraint(equalToConstant: 10)
            ])
        }
    }
    
    private func configureExpansionTitleLabel(expansion str: String, label expansionTitle: UILabel) {
        stackView.addSubview(expansionTitle)
        expansionTitle.translatesAutoresizingMaskIntoConstraints = false
        expansionTitle.text = str
        expansionTitle.font = expansionTitle.font.withSize(30)
    }
    
    private func activateTap() {
        
    }
    
    @objc func expansionTapped(sender: ExpansionTapGestureRecognizer) {
        //sender.arrayValue = index for array(counter) look underConstants.
        let i = sender.arrayValue ?? 0
        
        let cardsVC = CardsVC(expansionName: listOfExpansions[i].urlName, endpoint: DominionEndPoints.Expansion)
        navigationController?.pushViewController(cardsVC, animated: true)
    }
}


