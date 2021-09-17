//
//  DPError.swift
//  DominionPedia
//
//  Created by billy pak on 8/6/21.
//

import Foundation

enum DPError: String, Error {
    case invalidCard = "Invalid card request"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    
    case unableToFavorite = "There was an error adding to favorites, please try again"
    case alreadyInFavorites = "This card is already in Favorites"
}
