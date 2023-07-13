//
//  NetworkManager.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import Foundation

protocol NewsNetworkManagerProtocol {
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void)
}

final class NewsNetworkManager: NewsNetworkManagerProtocol {
    static let shared = NewsNetworkManager()
    
    struct TopHeadlines {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a8c230c21d4f4cb49591379d27244469")

    }
    
    private init() {}
    
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = TopHeadlines.topHeadlinesURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NetworkManagerResponse.self, from: data)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
