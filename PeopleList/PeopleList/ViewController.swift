//
//  ViewController.swift
//  PeopleList
//
//  Created by Андрей Васильев on 05.06.2024.
//

import UIKit

protocol ViewControllerDeligate: AnyObject {
    func didChangeUser(_ user: UserModel)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewControllerDeligate {
    var usersList : [UserModel] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addUserBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        usersList.append(UserModel(firstName: "Andrey", secondName: "Vasilev", age: 20, gender: .Male, workSpace: "VibeLab", phone: "89994442233", email: "ardereer@gmaill.ru"))
        
        
        
        let cellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: "customCell")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let model = usersList[indexPath.row]
        
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = usersList[indexPath.row]
        performSegue(withIdentifier: "detailUserSegue", sender: model)
    }
    @IBAction func addUser(_ sender: Any) {
        performSegue(withIdentifier: "createUser", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailUserSegue" {
            let userModel = sender as? UserModel
            let destController = segue.destination as! DetailViewController
            destController.user = userModel
        }
        if segue.identifier == "createUser" {
            let destController = segue.destination as! AddNewViewController
            destController.deligate = self
        }
    }

    func didChangeUser(_ user: UserModel) {
        usersList.append(user)
        tableView.reloadData()
    }

}

