//
//  ViewController.swift
//  NewsApp
//
//  Created by Egemen Karakaya on 2.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        view.backgroundColor = .white
        
        APICaller.shared.getTopStories { result in
            
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
}
