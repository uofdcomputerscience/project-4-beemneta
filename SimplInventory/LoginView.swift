//
//  LoginView.swift
//  SimplInventory
//
//  Created by Beemnet Alemayehu on 12/17/19.
//  Copyright © 2019 Beemnet Alemayehu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginView: UIViewController {
    
    static var userID:String! = ""
    static var accountUserName:String! = ""
    static var db = Firestore.firestore()
    
    
    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var loginButton: UIButton!    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let paswrd = passwordTxtFld.text, !paswrd.isEmpty else { return }
        guard let email = emailTxtFld.text, !email.isEmpty else { return }        
        loginUser(user: email, pass: paswrd)
        
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        guard let userName = userNameTxtFld.text, !userName.isEmpty else { return }
        guard let paswrd = passwordTxtFld.text, !paswrd.isEmpty else { return }
        guard let email = emailTxtFld.text, !email.isEmpty else { return }
        createUser(user: email, pass: paswrd, name: userName)
    }
    
    func createUser (user:String,pass:String, name:String ) {
        guard !user.isEmpty else { return }
        guard !pass.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: user, password: pass) { (result, error) in
            if error != nil {
                self.userNameTxtFld.text = "Please enter a valid email or password"
                self.emailTxtFld.text = "\(error!.localizedDescription)"
            } else {
                LoginView.userID = result!.user.uid
                LoginView.accountUserName = self.userNameTxtFld.text!
                LoginView.db.collection(LoginView.userID).addDocument(data: ["AccountUserName" : name, "UserID":LoginView.userID])
                self.toMainFeed()
                print("account created")
            }
            
        }
        
    }
    
     func toMainFeed() {
        let vc = storyboard?.instantiateViewController(identifier: "mainFeed") as? mainFeed        
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }

    func loginUser (user:String, pass:String) {
        guard !user.isEmpty else { return }
        guard !pass.isEmpty else { return }
        Auth.auth().signIn(withEmail: user, password: pass) { (result, error) in
            if error != nil {
                self.userNameTxtFld.text = "\(error!.localizedDescription )"
            } else {
                self.toMainFeed()
                LoginView.userID = result!.user.uid                
            }
        }
        
    }
    
    
    
    
    
    
}
