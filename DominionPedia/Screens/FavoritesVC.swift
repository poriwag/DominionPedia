//
//  DPFavoritesVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

class FavoritesVC: UIViewController {

    let tableView = UITableView()
    var favorites: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 100
    
        
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.reuseID) as! FavoritesCell
        let favorite = favorites[indexPath.row]
        cell.set(favorites: favorite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        
        //creating a destination when selecting the row/icon of the cell
    }
    
    
    
}
