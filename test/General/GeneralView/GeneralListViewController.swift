//
//  FirstVC.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import UIKit

final class GeneralListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var cellModels = [GeneralListTableViewCellModel]()
    var articles = [Article]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GeneralListTableViewCell.self, forCellReuseIdentifier: GeneralListTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        
        NetworkManager.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.cellModels = articles.compactMap({ GeneralListTableViewCellModel(author: $0.author ?? "There's no author", title: $0.title, date: $0.publishedAt, imageURL: URL(string: $0.urlToImage ?? "")) })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GeneralListTableViewCell.identifier, for: indexPath) as? GeneralListTableViewCell else { fatalError() }
        cell.configure(with: cellModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let detailVC = DetailViewController()

        detailVC.detailAuthorLabel.text = article.author 
        detailVC.detailDescriptionLabel.text = article.description
        detailVC.detailLinkLabel.text = article.url 
        
        if let imageURL = URL(string: article.urlToImage ?? "") {
            DispatchQueue.global().async { [weak self] in
                if let imageData = try? Data(contentsOf: imageURL), let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        detailVC.detailNewsImageView.image = image
                    }
                }
            }
        }

        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
