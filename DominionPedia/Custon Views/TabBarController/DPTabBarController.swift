//
//  DPTabBarController.swift
//  DominionPedia
//
//  Created by billy pak on 7/19/21.
//

import UIKit

class DPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemBlue
        self.viewControllers = [createSearchVC(), createFavoritesVC(), createExpansionsVC(),
                                createCardsVC(), createToolsVC()]
    }
    
    func createSearchVC() -> UINavigationController{
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesVC() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createExpansionsVC() -> UINavigationController {
        let expansionsVC = ExpansionsVC()
        expansionsVC.title = "Expansion List"
        expansionsVC.tabBarItem = UITabBarItem(title: "Expansions", image: SFSymbols.expansionBox, tag: 2)
        
        return UINavigationController(rootViewController: expansionsVC)
    }
    
    func createCardsVC() -> UINavigationController {
        let cardsVC = CardsVC()
        cardsVC.title = "Card List"
        cardsVC.tabBarItem = UITabBarItem(title: "List of Cards", image: SFSymbols.cardList, tag: 3)
        
        return UINavigationController(rootViewController: cardsVC)
    }
    
    func createToolsVC() -> UINavigationController {
        let toolsVC = ToolsVC()
        toolsVC.title = "Tools"
        toolsVC.tabBarItem = UITabBarItem(title: "Tools", image: SFSymbols.settings, tag: 4)
        
        return UINavigationController(rootViewController: toolsVC)
    }
    

}
