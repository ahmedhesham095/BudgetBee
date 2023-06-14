//
//  CategoreyViewCell.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 21/05/2023.
//

import UIKit

class CategoreyViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(categorey: Categories) {
        cellBackgroundView.backgroundColor = categorey.selected ?? false ? UIColor(hexString: "FEB101") : .white
        titleLabel.textColor = categorey.selected ?? false ? .white : UIColor(hexString: "#D1D5DB")
        titleLabel.text = categorey.name
    }
    
}
