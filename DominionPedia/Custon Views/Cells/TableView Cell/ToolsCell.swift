//
//  ToolsCell.swift
//  DominionPedia
//
//  Created by billy pak on 10/20/21.
//

import UIKit

class ToolsCell: UITableViewCell {

    static let reuseID = "ToolsCell"
    
    let iconImageView = DPToolsImageView(frame: .zero)
    let titleLabel = DPTitleLabel(textAlignment: .left, fontSize: 30)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func set(cellRowData: ToolsModel) {
        iconImageView.image = cellRowData.iconImage
        titleLabel.text = cellRowData.title
    }

}
