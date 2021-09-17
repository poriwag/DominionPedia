//
//  DPExpansionsVC.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

class ExpansionsVC: UIViewController {

    var titleLabel = DPTitleLabel(textAlignment: .left , fontSize: 22)
    var titleName: String = ""
    
   // var collectionView = UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func configureViewController() {
        title = "Expansion"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView() {
      //  collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: <#T##UICollectionViewLayout#>)
    }
}
