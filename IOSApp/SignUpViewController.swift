//
//  SignUpViewController.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 08/05/24.
//
 
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        performAPICall()
    }
    
    func performAPICall() {
        guard let userName = usernameTextField.text, !userName.isEmpty else {
            showAlert(title: "Alert..!", message: "Please enter username")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty  else {
            showAlert(title: "Alert..!", message: "Please Enter Valid Email")
            return
        }
        guard let phoneNumber = phonenumberTextField.text, !phoneNumber.isEmpty else {
            showAlert(title: "Alert..!", message: "Please enter phonenumber")
            return
        }
      
        guard let password = passwordTextField.text, !password.isEmpty  else {
            showAlert(title: "Alert..!", message: "Please Enter Password")
            return
        }
        
        
        let model = SignUpRequestModel(userName: userName, emailId : email, password: password, phoneNumber: phoneNumber, address: "")
        
        NetworkLayer().performAPICall(with: .signUp(model: model), type: SignUpResponseModel.self) { responseModel in
                       if responseModel.message == "Registration successfull" {
                           self.navigateToLogin()
                           
                       } else {
                           self.showAlert(title: "Error", message: responseModel.error!)
                       }
                   } onFailure: { error in
                       self.showAlert(title: "Error", message: error)
                   }
    }
    func navigateToLogin() {
        guard let tabController =
                   self.storyboard?.instantiateViewController(identifier: "LoginController") else {
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
