//
//  AddNewTagViewController.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 24/05/2023.
//

import UIKit

enum ScreenType {
    case addTag
    case addExpense
}

class AddNewTagViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var addTagBtn: UIButton!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var descView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    let datepicker = UIDatePicker()
    var currentTextField: UITextField?
    var tags: [TagModel] = []
    var type: ScreenType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTagBtn.setTitle("", for: .normal)
        self.dismissBtn.setTitle("", for: .normal)
        setupUI()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        if type == .addTag {
            if txt1.text?.isEmpty ?? false || txt2.text?.isEmpty ?? false || txt3.text?.isEmpty ?? false || txt4.text?.isEmpty ?? false {
                AlertMessage.alertError("Please fill all the required data")
                return
            }
            FireBaseHelper.shared.addTagsTofireBase(tag: TagModel(tagName: txt1.text ?? "", cost: txt2.text ?? "", startDate: txt3.text ?? "", endDate: txt4.text ?? ""))
        } else {
            if txt1.text?.isEmpty ?? false || txt2.text?.isEmpty ?? false || txt3.text?.isEmpty ?? false || txt4.text?.isEmpty ?? false {
                AlertMessage.alertError("Please fill all the required data")
                return
            }
            FireBaseHelper.shared.addExpenseTofireBase(tag: ExpensesModel(expenseName: txt1.text ?? "" , cost: txt2.text ?? "" , tagName: txt3.text ?? "" ,date: txt4.text ?? "" , tagDescription: txt5.text ?? ""))
        }
        self.dismiss(animated: true)
    }
    
    func setupUI() {
        if type == .addExpense {
            titleLabel.text = "Add Expenses"
            txt1.placeholder = "Name"
            txt2.placeholder = "Cost"
            txt3.placeholder = "Tag"
            txt4.placeholder = "Date"
            txt4.addTarget(self, action: #selector(textDidBeginEditing), for: UIControl.Event.editingDidBegin)
            txt3.addTarget(self, action: #selector(textDidBeginEditing), for: UIControl.Event.editingDidBegin)
            txt3.delegate = self
            txt4.delegate = self
            descView.isHidden = false
        } else {
            titleLabel.text = "Add New Tag"
            descView.isHidden = true
            txt1.placeholder = "Tag Name"
            txt2.placeholder = "Budget"
            txt3.placeholder = "Start Date"
            txt4.placeholder = "End Date"
            txt3.addTarget(self, action: #selector(textDidBeginEditing), for: UIControl.Event.editingDidBegin)
            txt4.addTarget(self, action: #selector(textDidBeginEditing), for: UIControl.Event.editingDidBegin)
        }
    }
    
    func createDatePicker(sender: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))

        
        toolbar.setItems([donebtn], animated: true)
        
        sender.inputAccessoryView = toolbar
        
        sender.inputView = datepicker
        if #available(iOS 13.4, *) {
            datepicker.preferredDatePickerStyle = .wheels
        }
        self.currentTextField = sender
        datepicker.datePickerMode = .date
    }
    
    @objc func donepressed() {
        let dateformator = DateFormatter()
        dateformator.dateStyle = .medium
        dateformator.timeStyle = .none
        currentTextField?.text = dateformator.string(from: datepicker.date)
        self.view.endEditing(true)
    }
    
    func showActionSheet() {
        let optionMenu = UIAlertController(title: "Tags", message: "Choose a tag", preferredStyle: .actionSheet)
        for i in tags{
            let tag = UIAlertAction(title: i.tagName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.txt3.text = i.tagName
            })
            optionMenu.addAction(tag)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
                                            {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
                     
}

extension AddNewTagViewController {
    @objc func textDidBeginEditing(sender:UITextField) -> Void {
        if type == .addExpense , sender == txt3 {
            showActionSheet()
        } else {
            createDatePicker(sender: sender)
        }
        
    }
}

extension AddNewTagViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if type == .addExpense {
            if textField == txt3 || textField == txt4 {
                textField.text = ""
                return false
            }
        }
        return true
    }
}
