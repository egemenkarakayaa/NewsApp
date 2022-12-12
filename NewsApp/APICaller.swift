//
//  APICaller.swift
//  NewsApp
//
//  Created by Egemen Karakaya on 2.12.2022.
//

import Foundation

final class APICaller {
    
    private init(){
        
    }
    
    
    static let shared = APICaller()
    
    struct Constants {
        
    static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=TR&apiKey=dcae093f49334707aa3bc698f170ddf5")
    }
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
             
            if let error = error {
                completion(.failure(error))
            }
            
            else if let  data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
                
            }
                
        }
          task.resume()
        
   }
    
}


// Models

struct APIResponse: Codable {
    
    let articles: [Article]
}


struct Article: Codable {
    
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}


struct Source: Codable {
    
    let name: String
}
