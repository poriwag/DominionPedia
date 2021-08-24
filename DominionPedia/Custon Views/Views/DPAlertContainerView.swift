//
//  DPAlertContainerView.swift
//  DominionPedia
//
//  Created by billy pak on 7/30/21.
//

import UIKit

class DPAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
       backgroundColor = .systemBackground
       layer.cornerRadius = 16
       layer.borderWidth = 2
       layer.borderColor = UIColor.white.cgColor
       translatesAutoresizingMaskIntoConstraints = false
    }

}
