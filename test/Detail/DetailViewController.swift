//
//  ViewController.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    var detailNewsImageView = UIImageView()
    var detailAuthorLabel = UILabel()
    var detailDescriptionLabel = UILabel()
    var detailLinkLabel = UILabel()
    
    var linkLabelFullVersion = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addToFavourite))
        
        setupDetailImage()
        setupDetailAuthor()
        setupDetailDescription()
        setupDetailLink()
        setuplinkLabelFullVersion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStarBarButtonItem()
    }
    
    private func setupDetailImage() {
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
    
    private func setupDetailAuthor() {
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
    
    private func setupDetailDescription() {
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
    
    private func setupDetailLink() {
        detailLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLinkLabel.numberOfLines = 0
        detailLinkLabel.sizeToFit()
        detailLinkLabel.textColor = .blue
        view.addSubview(detailLinkLabel)
        NSLayoutConstraint.activate([
            detailLinkLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            detailLinkLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            detailLinkLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        detailLinkLabel.isUserInteractionEnabled = true
        let linkGesture = UITapGestureRecognizer(target: self, action: #selector(linkTapped))
        detailLinkLabel.addGestureRecognizer(linkGesture)
    }
    
    private func setuplinkLabelFullVersion() {
        linkLabelFullVersion.translatesAutoresizingMaskIntoConstraints = false
        linkLabelFullVersion.text = "Full version of the article"
        linkLabelFullVersion.sizeToFit()
        linkLabelFullVersion.textColor = .black
        view.addSubview(linkLabelFullVersion)
        NSLayoutConstraint.activate([
            linkLabelFullVersion.bottomAnchor.constraint(equalTo: detailLinkLabel.topAnchor, constant: -10),
            linkLabelFullVersion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            linkLabelFullVersion.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    @objc func linkTapped() {
        print("Link tapped")
        guard let url = URL(string: detailLinkLabel.text ?? "") else { return }
        let webViewVC = WebViewDetailController(url: url, title: "Author: \(detailAuthorLabel.text!)")
        navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    @objc func addToFavourite() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(addToFavourite))
        
        if isAddedToFavourite() {
            StorageManager.shared.removeNews(detailDescriptionLabel.text ?? "")
            StorageManager.shared.removeLink(detailLinkLabel.text ?? "")
            StorageManager.shared.removeAuthor(detailAuthorLabel.text ?? "")
            StorageManager.shared.removeImage(detailNewsImageView.image ?? UIImage())
            showAlert("Удалено из избранного")
            print("removed")
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addToFavourite))
        } else {
            StorageManager.shared.addFavouriteAuthor(detailAuthorLabel.text ?? "")
            StorageManager.shared.addFavouriteLink(detailLinkLabel.text ?? "")
            StorageManager.shared.addFavouriteNews(detailDescriptionLabel.text ?? "")
            StorageManager.shared.addFavouriteImage(detailNewsImageView.image ?? UIImage())
            showAlert("Добавлено в избранное")
            print("added")
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(addToFavourite))
        }
        
    }
    
    
    private func showAlert(_ title: String) {
        let alert = UIAlertController(title: "\(title)", message: nil, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            alert.dismiss(animated: true)
        }
    }
    
    
    private func updateStarBarButtonItem() {
        if isAddedToFavourite() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(addToFavourite))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(addToFavourite))
        }
    }
    
    private func isAddedToFavourite() -> Bool {
        if let description = detailDescriptionLabel.text, let author = detailAuthorLabel.text, let link = detailLinkLabel.text, let image = detailNewsImageView.image {
            
            let isFavedDescription = StorageManager.shared.favouritedNewsArray.contains(description)
            let isFavedLink = StorageManager.shared.favouritedLinksArray.contains(link)
            let isFavedAuthor = StorageManager.shared.favouritedAuthorsArray.contains(author)
            let isFavedImage = StorageManager.shared.favouritedImagesArray.contains(image)
            
            if isFavedDescription && isFavedLink && isFavedAuthor && isFavedImage {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}


