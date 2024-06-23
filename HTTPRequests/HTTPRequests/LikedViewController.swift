//
//  LikedViewController.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 23.06.2024.
//

import UIKit
import CoreData
class LikedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataSource = [PostDB2]()

    @IBOutlet weak var tableLiked: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableLiked.dataSource = self
        tableLiked.delegate = self
        
        let fetchRequest: NSFetchRequest<PostDB2> = PostDB2.fetchRequest()
        do {
            dataSource = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        tableLiked.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let fetchRequest: NSFetchRequest<PostDB2> = PostDB2.fetchRequest()
        do {
            dataSource = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        tableLiked.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "likedPost", for: indexPath)
        let post = dataSource[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.descriptions
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
