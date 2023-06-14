//
//  BudgetViewCell.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 21/05/2023.
//

import UIKit

class BudgetViewCell: UICollectionViewCell {

    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func calcTotal(tags: [TagModel] , expenses: [ExpensesModel]) {
        var totalTags = 0
        var totalExpenses = 0
        
        tags.forEach { tag in
            totalTags += Int(tag.cost ?? "") ?? 0
        }
        
        expenses.forEach { expense in
            totalExpenses += Int(expense.cost ?? "") ?? 0
        }
        
        self.budgetLabel.text = "$\(totalTags)"
        self.expenseLabel.text = "$\(totalExpenses)"
    }

}
