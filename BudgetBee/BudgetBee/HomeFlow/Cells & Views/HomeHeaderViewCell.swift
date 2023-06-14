//
//  HomeHeaderViewCell.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 19/05/2023.
//

import UIKit

class HomeHeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileBtn.setTitle("", for: .normal)
        notificationBtn.setTitle("", for: .normal)
    }
    
    func configure(with UserName: String) {
        self.titleLabel.text = "Hi \(UserName)!"
        self.dateLabel.text = getCurrentDate()
    }
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd , yyyy"
        return formatter.string(from: Date())
    }

}
