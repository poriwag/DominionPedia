//
//  DominionPediaTests.swift
//  DominionPediaTests
//
//  Created by billy pak on 11/7/21.
//

import XCTest
@testable import DominionPedia

class DominionPediaTests: XCTestCase {

    func testExpansionNameStrings() {
        let listOfExpansions: [Expansion] = [dominion, intrigue, seaside, alchemy,
                                            prosperity, cornucopia, hinterlands,
                                            darkAges, guilds, adventures, empires,
                                            nocturne, renaissance]
        
        
        let dominionDisplay = listOfExpansions[0].expansionName
        let intrigueDisplay = listOfExpansions[1].expansionName
        let seasideDisplay = listOfExpansions[2].expansionName
        let alchemyDisplay = listOfExpansions[3].expansionName
        
        let prosperityDisplay = listOfExpansions[4].expansionName
        let cornucopiaDisplay = listOfExpansions[5].expansionName
        let hinterlandsDisplay = listOfExpansions[6].expansionName
        let darkAgesDisplay = listOfExpansions[7].expansionName
        let guildsDisplay = listOfExpansions[8].expansionName
        let adventuraresDisplay = listOfExpansions[9].expansionName
        let empiresDisplay = listOfExpansions[10].expansionName
        let nocturneDisplay = listOfExpansions[11].expansionName
        let renaissanceDisplay = listOfExpansions[12].expansionName

        XCTAssertEqual(dominionDisplay, "Dominion")
        XCTAssertEqual(intrigueDisplay, "Intrigue")
        XCTAssertEqual(seasideDisplay, "Seaside")
        XCTAssertEqual(alchemyDisplay, "Alchemy")
        XCTAssertEqual(prosperityDisplay, "Prosperity")
        XCTAssertEqual(cornucopiaDisplay, "Cornucopia")
        XCTAssertEqual(hinterlandsDisplay, "Hinterlands")
        XCTAssertEqual(darkAgesDisplay, "Dark Ages")
        XCTAssertEqual(guildsDisplay, "Guilds")
        XCTAssertEqual(adventuraresDisplay, "Adventures")
        XCTAssertEqual(empiresDisplay, "Empires")
        XCTAssertEqual(nocturneDisplay, "Nocturne")
        XCTAssertEqual(renaissanceDisplay, "Renaissance")
    }
    
}
