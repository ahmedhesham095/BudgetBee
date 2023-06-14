//
//  OverviewViewController.swift
//  iPayBills
//
//  Created by Ahmed Hesham on 3/14/19.
//  Copyright © 2019 Ahmed Hesham. All rights reserved.
//

import UIKit
import JTAppleCalendar
class OverviewViewController: UIViewController , JTAppleCalendarViewDelegate , JTAppleCalendarViewDataSource {
    
    @IBOutlet weak var calendarDay: JTAppleCalendarView!
    @IBOutlet weak var prevMonthArrow: UIButton!
    @IBOutlet weak var nextMonthArrow: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    var startDate = Date()
    var endDate = Date()
    var expenses: [ExpensesModel] = []
    var monthExpenses: [ExpensesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        calendarDay.calendarDelegate = self
        calendarDay.calendarDataSource = self
        calendarDay.cellSize = 50
        calendarDay.register(UINib(nibName: "DayViewCell", bundle: nil), forCellWithReuseIdentifier: "DayViewCell")
        prevMonthArrow.setTitle("", for: .normal)
        nextMonthArrow.setTitle("", for: .normal)
        profileBtn.setTitle("", for: .normal)
        notificationBtn.setTitle("", for: .normal)
        setCurrentDate()
    }
    
    @IBAction func nextMonthAction(_ sender: Any) {
        self.startDate = startDate.noon().adding(.month, value: 1)
        self.endDate = startDate
        calendarDay.reloadData()
        setCurrentDate()
        checkCurrentDate()
    }
    
    @IBAction func prevMonthAction(_ sender: Any) {
        self.startDate = startDate.noon().adding(.month, value: -1)
        self.endDate = startDate
        calendarDay.reloadData()
        setCurrentDate()
        checkCurrentDate()
    }
    
    func setCurrentDate() {
        let now = startDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        let current = startDate
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy"
        let nameOfDay = dateFormatter2.string(from: current)
        monthLabel.text = nameOfMonth + " " + nameOfDay
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dateLabel.text = getTitleDate()
        FireBaseHelper.shared.getExpenses { expenses in
            if expenses.count > 0 {
                self.expenses.removeAll()
                self.expenses = expenses
                self.checkCurrentDate()
            }
        }
    }
    
    func getTitleDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd , yyyy"
        return formatter.string(from: Date())
    }
    
   func checkCurrentDate() {
       self.expenses.forEach { expense in
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMM dd,yyyy"
           let stringDate = expense.date ?? ""
           let date = dateFormatter.date(from: stringDate)!
           if date.month == startDate.month {
               monthExpenses.append(expense)
           }
           print(date)
       }
       calendarDay.reloadData()
    }
   
}

extension OverviewViewController {
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = calendarDay.dequeueReusableCell(withReuseIdentifier: "DayViewCell", for: indexPath) as! DayViewCell
            
          cell.dayLabel.text = cellState.text
    }
    

    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendarDay.dequeueReusableCell(withReuseIdentifier: "DayViewCell", for: indexPath) as! DayViewCell
        print(cellState.text)
        cell.dayLabel.text = cellState.text
        cell.dayView.backgroundColor = .white
        cell.dayLabel.textColor = UIColor(hexString: "6B7280")
        monthExpenses.forEach { expense in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd,yyyy"
            let stringDate = expense.date ?? ""
            let currDate = dateFormatter.date(from: stringDate)!
            if currDate.day == date.day &&  (date.month == currDate.month) {
                cell.dayView.backgroundColor = UIColor(hexString: "5762D5")
                cell.dayLabel.textColor = .white
            }
        }
        return cell
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate =  self.startDate // You can use date generated from a formatter
        let endDate = self.endDate      // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
                                                 calendar: Calendar.current,
                                                 generateInDates: .off,
                                                 generateOutDates: .off,
                                                 firstDayOfWeek: .sunday , hasStrictBoundaries: false)
        return parameters
    }
    
    
    
    
}
