//
//  LoginViewController.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 08/05/24.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        performLoginAPI()
    }
    
    func performLoginAPI() {
            guard let email = emailTextField.text, !email.isEmpty  else {
                showAlert(title: "Alert..!", message: "Please Enter Valid Email")
                return
            }
            guard let password = passwordTextField.text, !password.isEmpty  else {
                showAlert(title: "Alert..!", message: "Please Enter Password")
                return
            }
            let loginEndpoint = Endpoints.login(emailId: email, password: password)
            SVProgressHUD.show()
        
        NetworkLayer().performAPICall(with: loginEndpoint, type: LoginResponseModel.self) { model in
                SVProgressHUD.dismiss()
                self.navigateToHome()
            } onFailure: { error in
                SVProgressHUD.dismiss()
                self.showAlert(title: "Email Not Registered", message: error)
            }
        }
        func navigateToHome() {
            guard let tabController = self.storyboard?.instantiateViewController(identifier: "HomeTabBarController") else {
                return
            }
            self.navigationController?.pushViewController(tabController, animated: true)
        }
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))
            self.present(alert, animated: true)
            
        }
    

}
