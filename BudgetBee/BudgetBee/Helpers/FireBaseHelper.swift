//
//  FireBaseHelper.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 27/05/2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase

class FireBaseHelper {
    
    static var shared = FireBaseHelper()
    var ref : DatabaseReference = Database.database().reference()
    
    func addTagsTofireBase(tag: TagModel) {
        do {
            let currUser = try UserDefaults.standard.getObject(forKey: UserDefaultKeys.user.rawValue, castTo: UserModel.self)
            self.ref.child(currUser.userId ?? "").child(currUser.userName ?? "").child("Tags").childByAutoId().setValue(["tagName": tag.tagName , "cost": tag.cost , "start_date" : tag.startDate , "end_date" : tag.endDate ])
        } catch{}
    }
    
    func addExpenseTofireBase(tag: ExpensesModel) {
        do {
            let currUser = try UserDefaults.standard.getObject(forKey: UserDefaultKeys.user.rawValue, castTo: UserModel.self)
            self.ref.child(currUser.userId ?? "").child(currUser.userName ?? "").child("Expenses").childByAutoId().setValue(["expenseName": tag.expenseName , "cost": tag.cost , "tag" : tag.tagName , "date" : tag.date , "description": tag.tagDescription ])
        } catch{}
    }
    
    func getTags(completion: @escaping ([TagModel])->()) {
        var tags: [TagModel] = []
        do {
            let currUser = try UserDefaults.standard.getObject(forKey: UserDefaultKeys.user.rawValue, castTo: UserModel.self)
            self.ref.child(currUser.userId ?? "").child(currUser.userName ?? "").child("Tags").observe(.value) { (snapshot , error)  in
                tags.removeAll()
                let snapshotValue = snapshot.value as? [String:[String:AnyObject]] ?? [:]
                let sorted = snapshotValue.sorted() { $0.key.lowercased() < $1.key.lowercased() }
                for (key, _) in sorted {
                    let keys = snapshotValue[key]
                    let tagName = keys?["tagName"] as! String
                    let startDate = keys?["start_date"] as! String
                    let endDate = keys?["end_date"] as! String
                    let cost = keys?["cost"] as! String
                    let tag = TagModel(tagName: tagName, cost: cost, startDate: startDate, endDate: endDate)
                    tags.append(tag)
                }
                completion(tags)
            }
        }catch {}
    }
    
    func getExpenses(completion: @escaping ([ExpensesModel])->()) {
        var expenses: [ExpensesModel] = []
        do {
            let currUser = try UserDefaults.standard.getObject(forKey: UserDefaultKeys.user.rawValue, castTo: UserModel.self)
            self.ref.child(currUser.userId ?? "").child(currUser.userName ?? "").child("Expenses").observe(.value) { (snapshot , error)  in
                expenses.removeAll()
                    let snapshotValue = snapshot.value as? [String:[String:AnyObject]] ?? [:]
                    let sorted = snapshotValue.sorted() { $0.key.lowercased() < $1.key.lowercased() }
                    for (key, _) in sorted {
                        let keys = snapshotValue[key]
                        let expenseName = keys?["expenseName"] as! String
                        let cost = keys?["cost"] as! String
                        let date = keys?["date"] as! String
                        let tag = keys?["tag"] as! String
                        let description = keys?["description"] as! String
                        let expense = ExpensesModel(expenseName: expenseName , cost: cost , tagName: tag, date: date , tagDescription: description)
                        expenses.append(expense)
                    }
                    completion(expenses)
            }
        }catch {}
    }
}
