//
//  SpendingCategoriesViewCell.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 20/05/2023.
//

import UIKit

class Categories {
    var name: String?
    var selected: Bool?
    
    init(name: String , selected: Bool) {
        self.name = name
        self.selected = selected
    }
}



class SpendingCategoriesViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    var categories : [Categories] = []
    var tags:  [TagModel] = []
    weak var delegate: HomeViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "AddNewCategoreyViewCell", bundle: .main), forCellWithReuseIdentifier: "AddNewCategoreyViewCell")
        categoriesCollectionView.register(UINib(nibName: "CategoreyViewCell", bundle: .main), forCellWithReuseIdentifier: "CategoreyViewCell")
    }
    
    func setupTags() {
        self.categories.removeAll()
        self.tags.forEach { tag in
            let categorey = Categories(name: tag.tagName ?? "" , selected: false)
            self.categories.append(categorey)
        }
        categoriesCollectionView.reloadData()
    }

}

extension SpendingCategoriesViewCell: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "AddNewCategoreyViewCell", for: indexPath) as! AddNewCategoreyViewCell
            return cell
        }
        
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoreyViewCell", for: indexPath) as! CategoreyViewCell
        cell.configure(categorey: categories[indexPath.item - 1])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: 80 , height: 50)
        }
        return CGSize(width: (categories[indexPath.item - 1].name?.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width ?? 0) + 30, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let addTagVC = AddNewTagViewController()
            addTagVC.type = .addTag
            addTagVC.modalPresentationStyle = .overCurrentContext
            delegate?.present(addTagVC, animated: true)
            return
        }
        categories.forEach { categorey in
            categorey.selected = false
        }
        categories[indexPath.item - 1].selected = true
        categoriesCollectionView.reloadData()
    }
    
}
