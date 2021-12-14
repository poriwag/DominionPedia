//
//  DPTitleLabel.swift
//  DominionPedia
//
//  Created by billy pak on 7/23/21.
//

import UIKit

class DPTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat){
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        //font = UIFont.preferredFont(forTextStyle: .headline)
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        
    }
}
