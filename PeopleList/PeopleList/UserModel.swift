//
//  UserModel.swift
//  PeopleList
//
//  Created by Андрей Васильев on 05.06.2024.
//

import Foundation

enum Gender : String{
    case Male = "Male"
    case Female = "Female"
}

struct UserModel {
    var firstName: String
    var secondName: String
    var age: Int
    var gender: Gender
    var workSpace: String
    var phone: String
    var email: String
}
