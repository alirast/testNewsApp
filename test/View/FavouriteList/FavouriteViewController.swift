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
        return FavouriteListManager.shared.favouritedNewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        cell.textLabel?.text = FavouriteListManager.shared.favouritedNewsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let selected = FavouriteListManager.shared.favouritedNewsArray[indexPath.row]
        print(selected)
        
        favouriteTableView.deselectRow(at: indexPath, animated: true)
        print("celltapped")

        let detailVC = DetailViewController()
        detailVC.detailDescriptionLabel.text = selected

        navigationController?.pushViewController(detailVC, animated: true)
    }

}
