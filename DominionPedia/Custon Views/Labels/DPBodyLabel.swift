//
//  DPBodyLabel.swift
//  DominionPedia
//
//  Created by billy pak on 7/30/21.
//

import UIKit

class DPBodyLabel: UILabel {

    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = false
        
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
    }
}
