//
//  ViewController.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var newsTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "detailed"
        let imageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "image")
        view.addSubview(imageView)
        
        if let title = newsTitle {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.maxY + 20, width: view.frame.width, height: 30))
            titleLabel.text = title
            titleLabel.textAlignment = .center
            view.addSubview(titleLabel)
        }
    }


}

