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
        
        listViewController.tabBarItem = UITabBarItem(title: "All", image: nil, selectedImage: nil)
        favouriteViewController.tabBarItem = UITabBarItem(title: "Favourtie", image: nil, selectedImage: nil)
        
        viewControllers = [listViewController, favouriteViewController]
    }
}


