//
//  FavouriteListManager.swift
//  test
//
//  Created by N S on 13.07.2023.
//

import UIKit

class StorageManager {
    static let shared = StorageManager()
    
    var favouritedNewsArray: [String] = []
    var favouritedLinksArray: [String] = []
    var favouritedAuthorsArray: [String] = []
    var favouritedImagesArray: [UIImage] = []
    
    let defaults = UserDefaults.standard
    let favouritedNewsKey = "favouritedNewsKey"
    
    let favouritedLinksKey = "favLinkKey"
    let favouritedAuthorsKey = "favAuthorKey"
    let favouritedImagesKey = "favImageKey"
    
    init() {
        if let savedFavouriteContent = defaults.object(forKey: favouritedNewsKey) as? [String] {
            favouritedNewsArray = savedFavouriteContent
        }
        if let savedFavouritedLink = defaults.object(forKey: favouritedLinksKey) as? [String] {
            favouritedLinksArray = savedFavouritedLink
        }
        
        if let savedFavourtiedAuthor = defaults.object(forKey: favouritedAuthorsKey) as? [String] {
            favouritedAuthorsArray = savedFavourtiedAuthor
        }
        
        if let savedFavouritedImage = defaults.object(forKey: favouritedImagesKey) as? [Data] {
            favouritedImagesArray = savedFavouritedImage.compactMap({ UIImage(data: $0) })
        }
    }
    
    func addFavouriteLink(_ link: String) {
        favouritedLinksArray.append(link)
        saveLink()
    }
    
    func addFavouriteAuthor(_ author: String) {
        favouritedAuthorsArray.append(author)
        saveAuthor()
    }
    
    func addFavouriteImage(_ image: UIImage) {
        favouritedImagesArray.append(image)
        saveImage()
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
        if let index = favouritedLinksArray.firstIndex(of: link) {
            favouritedLinksArray.remove(at: index)
            saveLink()
        }
    }
    
    func removeImage(_ image: UIImage) {
        if let index = favouritedImagesArray.firstIndex(of: image) {
            favouritedImagesArray.remove(at: index)
            saveImage()
        }
    }
    
    func removeAuthor(_ author: String) {
        if let index = favouritedAuthorsArray.firstIndex(of: author) {
            favouritedAuthorsArray.remove(at: index)
            saveAuthor()
        }
    }
    
    private func saveLink() {
        defaults.set(favouritedLinksArray, forKey: favouritedLinksKey)
    }
    
    private func saveImage() {
        let imageData = favouritedImagesArray.compactMap({ $0.jpegData(compressionQuality: 1.0) })
        defaults.set(imageData, forKey: favouritedImagesKey)
    }
    
    private func saveAuthor() {
        defaults.set(favouritedAuthorsArray, forKey: favouritedAuthorsKey)
    }
    
    private func saveFavouriteNews() {
        defaults.set(favouritedNewsArray, forKey: favouritedNewsKey)
    }
}
