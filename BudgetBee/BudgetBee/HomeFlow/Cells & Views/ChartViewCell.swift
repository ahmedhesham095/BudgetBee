//
//  ChartViewCell.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 21/05/2023.
//

import UIKit
import FLCharts


enum ChartType {
    case daily
    case weekly
    case monthly
}

class ChartViewCell: UICollectionViewCell {
    
    @IBOutlet weak var chartView: FLChart!
    @IBOutlet weak var dailyBtn: UIButton!
    @IBOutlet weak var weeklyBtn: UIButton!
    @IBOutlet weak var monthlyBtn: UIButton!
    
    var totalTags = 0
    var totalExpenses = 0
    var chartType: ChartType?
    
    var weeklyValues: [SinglePlotable] {
        [SinglePlotable(name: "sun", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "mon", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "tue", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "wed", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "thu", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "fri", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "sat", value: CGFloat(self.totalExpenses)) ,
         SinglePlotable(name: "sun", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "mon", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "tue", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "wed", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "thu", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "fri", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "sat", value: CGFloat(self.totalExpenses)) ,
         SinglePlotable(name: "sun", value: CGFloat(self.totalExpenses)) ,
         SinglePlotable(name: "sat", value: CGFloat(self.totalExpenses)) ,
         SinglePlotable(name: "sat", value: CGFloat(self.totalExpenses))
        ]
    }
    
    var dailyValues: [SinglePlotable] {
        [SinglePlotable(name: "sun", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "mon", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "tue", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "wed", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "thu", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "fri", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "sat", value: CGFloat(self.totalTags)) ,
         SinglePlotable(name: "sun", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "mon", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "tue", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "wed", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "thu", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "fri", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "sat", value: CGFloat(self.totalTags)) ,
         SinglePlotable(name: "sun", value: CGFloat(self.totalTags)) ,
         SinglePlotable(name: "sat", value: CGFloat(self.totalTags)) ,
         SinglePlotable(name: "sat", value: CGFloat(self.totalTags))
        ]
    }
    
    var monthlyValues: [SinglePlotable] {
        [SinglePlotable(name: "sun", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "mon", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "tue", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "wed", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "thu", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "fri", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "sat", value: CGFloat(self.totalTags)) ,
         SinglePlotable(name: "sun", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "mon", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "tue", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "wed", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "thu", value: CGFloat(self.totalExpenses)),
         SinglePlotable(name: "fri", value: CGFloat(self.totalTags)),
         SinglePlotable(name: "sat", value: CGFloat(self.totalExpenses)) ,
         SinglePlotable(name: "sun", value: CGFloat(self.totalTags)) ,
         SinglePlotable(name: "sat", value: CGFloat(self.totalExpenses)) ,
         SinglePlotable(name: "sat", value: CGFloat(self.totalTags))
        ]
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupChart() {
        let scatterChartData = FLChartData(title: "Days",
                                           data: getChartType(),
                                           legendKeys: [Key(key: "sun", color: FLColor(hex: "5762D5")), Key(key: "mon", color: .blue), Key(key: "tue", color: FLColor(hex: "5762D5")) , Key(key: "wed", color: FLColor(hex: "5762D5")) , Key(key: "thu", color: FLColor(hex: "5762D5")) , Key(key: "fri", color: FLColor(hex: "5762D5")) , Key(key: "sat", color: FLColor(hex: "5762D5")) ],
                                           unitOfMeasure: "Days")
        scatterChartData.xAxisUnitOfMeasure = "days of weeks"

        chartView.setup(data: FLChartData(title: "Day", data: getChartType(), legendKeys: [Key(key: "10", color: FLColor(hex: "5762D5")), Key(key: "20", color: FLColor(hex: "5762D5")), Key(key: "30", color: FLColor(hex: "5762D5")) , Key(key: "40", color: FLColor(hex: "5762D5")) , Key(key: "50", color: FLColor(hex: "5762D5")) , Key(key: "60", color: FLColor(hex: "5762D5")) , Key(key: "70", color: FLColor(hex: "5762D5")) ], unitOfMeasure: "day"), type: .bar())
        chartView.cartesianPlane.yAxisPosition = .left
        chartView.averageLineOverlapsChart = true
        chartView.config.dashedLines.color = .blue
    }
    
    func loadDate(tags: [TagModel] , expenses: [ExpensesModel]) {
        var totalTags = 0
        var totalExpenses = 0
        
        tags.forEach { tag in
            totalTags += Int(tag.cost ?? "") ?? 0
        }
        
        expenses.forEach { expense in
            totalExpenses += Int(expense.cost ?? "") ?? 0
        }
        
        self.totalTags = totalTags
        self.totalExpenses = totalExpenses
    }
    
    func getChartType() -> [SinglePlotable] {
        switch chartType {
        case .daily:
            return self.dailyValues
        case .weekly:
            return self.weeklyValues
        case .monthly:
            return self.monthlyValues
        case .none:
            return self.dailyValues
        }
    }
    
    @IBAction func dailyBtnAction(_ sender: Any) {
        dailyBtn.backgroundColor = UIColor(hexString: "D1D5DB")
        dailyBtn.tintColor = UIColor(hexString: "374151")
        dailyBtn.cornurRadius = 10
        weeklyBtn.backgroundColor = UIColor.white
        weeklyBtn.tintColor = UIColor(hexString: "D1D5DB")
        monthlyBtn.backgroundColor = UIColor.white
        monthlyBtn.tintColor = UIColor(hexString: "D1D5DB")
        self.chartType = .daily
        setupChart()
    }
    
    @IBAction func weeklyBtnAction(_ sender: Any) {
        weeklyBtn.backgroundColor = UIColor(hexString: "D1D5DB")
        weeklyBtn.tintColor = UIColor(hexString: "374151")
        weeklyBtn.cornurRadius = 10
        dailyBtn.backgroundColor = UIColor.white
        dailyBtn.tintColor = UIColor(hexString: "D1D5DB")
        monthlyBtn.backgroundColor = .white
        monthlyBtn.tintColor = UIColor(hexString: "D1D5DB")
        self.chartType = .weekly
        setupChart()
    }
    
    
    @IBAction func monthlyBtnAction(_ sender: Any) {
        monthlyBtn.backgroundColor = UIColor(hexString: "D1D5DB")
        monthlyBtn.tintColor = UIColor(hexString: "374151")
        monthlyBtn.cornurRadius = 10
        dailyBtn.backgroundColor = UIColor.white
        dailyBtn.tintColor = UIColor(hexString: "D1D5DB")
        weeklyBtn.backgroundColor = .white
        weeklyBtn.tintColor = UIColor(hexString: "D1D5DB")
        self.chartType = .monthly
        setupChart()
    }
}
