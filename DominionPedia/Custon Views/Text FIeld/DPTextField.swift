//
//  DPTextField.swift
//  DominionPedia
//
//  Created by billy pak on 7/23/21.
//

import UIKit

class DPTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        backgroundColor = .tertiarySystemBackground
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        autocorrectionType = .no
        returnKeyType = .search
        clearButtonMode = .whileEditing
        placeholder = "Enter a card name" 
    }
}
