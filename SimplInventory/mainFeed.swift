//
//  mainFeed.swift
//  SimplInventory
//
//  Created by Beemnet Alemayehu on 12/17/19.
//  Copyright © 2019 Beemnet Alemayehu. All rights reserved.
//

import UIKit
import Firebase

class mainFeed: UIViewController{
    
    var computerArray = [Computer]()
    
    @IBOutlet weak var accountUser: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var signOut: UIButton!
    @IBOutlet weak var newButton: UIButton!    
    @IBOutlet weak var computerTable: UITableView!

    @IBAction func reloadButton(_ sender: UIButton) {
        computerArray.removeAll()
        loadData()
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        toLoginView()
    }
    
    @IBAction func newButton(_ sender: UIButton) {
            let vc = storyboard?.instantiateViewController(identifier: "newComputer") as? newComputer
            view.window?.rootViewController = vc
            view.window?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        computerTable.dataSource = self
        loadData()
    }
    
    
    func toLoginView() {
        let vc = storyboard?.instantiateViewController(identifier: "LoginView") as? LoginView
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    func loadData() {
        guard let identi = LoginView.userID, !identi.isEmpty else {return}
        LoginView.db.collection(identi).whereField("isComputer", isEqualTo: true).getDocuments { (snapshot, error) in
            if let error = error {
                print (error.localizedDescription)
            } else {
                print (snapshot!.documents)
                   for document in snapshot!.documents {                    
                    print ("even inside is working")
                    let dar = document.data()
                       let na1 = dar["Department"] as? String ?? ""
                       let na2 = dar["UserName"] as? String ?? ""
                       let na3 = dar["Brand"] as? String ?? ""
                       let na4 = dar["IPAddress"] as? String ?? ""
                       let na5 = dar["SerialNumber"] as? String ?? ""
                       let na6 = dar["Model"] as? String ?? ""
                       let na7 = dar["NetBiosName"] as? String ?? ""
                    let comp = Computer(user: na2, netBiosName: na7, serialNumber: na5, deptName: na1, ipAddress: na4, deviceModel: na6, brandName: na3)
                        self.computerArray.append(comp)
                        DispatchQueue.main.async {
                            self.computerTable.reloadData()
                        }
                   }
               }
           }
    }
    
    
   
}

extension mainFeed: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comp = computerArray[indexPath.row]
        let br = comp.brandName
        let cUser = comp.user
        let sn=comp.serialNumber
        let netBios=comp.netBiosName
        let cell = tableView.dequeueReusableCell(withIdentifier: "computerCell")!
        if let compCell = cell as?
           computerCell{
            compCell.computerName.text = netBios
            compCell.serialNumber.text = sn
            compCell.brand.text = br
            compCell.computerUser.text = cUser
       }
               return cell
    }
}

extension mainFeed: UITableViewDelegate {
    
}