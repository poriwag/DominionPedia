//
//  CardRandomizerVC.swift
//  DominionPedia
//
//  Created by billy pak on 11/13/21.
//

import UIKit

class CardRandomizerVC: UIViewController {

    private var indexOfCellBeforeDragging = 0
    
    private var scrollView = UIScrollView()
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureCollectionView()
    }
    
    func configureCollectionView() {
        
        let layout = ZoomAndSnapFlowLayout()
        //layout.itemSize = CGSize(width: view.frame.width-300, height: view.frame.height-200)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 100, left: 150, bottom: 100, right: 150)
        //layout.numberOfItemsPerPage = 1
        

        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
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
            collectionView.heightAnchor.constraint(equalToConstant: 450)
        ])
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
        cell.backgroundColor = .systemBlue
        return cell
    }
}

extension CardRandomizerVC: UICollectionViewDelegate {
    
}
