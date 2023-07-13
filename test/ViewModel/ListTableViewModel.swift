//
//  ListTableViewModel.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import Foundation

class ListTableViewCellViewModel {
    let author: String
    let title: String
    let date: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(author: String, title: String, date: String, imageURL: URL?) {
        self.author = author
        self.title = title
        self.date = date
        self.imageURL = imageURL
    }
}
