//
//  UserModel.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 17/05/2023.
//

import Foundation

class UserModel: Codable {
    
    var userId: String?
    var userName: String?
    var email: String?
    
    
    init(id: String , name: String , mail: String) {
        self.userId = id
        self.userName = name
        self.email = mail
    }
    
}
