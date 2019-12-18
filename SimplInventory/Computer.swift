//
//  Computer.swift
//  SimplInventory
//
//  Created by Beemnet Alemayehu on 12/18/19.
//  Copyright © 2019 Beemnet Alemayehu. All rights reserved.
//

import Foundation

struct Computer {
    var user: String
    var netBiosName: String
    var serialNumber: String
    var deptName: String
    var ipAddress: String
    var deviceModel: String
    var brandName: String
    var docuID: String
    
    var dictionary:[String:Any] {
        return [
            "Brand":brandName,
            "Department":deptName,
            "IPAddress": ipAddress,
            "Model":deviceModel,
            "NetBiosName":netBiosName,
            "SerialNumber":serialNumber,
            "UserName":user,
            "isComputer":true,
            "documentID":docuID
        ]
    }
}
