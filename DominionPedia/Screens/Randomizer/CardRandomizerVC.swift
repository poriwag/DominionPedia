//
//  CardRandomizerVC.swift
//  DominionPedia
//
//  Created by billy pak on 11/13/21.
//

import UIKit
import ViewAnimator



class CardRandomizerVC: UIViewController {
    
    var prefetchingIndexPaths = [IndexPath: Card]()
    
    var listOfCards: [Card] = []
    var collectionView: UICollectionView!
    
    var randomizeButton = DPButton(color: .systemBlue, title: "Randomize", systemImage: SFSymbolString.dice)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureCollectionView()
        
        configureViewController()
        setupUIConstraints()
        getCardList(named: "", endpoint: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureRandomizeButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        animate()
    }
    func configureViewController() {
        title = "Randomizer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //setup navigation bar
        let optionsButton = UIBarButtonItem(image: SFSymbols.cardList, style: .plain, target: self, action: #selector(expansionListNames))
        navigationItem.rightBarButtonItems = [optionsButton]
    }
    
    @objc func expansionListNames() {
        let firstTenCards = Array(listOfCards[0..<10])
        let destVC = CardRandomizerListVC(listOfCards: firstTenCards)
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
    
    @objc func expansionListOption() {
        let destVC = CardRandomizerOptionsVC()
        
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
    
    func configureCollectionView() {
        
        let layout = ZoomAndSnapFlowLayout()
        //layout.itemSize = CGSize(width: view.frame.width-300, height: view.frame.height-200)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 100, left: 150, bottom: 100, right: 150)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        
        collectionView.register(CardRandomizerCell.self, forCellWithReuseIdentifier: CardRandomizerCell.reuseID)
    }
    
    func setupUIConstraints() {
        view.addSubview(collectionView)
        view.addSubview(randomizeButton)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 550),
            
            randomizeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            randomizeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            randomizeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            randomizeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func configureRandomizeButton() {
        randomizeButton.addTarget(self, action: #selector(randomizePushed), for: .touchUpInside)
        //collectionView.reloadData()

    }
    
    @objc func randomizePushed() {
        listOfCards = listOfCards.shuffled()
        animate()
        
    }
    
    func getCardList(named expansion: String, endpoint: String) {
        
        var combinedEndpoint = endpoint + expansion

        //manipulating the JSON request. If the string is empty, make it empty.
        if expansion == "" {
            combinedEndpoint = ""
        }
        let expansion = "Dominion"
        
        showLoadingView()
        
        NetworkManager.shared.getCardList(for: combinedEndpoint, page: 1) {[weak self] result in
            
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let cards):
                if expansion == ""  {
                    print("Is this being executed")
                    self.listOfCards.append(contentsOf: cards)
                } else {
                    let filteredCards = cards.filter { $0.setName == expansion }
                    self.listOfCards.append(contentsOf: filteredCards.shuffled())
                }
                if self.listOfCards.isEmpty {
                    let message = "NO Cards Avaliable"
                    self.presentDPAlertOnMainThread(title: "Error", message: message, buttonTitle: "Ok")
                }
            case .failure(let error):
                self.presentDPAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "ok")
            }
            self.animate()
        }
    }
    
    func animate() {
        let animation = AnimationType.from(direction: .right, offset: 400)
        
        DispatchQueue.main.async {
            UIView.animate(views: self.collectionView.visibleCells, animations: [animation], delay: 0, duration: 0.25)
            self.collectionView.reloadData()
        }
        
    }
    
}

extension CardRandomizerVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardRandomizerCell.reuseID, for: indexPath) as! CardRandomizerCell
        
        if listOfCards.isEmpty {
            print(indexPath.row)
            return cell }
        
        cell.set(card: self.listOfCards[indexPath.row])
        
        return cell
    }
}

extension CardRandomizerVC: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
}

extension CardRandomizerVC: UICollectionViewDelegate {

}


