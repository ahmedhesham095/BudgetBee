//
//  HomeViewController.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 14/05/2023.
//

import UIKit

enum HomeSectionCells {
    case homeHeader
    case spendingCategories
    case budget
    case chart
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var addBtn: UIButton!
    var sections: [HomeSectionCells] = []
    var currUser: UserModel?
    var tags: [TagModel] = []
    var expenses: [ExpensesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "HomeHeaderViewCell", bundle: .main), forCellWithReuseIdentifier: "HomeHeaderViewCell")
        homeCollectionView.register(UINib(nibName: "SpendingCategoriesViewCell", bundle: .main), forCellWithReuseIdentifier: "SpendingCategoriesViewCell")
        homeCollectionView.register(UINib(nibName: "BudgetViewCell", bundle: .main), forCellWithReuseIdentifier: "BudgetViewCell")
        homeCollectionView.register(UINib(nibName: "ChartViewCell", bundle: .main), forCellWithReuseIdentifier: "ChartViewCell")
        sections = [.homeHeader , .spendingCategories , .budget , .chart]
        self.navigationController?.navigationBar.isHidden = true
        addBtn.setTitle("", for: .normal)
        setupCurrentUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FireBaseHelper.shared.getTags { tags in
            self.tags.removeAll()
            self.tags = tags
            self.homeCollectionView.reloadData()
        }
        
        FireBaseHelper.shared.getExpenses { expenses in
            self.expenses.removeAll()
            self.expenses = expenses
            self.homeCollectionView.reloadData()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func  setupCurrentUser() {
        do {
            let currUser = try UserDefaults.standard.getObject(forKey: UserDefaultKeys.user.rawValue, castTo: UserModel.self)
            self.currUser = currUser
        } catch {}
    }
    
    @IBAction func addBtnAction(_ sender: Any) {
        if self.tags.isEmpty {
            AlertMessage.alertError("Please select a tag to add expense")
            return
        }
        let addTagVC = AddNewTagViewController()
        addTagVC.type = .addExpense
        addTagVC.tags = self.tags
        addTagVC.modalPresentationStyle = .overCurrentContext
        self.present(addTagVC, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .homeHeader:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeHeaderViewCell", for: indexPath) as! HomeHeaderViewCell
            cell.configure(with: self.currUser?.userName ?? "")
            return cell
        case .spendingCategories:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "SpendingCategoriesViewCell", for: indexPath) as! SpendingCategoriesViewCell
            cell.delegate = self
            cell.tags = self.tags
            cell.setupTags()
            return cell
        case .budget:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "BudgetViewCell", for: indexPath) as! BudgetViewCell
            cell.calcTotal(tags: self.tags, expenses: self.expenses)
            return cell
        case .chart:
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "ChartViewCell", for: indexPath) as! ChartViewCell
            cell.loadDate(tags: self.tags, expenses: self.expenses)
            cell.setupChart()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch sections[indexPath.section] {
        case .homeHeader:
            return CGSize(width: collectionView.frame.width , height: 80)
        case .spendingCategories:
            return CGSize(width: collectionView.frame.width , height: 70)
        case .budget:
            return CGSize(width: collectionView.frame.width - 20 , height: 150)
        case .chart:
            return CGSize(width: collectionView.frame.width - 20 , height: 420)
        }
    }
    
}
