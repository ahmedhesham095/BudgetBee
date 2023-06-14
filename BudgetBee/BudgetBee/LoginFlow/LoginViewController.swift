//
//  LoginViewController.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 09/05/2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordBtn: UIButton!
    @IBOutlet weak var googleSignInBtn: UIButton!
    @IBOutlet weak var tickIcon: UIImageView!
    @IBOutlet weak var rememberMeView: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordBtn.setTitle("", for: .normal)
        googleSignInBtn.setTitle("", for: .normal)
        txtPassword.isSecureTextEntry = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        rememberMeView.addGestureRecognizer(tap)
    }

    
    @IBAction func signUpAction(_ sender: Any) {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        if txtEmail.text?.isEmpty == true {
            AlertMessage.alertError("Please Enter Your Email")
            return
        }
        let forgotVC = ForgotPasswordViewController()
        forgotVC.email = self.txtEmail.text ?? ""
        self.navigationController?.pushViewController(forgotVC, animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        tickIcon.isHidden = !tickIcon.isHidden
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
                let currUser = UserModel(id: result?.user.uid ?? "", name: result?.user.displayName ?? "", mail: result?.user.email ?? "")
                let userDefaults = UserDefaults.standard
                do {
                    try userDefaults.setObject(currUser, forKey: UserDefaultKeys.user.rawValue)
                } catch {
                    print(error.localizedDescription)
                }
                let homeVC = UINavigationController(rootViewController: HomeTabbarViewController())
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true)
            }
        }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        if txtEmail.text?.isEmpty == true || txtPassword.text?.isEmpty == true {
            AlertMessage.alertError("Please fill all the fields")
            return
        }
        
        Auth.auth().signIn(withEmail: txtEmail.text ?? "", password: txtPassword.text ?? "") { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error != nil {
                AlertMessage.alertError(error?.localizedDescription)
            } else {
                let homeVC = UINavigationController(rootViewController: HomeTabbarViewController())
                homeVC.modalPresentationStyle = .fullScreen
                strongSelf.present(homeVC, animated: true)
                let currUser = UserModel(id: authResult?.user.uid ?? "", name: authResult?.user.displayName ?? "", mail: authResult?.user.email ?? "")
                let userDefaults = UserDefaults.standard
                do {
                    try userDefaults.setObject(currUser, forKey: UserDefaultKeys.user.rawValue)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func showHidePassword(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
    }
    
}
