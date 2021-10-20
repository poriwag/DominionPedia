//
//  Constants.swift
//  DominionPedia
//
//  Created by billy pak on 7/23/21.
//

import UIKit

enum SFSymbols {
    
    static let cardList = UIImage(systemName: "list.bullet")
    static let expansionBox = UIImage(systemName: "archivebox.fill")
    static let settings = UIImage(systemName: "gearshape")
    static let money = UIImage(systemName: "dollarsign.circle")
    
    static let person = UIImage(systemName: "person.fill")
    static let brainHead = UIImage(systemName: "brain.head.profile")
    
    static let placeHolder = UIImage(systemName: "photo.artframe")
}

enum Images {
    static let dominionLogo = UIImage(named: "DominionLogo")
    static let defaultImage = UIImage(named: "CardBack")
}

enum Strings {
    static let cardBack = "CardBack"
}

enum Keys {
    static let favorites = "favorites"
}

enum Expansions {
    static let dominion      = UIImage(named: "dominion")
    static let intrigue      = UIImage(named: "intrigue")
    static let seaside       = UIImage(named: "seaside")
    static let alchemy       = UIImage(named: "alchemy")
    static let prosperity    = UIImage(named: "prosperity")
    static let cornucopia    = UIImage(named: "cornucopia")
    static let hinterlands   = UIImage(named: "hinterlands")
    static let darkAges      = UIImage(named: "dark_ages")
    static let guilds        = UIImage(named: "guilds")
    static let adventures    = UIImage(named: "adventures")
    static let empires       = UIImage(named: "empires")
    static let nocturne      = UIImage(named: "nocturne")
    static let renaissance   = UIImage(named: "renaissance")
    static let menagerie     = UIImage(named: "menagerie_expansion")
}

enum DominionEndPoints {
    static let Expansion = "?set_name="
    static let Cards = "?card_name="
    
}
let expansionList: [String] = ["dominion",
                                    "intrigue",
                                    "seaside",
                                    "alchemy",
                                    "prosperity",
                                    "cornucopia",
                                    "hinterlands",
                                    "dark_ages",
                                    "guilds",
                                    "adventures",
                                    "empires",
                                    "nocturne",
                                    "renaissance",
                                    "menagerie_expansion"]


let dominion    = Expansion(expansionName: "Dominion", urlName: "dominion", source: expansionList[0])
let intrigue    = Expansion(expansionName: "Intrigue", urlName: "Intrigue", source: expansionList[1])
let seaside     = Expansion(expansionName: "Seaside", urlName: "Seaside", source: expansionList[2])
let alchemy     = Expansion(expansionName: "Alchemy", urlName: "Alchemy", source: expansionList[3])
let prosperity  = Expansion(expansionName: "Prosperity", urlName: "Prosperity", source: expansionList[4])
let cornucopia  = Expansion(expansionName: "Cornucopia", urlName: "Cornucopia", source: expansionList[5])
let hinterlands = Expansion(expansionName: "Hinterlands", urlName: "Hinterlands", source: expansionList[6])
let darkAges    = Expansion(expansionName: "Dark Ages", urlName: "dark", source: expansionList[7])
let guilds      = Expansion(expansionName: "Guilds", urlName: "guilds", source: expansionList[8])
let adventures  = Expansion(expansionName: "Adventures", urlName: "adventures", source: expansionList[9])
let empires     = Expansion(expansionName: "Empires", urlName: "empires", source: expansionList[10])
let nocturne    = Expansion(expansionName: "Nocturne", urlName: "nocturne", source: expansionList[11])
let renaissance = Expansion(expansionName: "Renaissance", urlName: "renaissance", source: expansionList[12])
//Menagerie is released but not updated on the Dominion API
//let menagerie   = Expansion(expansionName: "Menagerie", urlName: "menagerie", source: expansionList[13])

let listOfExpansions: [Expansion] = [dominion, intrigue, seaside, alchemy,
                                    prosperity, cornucopia, hinterlands,
                                    darkAges, guilds, adventures, empires,
                                    nocturne, renaissance]

