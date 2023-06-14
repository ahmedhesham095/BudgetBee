//
//  ExpensesModel.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 01/06/2023.
//

import Foundation

class ExpensesModel: Codable {
    
    var expenseName: String?
    var cost: String?
    var tagName: String?
    var date: String?
    var tagDescription: String?
    
    
    init(expenseName: String? = nil, cost: String? = nil, tagName: String? = nil, date: String? = nil, tagDescription: String? = nil) {
        self.expenseName = expenseName
        self.cost = cost
        self.tagName = tagName
        self.date = date
        self.tagDescription = tagDescription
    }
    
}

