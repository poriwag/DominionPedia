//
//  DPToolsImageView.swift
//  DominionPedia
//
//  Created by billy pak on 10/20/21.
//

import UIKit

class DPToolsImageView: UIImageView {

    let iconPlaceHolder = SFSymbols.placeHolder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = iconPlaceHolder
        contentMode        = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
