//
//  CardRandomizerVC.swift
//  DominionPedia
//
//  Created by billy pak on 11/13/21.
//

import UIKit

class CardRandomizerVC: UIViewController {

    enum Section {
        case main
    }
    
    var listOfCards: [Card] = []
    var filteredListOfCards: [Card] = []
    var shuffedList: [Card] = []
    
    private var scrollView = UIScrollView()
    var collectionView: UICollectionView!
    var randomlizeListOfNumber: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureCollectionView()
        getCardList(named: "", endpoint: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //getCardList(named: "", endpoint: "")
    }
    
    func configureCollectionView() {
        
        let layout = ZoomAndSnapFlowLayout()
        //layout.itemSize = CGSize(width: view.frame.width-300, height: view.frame.height-200)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 100, left: 150, bottom: 100, right: 150)
        //layout.numberOfItemsPerPage = 1
        

        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        
        collectionView.register(CardRandomizerCell.self, forCellWithReuseIdentifier: CardRandomizerCell.reuseID)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 550)
        ])
    }
    

    
    func getCardList(named expansion: String, endpoint: String) {
        
        var combinedEndpoint = endpoint + expansion

        //manipulating the JSON request. If the string is empty, make it empty.
        if expansion == "" {
            combinedEndpoint = ""
        }
        var expansion = "Dominion"
        
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
            
        }
    }
    
    
    func randomizedListOfNumber(range: Int) -> [Int] {
        
        var random = Int.random(in: 0..<range)
        var randomResult: [Int] = []
        
        for _ in 0..<10 {
            random = Int.random(in: 0...range-1, excluding: random)
            randomResult.append(random)
        }
        return randomResult
    }
    
    

    
//    private func configureScrollView() {
//        scrollView.backgroundColor = .red
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(10), height: 0)
//        scrollView.isPagingEnabled = true
//        scrollView.alwaysBounceHorizontal = true
//
//    }
//
//    private func layoutUI() {
//
//        view.addSubview(scrollView)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.heightAnchor.constraint(equalToConstant: 600),
//        ])
//    }
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

        cell.set(card: listOfCards[indexPath.row])

        return cell
    }
}

extension CardRandomizerVC: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    }
}

extension CardRandomizerVC: UICollectionViewDelegate {
    
}


