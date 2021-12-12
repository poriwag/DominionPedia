//
//  AboutModel.swift
//  DominionPedia
//
//  Created by billy pak on 10/20/21.
//

import UIKit

struct ToolsModel {
    
    let iconImage: UIImage
    let title: String
    
    static let list: [ToolsModel] = [
        ToolsModel(iconImage: SFSymbols.settings!, title: "Settings"),
        ToolsModel(iconImage: SFSymbols.person!, title: "By: Billy Pak"),
        ToolsModel(iconImage: SFSymbols.brainHead!, title: "Credit: Donald X Vaccarino"),
        ToolsModel(iconImage: UIImage(systemName: SFSymbolString.dice)!, title: "Randomizer")
    ]
}
