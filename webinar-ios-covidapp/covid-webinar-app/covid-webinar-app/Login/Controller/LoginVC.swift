//
//  LoginVC.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var backgroundVw: UIView!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailWarningLbl: UILabel!
    @IBOutlet weak var passwordWarningLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    var data: [String] = ["ios.dev@gits.id", "dokterios2020"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backgroundVw.roundCorners(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 10)
        emailTf.delegate = self
        passwordTf.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    func updateButtonState() {
        let isFilled = (emailTf.text?.isEmpty == false && passwordTf.text?.isEmpty == false)
        loginBtn.isEnabled = isFilled
        
        if emailTf.text?.isEmpty == false && passwordTf.text?.isEmpty == false {
            loginBtn.backgroundColor = .systemPurple
        } else {
            loginBtn.backgroundColor = .lightGray
        }
    }
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
     
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }

    @IBAction func emailDidChanged(_ sender: UITextField) {
        emailWarningLbl.isHidden = !(sender.text?.isEmpty ?? false)
        updateButtonState()
    }
    
    @IBAction func passwordDidChanged(_ sender: UITextField) {
        passwordWarningLbl.isHidden = !(sender.text?.isEmpty ?? false)
        updateButtonState()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        let isValid = (emailTf.text == data.first && passwordTf.text == data.last)
        if isValid == true {
            let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
            let vc = storyboard.instantiateInitialViewController() as? TabBarVC ?? UIViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Perhatian", message: "Email atau password Anda tidak valid.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTf {
            emailTf.resignFirstResponder()
            passwordTf.becomeFirstResponder()
        } else {
            passwordTf.resignFirstResponder()
        }
        return true
    }
}
