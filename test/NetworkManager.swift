//
//  NetworkManager.swift
//  test
//
//  Created by N S on 12.07.2023.
//

import Foundation

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    
}

struct Source: Codable {
    let name: String
}

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a8c230c21d4f4cb49591379d27244469")

    }
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    
                    completion(.success(result.articles))
                    /*for article in result.articles {
                        print(article.title)
                    }*/
                } catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}
