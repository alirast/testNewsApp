//
//  SecondVC.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class FavouriteViewController: UIViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
           
           view.backgroundColor = .red
           
           let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
           label.center = view.center
           label.text = "Favorite news"
           label.textAlignment = .center
           view.addSubview(label)
       }

}
