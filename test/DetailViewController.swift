//
//  ViewController.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var newsTitle: String?
    var newsAuthor: String?
    var newsImage: URL?
    var newsDescription: String?
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "detailed"
        
        
        let imageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        //imageView.image = UIImage(data: newsImage?.dataRepresentation)
        
        view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 100, y: 170, width: 100, height: 50))
        button.titleLabel?.text = "Favourtie"
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(addToFav), for: .touchUpInside)
        view.addSubview(button)
        
        if let title = newsTitle {
            let titleLabel = UILabel(frame: CGRect(x: 10, y: imageView.frame.maxY + 20, width: view.frame.width, height: 30))
            titleLabel.text = title
            titleLabel.textAlignment = .center
            view.addSubview(titleLabel)
        }
        
        if let author = newsAuthor {
            let authorLabel = UILabel(frame: CGRect(x: 10, y: 100, width: view.frame.width, height: 20))
            authorLabel.text = author
            authorLabel.textAlignment = .center
            view.addSubview(authorLabel)
        }
        
        if let description = newsDescription {
            let descriptionLabel = UILabel(frame: CGRect(x: 10, y: 40, width: view.frame.width, height: 20))
            descriptionLabel.text = description
            descriptionLabel.textAlignment = .center
            view.addSubview(descriptionLabel)
        }
        
        if let url = url {
            let urlLabel = UILabel(frame: CGRect(x: 10, y: 30, width: view.frame.width, height: 30))
            urlLabel.text = url
            urlLabel.textAlignment = .center
            view.addSubview(urlLabel)
        }
    }
    
    @objc func addToFav() {
        if let title = newsTitle {
            FavManager.shared.addFav(title)
            print("faved \(title)")
        }
    }


}

