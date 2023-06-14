//
//  ForgotPasswordViewController.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 13/05/2023.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    var email: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func skipAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openEmailAction(_ sender: Any) {
        let emailURL = NSURL(string: "message://")!
        if UIApplication.shared.canOpenURL(emailURL as URL)
        {
            UIApplication.shared.open(emailURL as URL, options: [:],completionHandler: nil)
        }
    }
    
    @IBAction func resendAction(_ sender: Any) {
        resetEmail()
    }
    
    func resetEmail() {
        Auth.auth().sendPasswordReset(withEmail: email ?? "") { (error) in
            if error != nil {
                AlertMessage.alertError(error?.localizedDescription)
            }
        }
    }
    
}
