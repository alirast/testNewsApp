//
//  ViewController.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var detailNewsImageView = UIImageView()
    var detailAuthorLabel = UILabel()
    var detailDescriptionLabel = UILabel()
    var detailLinkLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addToFavourite))
        
        setupDetailImage()
        setupDetailAuthor()
        setupDetailDescription()
        setupDetailLink()
    }
    
    func setupDetailImage() {
        detailNewsImageView.translatesAutoresizingMaskIntoConstraints = false
        detailNewsImageView.backgroundColor = .black
        
        view.addSubview(detailNewsImageView)
        NSLayoutConstraint.activate([
            detailNewsImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            detailNewsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailNewsImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            detailNewsImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        detailNewsImageView.contentMode = .scaleAspectFill
        detailNewsImageView.center = view.center
        
    }
    
    func setupDetailAuthor() {
        detailAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        detailAuthorLabel.textColor = .black
        detailAuthorLabel.font.withSize(30)
        view.addSubview(detailAuthorLabel)
        NSLayoutConstraint.activate([
            detailAuthorLabel.topAnchor.constraint(equalTo: detailNewsImageView.bottomAnchor, constant: 10),
            detailAuthorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailAuthorLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    func setupDetailDescription() {
        detailDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDescriptionLabel.textColor = .black
        detailDescriptionLabel.sizeToFit()
        detailDescriptionLabel.numberOfLines = 0
        view.addSubview(detailDescriptionLabel)
        NSLayoutConstraint.activate([
            detailDescriptionLabel.topAnchor.constraint(equalTo: detailAuthorLabel.bottomAnchor, constant: 10),
            detailDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
        ])
    }
    
    func setupDetailLink() {
        detailLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLinkLabel.numberOfLines = 0
        detailLinkLabel.sizeToFit()
        detailLinkLabel.textColor = .black
        view.addSubview(detailLinkLabel)
        NSLayoutConstraint.activate([
            detailLinkLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            detailLinkLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailLinkLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    @objc func addToFavourite() {
        if let description = detailDescriptionLabel.text {
            let isFaved = FavouriteListManager.shared.favouritedNewsArray.contains(description)
            if isFaved {
                FavouriteListManager.shared.removeNews(description)
                showAlert("Удалено из избранного")
                print("removed")
            } else {
                FavouriteListManager.shared.addFavouriteNews(description)
                showAlert("Добавлено в избранное")
                print("added")
            }
        }
    }
    
    
    private func showAlert(_ title: String) {
        let alert = UIAlertController(title: "\(title)", message: nil, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            alert.dismiss(animated: true)
        }
    }
}

/*class DetailViewController: UIViewController {
    
    var newsTitle: String?
    var newsAuthor: String?
    var newsImage: URL?
    var newsDescription: String?
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        //title = "detailed"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: nil)
        
        
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


}*/

