//
//  Card.swift
//  DominionPedia
//
//  Created by billy pak on 8/1/21.
//

import UIKit

struct Card: Codable, Hashable {
    
    let id: Int
    let uuid: String
    let cardName: String
    let setName: String
    let type: String
    let isKingdomCard: Bool
    let cost: String
    let cardText: String
    var source: String
}


