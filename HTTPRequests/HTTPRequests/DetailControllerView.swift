//
//  DetailControllerView.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 23.06.2024.
//

import UIKit
import CoreData
class DetailControllerView: UIViewController {
    
    var post: EmailedArticle!
    
    weak var deligate: ViewControllerDeligate?
    
    @IBOutlet weak var Header: UILabel!
    
    @IBOutlet weak var Author: UILabel!
    
    @IBOutlet weak var More: UILabel!
    
    @IBOutlet weak var Image: UIImageView!
    
    let networkManager = NetworkManager()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context.reset()
        
        btn.setTitle("Already added to favourites", for: .disabled)
        btn.setTitle("Add to favourites", for: .normal)

        let fetchRequest: NSFetchRequest<PostDB2> = PostDB2.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "postId == %lld", Int64(post.id))
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                btn.isEnabled = false
            } else {
                btn.isEnabled = true
            }
        } catch {
            print("ERR: \(error)")
        }

        Header.text = post.title
        Author.text = post.abstract
        More.text = post.publishedDate
        if !post.media.isEmpty {
            if !post.media[0].mediaMetadata.isEmpty {
                let size = post.media[0].mediaMetadata.count-1
                networkManager.downloadImage(url: post.media[0].mediaMetadata[size].url) {[weak self] (result) in
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
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
        let postDB2 = PostDB2(context: context)
        postDB2.postId = Int64(post.id)
        postDB2.date = post.publishedDate
        postDB2.title = post.title
        postDB2.descriptions = post.abstract
        if !post.media.isEmpty {
            if !post.media[0].mediaMetadata.isEmpty {
                let size = post.media[0].mediaMetadata.count-1
                postDB2.image_url = post.media[0].mediaMetadata[size].url
            }
        }
        if context.hasChanges {
              do {
                  try context.save()
                  deligate?.deletePost(id: post.id)
                  dismiss(animated: true)
              } catch {
                context.rollback()
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
        
    }
}
