//
//  FavouriteListManager.swift
//  test
//
//  Created by N S on 13.07.2023.
//

import Foundation

protocol FavouriteListManagerProtocol {
    func addFavouriteNews(_ news: String)
}

class FavouriteListManager: FavouriteListManagerProtocol {
    static let shared = FavouriteListManager()
    var favouritedNewsArray: [String] = []
    
    let defaults = UserDefaults.standard
    let favouritedNewsKey = "favouritedNewsKey"
    
    init() {
        if let savedFavourites = defaults.object(forKey: favouritedNewsKey) as? [String] {
            favouritedNewsArray = savedFavourites
        }
    }
    
    func addFavouriteNews(_ news: String) {
        favouritedNewsArray.append(news)
        saveFavouriteNews()
    }
    
    func removeNews(_ news: String) {
        if let index = favouritedNewsArray.firstIndex(of: news) {
            favouritedNewsArray.remove(at: index)
            saveFavouriteNews()
        }
    }
    
    private func saveFavouriteNews() {
        defaults.set(favouritedNewsArray, forKey: favouritedNewsKey)
    }
}
