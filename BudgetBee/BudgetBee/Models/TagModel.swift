//
//  TagModel.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 27/05/2023.
//

import Foundation

class TagModel: Codable {
    
    var tagName: String?
    var cost: String?
    var startDate: String?
    var endDate: String
    
    
    init(tagName: String , cost: String , startDate: String , endDate: String) {
        self.tagName = tagName
        self.cost = cost
        self.startDate = startDate
        self.endDate = endDate
    }
    
}
