//
//  SecondVC.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

class FavManager {
    static let shared = FavManager()
    var favs: [String] = []
    
    let defaults = UserDefaults.standard
    let favKey = "favKey"
    
    init() {
        if let savedFavs = defaults.object(forKey: favKey) as? [String] {
            favs = savedFavs
        }
           
    }
    
    func addFav(_ fav: String) {
        favs.append(fav)
        saveFavs()
    }
    
    private func saveFavs() {
        defaults.set(favs, forKey: favKey)
    }
}

class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favTableView = UITableView()
    
    var data = ["smth"]
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           view.backgroundColor = .white
           
        view.addSubview(favTableView)
        favTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favCell")
        favTableView.delegate = self
        favTableView.dataSource = self
       }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavManager.shared.favs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        cell.textLabel?.text = FavManager.shared.favs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favTableView.deselectRow(at: indexPath, animated: true)
        print("celltapped")
    }

}
