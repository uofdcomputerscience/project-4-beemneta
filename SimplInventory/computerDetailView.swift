//
//  computerDetailView.swift
//  SimplInventory
//
//  Created by Beemnet Alemayehu on 12/17/19.
//  Copyright © 2019 Beemnet Alemayehu. All rights reserved.
//

import UIKit

class computerDetailView: UIViewController {    
    
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var ipAddress: UILabel!    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var netBiosName: UILabel!
    @IBOutlet weak var department: UILabel!
    
    var mod: String!
    var dp: String!
    var netBio: String!
    var unam: String!
    var sn: String!
    var bnd: String!
    var ipA: String!
    var docID:String!
    @IBOutlet weak var editedNet: UITextField!
    @IBOutlet weak var editedUser: UITextField!    
    @IBOutlet weak var editedDept: UITextField!
    @IBOutlet weak var editedSN: UITextField!
    @IBOutlet weak var editedModel: UITextField!
    @IBOutlet weak var editedBrand: UITextField!
    @IBOutlet weak var editedIP: UITextField!
    override func viewDidLoad() {
       userName.text = "\(unam!)"
       ipAddress.text = "\(ipA!)"
       netBiosName.text = "\(netBio!)"
       model.text = "\(mod!)"
       serialNumber.text = "\(sn!)"
       brand.text = "\(bnd!)"
       department.text = "\(dp!)"
    }
    
    @IBAction func goBack(_ sender: UIButton) {    LoginView.db.collection(LoginView.userID).document(docID!).setData(["UserName":unam!,"NetBiosName":netBio!,"Department":dp!,"IPAddress":ipA!,"SerialNumber":sn!,"Brand":bnd!,"Model":mod!,"isComputer":true,"documentID":docID!])
        toMainFeed()
    }
    
    @IBOutlet weak var doneEditingButton: UIButton!
    @IBAction func doneEditing(_ sender: UIButton) {
        editedIP.isHidden = true
        editedDept.isHidden = true
        editedUser.isHidden = true
        editedModel.isHidden = true
        editedSN.isHidden = true
        editedBrand.isHidden = true
        editedNet.isHidden = true
        doneEditingButton.isHidden = true
        model.isHidden = false
        department.isHidden = false
        userName.isHidden = false
        ipAddress.isHidden = false
        model.isHidden = false
        serialNumber.isHidden = false
        brand.isHidden = false
        
       let newIP = editedIP?.text ?? ""
       let newUser = editedUser?.text ?? ""
       let newNet = editedNet?.text ?? ""
       let newSN = editedSN?.text ?? ""
       let newBd = editedBrand?.text ?? ""
       let newMod = editedModel?.text ?? ""
       let newDp = editedDept?.text ?? ""
           
           self.bnd = replaceVal(value: newBd, replacing: bnd!)
           self.dp = replaceVal(value: newDp, replacing: dp!)
           self.ipA = replaceVal(value: newIP, replacing: ipA!)
           self.sn = replaceVal(value: newSN, replacing: sn!)
           self.netBio = replaceVal(value: newNet, replacing: netBio!)
           self.mod = replaceVal(value: newMod, replacing: mod!)
           self.unam = replaceVal(value: newUser, replacing: unam!)
        self.viewDidLoad()
        
    }
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func deleteButton(_ sender: UIButton) {
        LoginView.db.collection(LoginView.userID).document(self.docID).delete()
        toMainFeed()
    }
    @IBAction func editButton(_ sender: UIButton) {
        editedIP.isHidden = false
        editedDept.isHidden = false
        editedUser.isHidden = false
        editedModel.isHidden = false
        editedSN.isHidden = false
        editedBrand.isHidden = false
        editedNet.isHidden = false
        doneEditingButton.isHidden = false
        model.isHidden = true
        department.isHidden = true
        userName.isHidden = true
        ipAddress.isHidden = true
        model.isHidden = true
        serialNumber.isHidden = true
        brand.isHidden = true
    }
    func toMainFeed() {
        let vc = storyboard?.instantiateViewController(identifier: "mainFeed") as? mainFeed
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    func replaceVal (value:String!,replacing:String ) -> String! {
        if value != "" {
            return value
        }else {
            return replacing
        }
    }
    
}
