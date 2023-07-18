//
//  SecondVC.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

final class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favouriteTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        view.backgroundColor = .white
        
        view.addSubview(favouriteTableView)
        favouriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favCell")
        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favouriteTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favouriteTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StorageManager.shared.favouritedLinksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        cell.textLabel?.text = StorageManager.shared.favouritedNewsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDescription = StorageManager.shared.favouritedNewsArray[indexPath.row]
        let selectedLink = StorageManager.shared.favouritedLinksArray[indexPath.row]
        let selectedAuthor = StorageManager.shared.favouritedAuthorsArray[indexPath.row]
        
        let selectedImage = StorageManager.shared.favouritedImagesArray[indexPath.row]
        
        favouriteTableView.deselectRow(at: indexPath, animated: true)

        let detailVC = DetailViewController()
        detailVC.detailDescriptionLabel.text = selectedDescription
        detailVC.detailLinkLabel.text = selectedLink
        detailVC.detailAuthorLabel.text = selectedAuthor
        detailVC.detailNewsImageView.image = selectedImage

        navigationController?.pushViewController(detailVC, animated: true)
    }

}
