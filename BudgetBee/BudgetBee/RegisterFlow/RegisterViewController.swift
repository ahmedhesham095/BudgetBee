//
//  RegisterViewController.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 13/05/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var passwordView1: UIView!
    
    @IBOutlet weak var passwordView2: UIView!
    
    @IBOutlet weak var passwordView3: UIView!
    
    @IBOutlet weak var passwordView4: UIView!
    
    @IBOutlet weak var passwordView5: UIView!
    
    @IBOutlet weak var passwordView6: UIView!
    
    @IBOutlet weak var showHidePasswordBtn: UIButton!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var googleSignInBtn: UIButton!
    
    var isValidEmail = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    func setupUI() {
        emailError.text = ""
        passwordView1.backgroundColor = .ashGrey
        passwordView2.backgroundColor = .ashGrey
        passwordView3.backgroundColor = .ashGrey
        passwordView4.backgroundColor = .ashGrey
        passwordView5.backgroundColor = .ashGrey
        passwordView6.backgroundColor = .ashGrey
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtPassword.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                           for: UIControl.Event.editingChanged)
        txtPassword.isSecureTextEntry = true
        showHidePasswordBtn.setTitle("", for: .normal)
        googleSignInBtn.setTitle("", for: .normal)
    }
    
    
    func clearPasswordStack() {
        passwordView1.backgroundColor = .ashGrey
        passwordView2.backgroundColor = .ashGrey
        passwordView3.backgroundColor = .ashGrey
        passwordView4.backgroundColor = .ashGrey
        passwordView5.backgroundColor = .ashGrey
        passwordView6.backgroundColor = .ashGrey
    }
    
    func fillPasswordStack() {
        passwordView1.backgroundColor = UIColor(hexString: "38CB89")
        passwordView2.backgroundColor = UIColor(hexString: "38CB89")
        passwordView3.backgroundColor = UIColor(hexString: "38CB89")
        passwordView4.backgroundColor = UIColor(hexString: "38CB89")
        passwordView5.backgroundColor = UIColor(hexString: "38CB89")
        passwordView6.backgroundColor = UIColor(hexString: "38CB89")
    }
    
    
    
    @IBAction func signIn(_ sender: Any) {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    @IBAction func showPasswordAction(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if txtPassword.isReallyEmpty || isValidEmail == false {
            AlertMessage.alertError("please fill all the fields")
            return
        }
        Auth.auth().createUser(withEmail: txtEmail.text ?? "" , password: txtPassword.text ?? "") { authResult, error in
          // ...
            if error != nil {
              let loginVC = LoginViewController()
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
    
    @IBAction func googleSignInAction(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
            // ...
              print(error?.localizedDescription)
              return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            // ...
              print("error")
              return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in
                let homeVC = UINavigationController(rootViewController: HomeTabbarViewController())
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true)
                let currUser = UserModel(id: result?.user.uid ?? "", name: result?.user.displayName ?? "", mail: result?.user.email ?? "")
                let userDefaults = UserDefaults.standard
                do {
                    try userDefaults.setObject(currUser, forKey: UserDefaultKeys.user.rawValue)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtPassword {
            return textField.text?.count ?? 0 <= 20
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtEmail , (textField.text?.isEmpty ?? false == false) {
            if textField.text?.isValidEmail(textField.text ?? "") == false {
                emailView.borderColor = .red
                emailError.isHidden = false
                emailError.text = "Please enter a valid email address."
                isValidEmail = false
            } else {
                emailError.isHidden = true
                emailError.text = ""
                isValidEmail = true
                emailView.borderColor = UIColor(hexString: "EBECF0")
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        switch textField.text?.count {
        case 0:
            clearPasswordStack()
        case 1:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
        case 2:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
        case 3:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
            passwordView2.backgroundColor = UIColor(hexString: "38CB89")
        case 4:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
            passwordView2.backgroundColor = UIColor(hexString: "38CB89")
            passwordView3.backgroundColor = UIColor(hexString: "38CB89")
        case 5:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
            passwordView2.backgroundColor = UIColor(hexString: "38CB89")
            passwordView3.backgroundColor = UIColor(hexString: "38CB89")
            passwordView4.backgroundColor = UIColor(hexString: "38CB89")
        case 6:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
            passwordView2.backgroundColor = UIColor(hexString: "38CB89")
            passwordView3.backgroundColor = UIColor(hexString: "38CB89")
            passwordView4.backgroundColor = UIColor(hexString: "38CB89")
            passwordView5.backgroundColor = UIColor(hexString: "38CB89")
        case 7:
            passwordView1.backgroundColor = UIColor(hexString: "38CB89")
            passwordView2.backgroundColor = UIColor(hexString: "38CB89")
            passwordView3.backgroundColor = UIColor(hexString: "38CB89")
            passwordView4.backgroundColor = UIColor(hexString: "38CB89")
            passwordView5.backgroundColor = UIColor(hexString: "38CB89")
            passwordView6.backgroundColor = UIColor(hexString: "38CB89")
        default:
            fillPasswordStack()
        }
        
    }
    
}
