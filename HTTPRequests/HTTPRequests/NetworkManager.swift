//
//  NetworkManager.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 23.06.2024.
//

import Foundation
import UIKit

enum ObtainPostsResult {
    case success(posts: [EmailedArticle])
    case failure(error:Error)
}

enum ObtainImageResult {
    case success(image: UIImage?)
    case failure(error: Error)
}

class NetworkManager {
    let sessionConfiguration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    let session = URLSession.shared
    
    func downloadImage(url: String, comletition: @escaping (ObtainImageResult) -> Void){
        guard let url = URL(string: url) else { return }
        
        session.dataTask(with: url) { [weak self]
            (data, response, error) in
            
            var result : ObtainImageResult
            
            defer {
                DispatchQueue.main.async {
                    comletition(result)
                }
            }
            
            guard let strongSelf = self else {
                result = .success(image: nil)
                return
            }
            
            if error == nil, let parsData = data {
                guard let image = UIImage(data:parsData) else {
                    result = .success(image: nil)
                    return
                }
                
                result = .success(image: image)
            }
            else{
                result = .success(image: nil)
            }
            
        }.resume()
    }
    
    func getDataRequest(comletition: @escaping (ObtainPostsResult) -> Void) {
        
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=0muLCoB8yxJCTLU4AX0wPnxAM6UGzAKR") else { return }
        session.dataTask(with: url) { [weak self]
            (data, response, error) in
            
            var result : ObtainPostsResult
            
            defer {
                DispatchQueue.main.async {
                    comletition(result)
                }
            }
            guard let strongSelf = self else {
                result = .success(posts: [])
                return
            }
            
            if error == nil, let parsData = data {
                guard let posts = try? strongSelf.decoder.decode(Post.self, from: parsData) else {
                    result = .success(posts: [])
                    return
                }
                
                result = .success(posts: posts.results)
            }
            else {
                result = .failure(error: error!)
            }
            
//            comletition(result)
            
        }.resume()
    }
}
