//
//  DPCardsVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

protocol CardsVCDelegate: class {
    func didRequestCards(for card: String)
}

class CardsVC: UIViewController {

    enum Section {
        case main
    }
    var listOfCards: [Card] = []
    var filteredListOfCards: [Card] = [] 
    
    var isSearching = false
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Card>!
    
    var expansionName: String!
    var endPoint: String!
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        expansionName = ""
        endPoint = ""
        title = "List of Cards"
        
    }
    
    convenience init(expansionName: String, endpoint: String) {
        self.init()
        self.expansionName = expansionName
        self.endPoint = endpoint
        title = expansionName
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getCardList(named: expansionName, endpoint: endPoint)
        configureDataSource()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewController() {
        //title = "List of Cards"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView(){

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: self.view))
        collectionView.delegate = self
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
    
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a Card"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    

    
    func getCardList() {
        
        showLoadingView()
        
        NetworkManager.shared.getCardList(for: "", page: 1) {[weak self] result in
            
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
            self.updateData(on: self.listOfCards)
        }
    }
//
//    func getCardList(named expansion: String) {
//
//        var endpoint = "?set_name=\(expansion)"
//
//        //manipulating the JSON request. If the string is empty, make it empty.
//        if expansion == "" {
//            endpoint = ""
//        }
//
//        showLoadingView()
//
//        NetworkManager.shared.getCardList(for: endpoint, page: 1) {[weak self] result in
//
//            guard let self = self else { return }
//
//            self.dismissLoadingView()
//
//            switch result {
//            case .success(let cards):
//                self.listOfCards.append(contentsOf: cards)
//                if self.listOfCards.isEmpty {
//                    let message = "NO Cards Avaliable"
//                    self.presentDPAlertOnMainThread(title: "Error", message: message, buttonTitle: "Ok")
//                }
//            case .failure(let error):
//                self.presentDPAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "ok")
//            }
//            self.updateData(on: self.listOfCards)
//        }
//    }
//
    func getCardList(named expansion: String, endpoint: String) {
        
        var combinedEndpoint = endpoint + expansion

        //manipulating the JSON request. If the string is empty, make it empty.
        if expansion == "" {
            combinedEndpoint = ""
        }
        
        showLoadingView()
        
        NetworkManager.shared.getCardList(for: combinedEndpoint, page: 1) {[weak self] result in
            
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
            self.updateData(on: self.listOfCards)
        }
    }
    
    
    func updateData(on cardList: [Card]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cardList)
        DispatchQueue.main.async {  self.dataSource.apply(snapshot, animatingDifferences: true) }
        
    }
}

extension CardsVC: UICollectionViewDelegate {

    //selects to CardInfoVC for selected Card
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activeArray = isSearching ? filteredListOfCards : listOfCards
        let card = activeArray[indexPath.item]
        let destVC = CardInfoVC(card: card)
        destVC.delegate = self
        
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}

extension CardsVC: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //check if empty
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            return
        }
        
        isSearching = true
        filteredListOfCards = listOfCards.filter {
            $0.cardName.lowercased().contains(filter.lowercased())
        }
        updateData(on: filteredListOfCards)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(on: listOfCards)
        isSearching = false
    }
}

extension CardsVC: CardsVCDelegate {
    func didRequestCards(for card: String) {
        //resetting the whole page
        listOfCards.removeAll()
        filteredListOfCards.removeAll()
        collectionView.setContentOffset(.zero, animated: true)
        getCardList()
    }
}
