//
//  FavouriteListManager.swift
//  test
//
//  Created by N S on 13.07.2023.
//

import UIKit

protocol FavouriteListManagerProtocol {
    func addFavouriteNews(_ news: String)
}

class FavouriteListManager: FavouriteListManagerProtocol {
    static let shared = FavouriteListManager()
    var favouritedNewsArray: [String] = []
    
    var favLink: [String] = []
    var favAuthor: [String] = []
    
    
    
    let defaults = UserDefaults.standard
    let favouritedNewsKey = "favouritedNewsKey"
    
    let favLinkKey = "favLinkKey"
    let favAuthorKey = "favAuthorKey"
    
    init() {
        if let savedFavourites = defaults.object(forKey: favouritedNewsKey) as? [String] {
            favouritedNewsArray = savedFavourites
        }
        if let savedLink = defaults.object(forKey: favLinkKey) as? [String] {
            favLink = savedLink
        }
        
        if let savedAuthor = defaults.object(forKey: favAuthorKey) as? [String] {
            favAuthor = savedAuthor
        }
    }
    
    func addFavLink(_ link: String) {
        favLink.append(link)
        saveLink()
    }
    
    func addFavAuthor(_ author: String) {
        favAuthor.append(author)
        saveAuthor()
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
    
    func removeLink(_ link: String) {
        if let index = favLink.firstIndex(of: link) {
            favLink.remove(at: index)
            saveLink()
        }
    }
    
    private func saveLink() {
        defaults.set(favLink, forKey: favLinkKey)
    }
    
    func removeAuthor(_ author: String) {
        if let index = favAuthor.firstIndex(of: author) {
            favAuthor.remove(at: index)
            saveAuthor()
        }
    }
    
    private func saveAuthor() {
        defaults.set(favAuthor, forKey: favAuthorKey)
    }
    
    private func saveFavouriteNews() {
        defaults.set(favouritedNewsArray, forKey: favouritedNewsKey)
    }
}
