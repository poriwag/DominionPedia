//
//  DPSecondaryTitleLabel.swift
//  DominionPedia
//
//  Created by billy pak on 8/29/21.
//

import UIKit

class DPSecondaryTitleLabel: UILabel {

    override init(frame:CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        
    }

    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingHead
    }
}
