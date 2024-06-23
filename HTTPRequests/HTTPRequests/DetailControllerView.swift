//
//  DetailControllerView.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 23.06.2024.
//

import UIKit

class DetailControllerView: UIViewController {
    
    var post: EmailedArticle!
    
    @IBOutlet weak var Header: UILabel!
    
    @IBOutlet weak var Author: UILabel!
    
    @IBOutlet weak var More: UILabel!
    
    @IBOutlet weak var Image: UIImageView!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Header.text = post.title
        Author.text = post.abstract
        More.text = post.publishedDate
        if !post.media.isEmpty {
            if !post.media[0].mediaMetadata.isEmpty {
                networkManager.downloadImage(url: post.media[0].mediaMetadata[0].url) {[weak self] (result) in
                    switch result {
                    case .success(let image):
                        if image != nil {
                            DispatchQueue.main.async {
                                self?.Image.image = image
                            }
                        }
                    case .failure(let error):
                        print("error \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
