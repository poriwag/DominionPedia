//
//  DPFullScreenContainerView.swift
//  DominionPedia
//
//  Created by billy pak on 9/8/21.
//

import UIKit

class DPFullScreenContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure()  {
        backgroundColor = .systemBackground
        layer.cornerRadius = 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
