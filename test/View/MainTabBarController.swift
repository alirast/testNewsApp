//
//  MainTabBarController.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    let listViewController = ListViewController()
    let favouriteViewController = FavouriteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        listViewController.tabBarItem = UITabBarItem(title: "All", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        favouriteViewController.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "star"), selectedImage: nil)
       
        
        viewControllers = [listViewController, favouriteViewController]
    }
}


