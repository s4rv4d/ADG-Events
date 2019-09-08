//
//  loginPageViewController.swift
//  Events
//
//  Created by Devang Patel on 28/08/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit

class loginPageViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var regNoTextField: UITextField!
    @IBOutlet weak var stackTop: NSLayoutConstraint!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TextField Delegatges
        passTextField.delegate = self
        regNoTextField.delegate = self
        loadingView.isHidden = true
        //calling notification center
        notificationCenter()
    }
    
    
    //MARK:- Notification Center setup
    
    func notificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK:- Login Button Action
    
    @IBAction func loginButton(_ sender: UIButton) {
        if passTextField.text != "" && regNoTextField.text != "" {
            
            loadingView.isHidden = false
            actIndicator.startAnimating()
            
            //add regex
//            guard let regText = try regNoTextField
            
            do{
                let regText = try regNoTextField.validatedText(validationType: .username)
                let passText = passTextField.text //name
                
                UserDefaults.standard.set(regText, forKey: "regnumber")
                UserDefaults.standard.set(passText, forKey: "name")
                
                //go to nav bar
                    let vc = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
                    self.actIndicator.stopAnimating()
                    self.loadingView.isHidden = true
                    self.appDelegate.window?.rootViewController = vc
            }
            catch(let error){
                print("error \((error as! ValidationError).message)")
                self.actIndicator.stopAnimating()
                self.loadingView.isHidden = true
                showAlert(for: (error as! ValidationError).message)
            }
            
            
        }else {
            let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    //MARK:- Keyboard will show/hide notificatin calling functions
    @objc func keyBoardWillShow(notification: Notification){
        stackView.spacing = 20.0
        stackTop.constant = 10.0
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyBoardWillHide(notification: Notification){
        stackTop.constant = 46.0
        stackView.spacing = 50.0
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passTextField.resignFirstResponder()
        regNoTextField.resignFirstResponder()
    }
    
}
