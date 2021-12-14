//
//  PersistenceManager.swift
//  DominionPedia
//
//  Created by billy pak on 9/10/21.
//

import UIKit

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum keys {
        static let favorites = Keys.favorites
    }
    
    static func updateWith(favorite: Card, actionType: PersistenceActionType, completed: @escaping (DPError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    //This checks that the favorite already doesnt exist first, otherwise pass error
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    //$0 is each item as it itereates through, it will go and remove ALL objects that match favorite.login(we passed)
                    retrievedFavorites.removeAll{ $0.cardName == favorite.cardName}
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
        
    static func retrieveFavorites(completed: @escaping(Result<[Card], DPError>) -> Void) {
        guard let favoriteData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Card].self, from: favoriteData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Card]) -> DPError? {
        
        do {
            let encoder = JSONEncoder()
            let encoderFavorites = try encoder.encode(favorites)
            defaults.set(encoderFavorites, forKey: Keys.favorites)
            return nil
        }  catch {
            return .unableToFavorite
        }
        
    }
}
