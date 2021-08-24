//
//  DPCardsVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit



class CardsVC: UIViewController {

    enum Section {
        case main
    }
    var listOfCards: [Card] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Card>!
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getCardList()
        configureDataSource()
    }
    
    
    private func configureViewController() {
        title = "List of Cards"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView(){

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self.view))
       // collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CardListCell.self, forCellWithReuseIdentifier: CardListCell.reuseID)
        
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Card>(collectionView: collectionView, cellProvider: {(collectionView, indexPath, card) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardListCell.reuseID, for: indexPath) as! CardListCell
            cell.set(card: card)
            
            return cell
        })
    }
    
    func getCardList() {
        
        showLoadingView()
        
        NetworkManager.shared.getCardList(for: "all", page: 1) {[weak self] result in
            
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let cards):
                self.listOfCards.append(contentsOf: cards)
                if self.listOfCards.isEmpty {
                    let message = "NO Cards Avaliable"
                    self.presentDPAlertOnMainThread(title: "Error", message: message, buttonTitle: "Ok")
                }
            case .failure(let error):
                self.presentDPAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "ok")
            }
            self.updateData()
        }
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(listOfCards)
        DispatchQueue.main.async {  self.dataSource.apply(snapshot, animatingDifferences: true) }
        
    }
}

