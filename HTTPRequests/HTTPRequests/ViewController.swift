//
//  ViewController.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 22.06.2024.
//

import UIKit
protocol ViewControllerDeligate: AnyObject {
    func deletePost(id: Int)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerDeligate {
    
    let networkManager = NetworkManager()
    var dataSource = [EmailedArticle]()
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        table.dataSource = self
        table.delegate = self
        
        networkManager.getDataRequest {[weak self] (result) in
            switch result {
            case .success(let posts):
                self?.dataSource = posts
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
            case .failure(let error):
                print("ERR: \(error.localizedDescription)")
            }
            
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        let post = dataSource[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.abstract
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInfo", sender: dataSource[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            let post = sender as? EmailedArticle
            let destController = segue.destination as! DetailControllerView
            destController.deligate = self
            destController.post = post
        }
    }
    
    func deletePost(id: Int) {
        print(id)
        dataSource = dataSource.filter {$0.id != id}
        table.reloadData()
    }


}

