//
//  DPButton.swift
//  DominionPedia
//
//  Created by billy pak on 7/23/21.
//

import UIKit

class DPButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, title: String) {
        self.init(frame: .zero)
        set(color: color, title: title)
    }
    
    convenience init(color: UIColor, title: String, systemImage: String) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImage: systemImage)
        
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .filled()
        configuration?.cornerStyle = .medium
        //old way
        //setTitleColor(.white, for: .normal)
        //titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    func set(color: UIColor, title: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
    }
    
    func set(color: UIColor, title: String, systemImage: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImage)
        configuration?.imagePadding = 12
        configuration?.imagePlacement = .leading
        
    }
    
}
