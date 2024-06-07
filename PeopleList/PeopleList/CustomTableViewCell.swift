//
//  CustomTableViewCell.swift
//  PeopleList
//
//  Created by Андрей Васильев on 05.06.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var ageTxt: UILabel!
    
    func configure(with user: UserModel){
        nameTxt.text = user.firstName + " " + user.secondName
        ageTxt.text = user.age.codingKey.stringValue
    }
    
}
