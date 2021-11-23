//
//  DPToolsVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

class ToolsVC: UIViewController {

    var tableView = UITableView()
    var randomizerVC = CardRandomizerVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Tools"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ToolsCell.self, forCellReuseIdentifier: ToolsCell.reuseID)
    }
}

extension ToolsVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 3:
            //randomizerVC.listOfCards = randomizerVC.listOfCards.shuffled()
            self.navigationController?.pushViewController(CardRandomizerVC(), animated: true)
        default:
                print("Cell does not exist")
        }
    }
    
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToolsModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToolsCell.reuseID) as! ToolsCell
        let cellRowData = ToolsModel.list[indexPath.row]
        cell.set(cellRowData: cellRowData)
        
        return cell
    }
    
}
