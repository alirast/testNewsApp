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
    var favedNews: [(description: String, author: String, link: String, image: UIImage)] = []
    
    let defaults = UserDefaults.standard
    let favouritedNewsKey = "favouritedNewsKey"
    
    init() {
        if let savedFavourites = defaults.object(forKey: favouritedNewsKey) as? [String] {
            favouritedNewsArray = savedFavourites
        }
    }
    
    func addNew(_ new: (description: String, author: String, link: String, image: UIImage)) {
        favedNews.append(new)
        print(favedNews)
        favedNews.map({ print($0.description, $0.author, $0.link, $0.image) })
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
