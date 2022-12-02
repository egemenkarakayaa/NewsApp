//
//  APICaller.swift
//  NewsApp
//
//  Created by Egemen Karakaya on 2.12.2022.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        
    static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=TR&apiKey=dcae093f49334707aa3bc698f170ddf5")
        
    }
    
    private init(){
        
    }
    
    
}
