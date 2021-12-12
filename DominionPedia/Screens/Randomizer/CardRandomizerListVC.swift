//
//  CardRandomizerListVC.swift
//  DominionPedia
//
//  Created by billy pak on 11/24/21.
//

import UIKit
import ViewAnimator

class CardRandomizerListVC: UIViewController {

    private var tableView = UITableView()
    private var listOfCards: [Card] = []
    
    private lazy var loadingOperations = [IndexPath : Card]()
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(listOfCards: [Card]) {
        self.init()
        self.listOfCards = listOfCards
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismissVC()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "List of Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = doneButton
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        //tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(CardListTableViewCell.self, forCellReuseIdentifier: CardListTableViewCell.reuseID)
    }
    // MARK: - Objc Func
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}

extension CardRandomizerListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardListTableViewCell.reuseID) as! CardListTableViewCell
        let card = listOfCards[indexPath.row]
        cell.set(card: card)
        return cell
    }
    
}

extension CardRandomizerListVC: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        //indexPaths.forEach { (forItemAtIndex: $0.row) }
    }
    
    
}



