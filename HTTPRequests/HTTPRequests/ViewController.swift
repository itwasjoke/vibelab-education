//
//  ViewController.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 22.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
//        getDataRequest()
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
            destController.post = post
        }
    }


}

//        guard let url2 = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
