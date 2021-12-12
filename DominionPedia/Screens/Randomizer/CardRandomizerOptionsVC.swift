//
//  CardRandomizerOptionsVC.swift
//  DominionPedia
//
//  Created by billy pak on 11/24/21.
//

import UIKit

class CardRandomizerOptionsVC: UIViewController {

    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBlue
        title = "List of Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
    // MARK: - Navigation

}

extension CardRandomizerOptionsVC: UITableViewDelegate {
    
}

extension CardRandomizerOptionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
