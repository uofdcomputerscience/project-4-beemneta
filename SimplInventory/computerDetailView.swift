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
    
    override func viewDidLoad() {
       userName.text = "\(unam!)"
       ipAddress.text = "\(ipA!)"
       netBiosName.text = "\(netBio!)"
       model.text = "\(mod!)"
       serialNumber.text = "\(sn!)"
       brand.text = "\(bnd!)"
       department.text = "\(dp!)"
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        toMainFeed()
    }
    
    func toMainFeed() {
        let vc = storyboard?.instantiateViewController(identifier: "mainFeed") as? mainFeed
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
}
