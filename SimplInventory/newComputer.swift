//
//  newComputer.swift
//  SimplInventory
//
//  Created by Beemnet Alemayehu on 12/17/19.
//  Copyright © 2019 Beemnet Alemayehu. All rights reserved.
//

import UIKit

class newComputer: UIViewController {
    
    @IBOutlet weak var netBiosName: UITextField!
    @IBOutlet weak var serialNumber: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var brand: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var ipAddress: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func resetButton(_ sender: UIButton) {
        netBiosName.text = ""
        serialNumber.text = ""
        model.text = ""
        brand.text = ""
        ipAddress.text = ""
        department.text = ""
        userName.text = ""
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        toMainFeed()
    }
    func toMainFeed() {
        let vc = storyboard?.instantiateViewController(identifier: "mainFeed") as? mainFeed
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func doneButton(_ sender: UIButton) {
        guard let usr = userName.text, !usr.isEmpty else { return }
         guard let net = netBiosName.text, !net.isEmpty else { return }
         guard let srn = serialNumber.text, !srn.isEmpty else { return }
         guard let ipa = ipAddress.text, !ipa.isEmpty else { return }
         guard let brand = brand.text, !brand.isEmpty else { return }
         guard let model = model.text, !model.isEmpty else { return }
        guard let dept = department.text, !dept.isEmpty else { return }
        
        LoginView.db.collection(LoginView.userID).addDocument(data: ["UserName":usr,"NetBiosName":net,"Department":dept,"IPAddress":ipa,"SerialNumber":srn,"Brand":brand,"Model":model,"isComputer":true]) { (error) in
            if error != nil {
                print (error!.localizedDescription)
            } else {
                self.toMainFeed()
                print ("Success! Document added")
            }
        }
    }
    
    
    
    
    
}
