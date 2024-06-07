//
//  DetailViewController.swift
//  PeopleList
//
//  Created by Андрей Васильев on 05.06.2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameDetailTxt: UILabel!
    
    @IBOutlet weak var ageDetailTxt: UILabel!
    
    @IBOutlet weak var genderDetailTxt: UILabel!
    
    @IBOutlet weak var workDetailTxt: UILabel!
    
    @IBOutlet weak var phoneDetailTxt: UILabel!
    
    @IBOutlet weak var emailDetailTxt: UILabel!
    var user: UserModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDetailTxt.text = user.firstName + " " + user.secondName
        ageDetailTxt.text = user.age.codingKey.stringValue
        genderDetailTxt.text = user.gender.rawValue
        workDetailTxt.text = user.workSpace
        emailDetailTxt.text = user.email
        phoneDetailTxt.text = user.phone
        nameDetailTxt.sizeToFit()
        ageDetailTxt.sizeToFit()
        // Do any additional setup after loading the view.
    }

}
