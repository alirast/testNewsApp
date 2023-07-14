//
//  SecondVC.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        return FavouriteListManager.shared.favLink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        cell.textLabel?.text = FavouriteListManager.shared.favLink[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let selectedDescription = FavouriteListManager.shared.favouritedNewsArray[indexPath.row]
        let selectedLink = FavouriteListManager.shared.favLink[indexPath.row]
        let selectedAuthor = FavouriteListManager.shared.favAuthor[indexPath.row]
        
        let selectedImage = FavouriteListManager.shared.favImage[indexPath.row]
        print(selectedDescription)
        print(selectedLink)
        print(selectedAuthor)
        print(selectedImage)
        
        favouriteTableView.deselectRow(at: indexPath, animated: true)
        print("celltapped")

        let detailVC = DetailViewController()
        detailVC.detailDescriptionLabel.text = selectedDescription
        detailVC.detailLinkLabel.text = selectedLink
        detailVC.detailAuthorLabel.text = selectedAuthor
        detailVC.detailNewsImageView.image = selectedImage

        

        navigationController?.pushViewController(detailVC, animated: true)
    }

}
