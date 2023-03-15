//
//  BillBrain.swift
//  Tipsy
//
//  Created by Md. Mahinur Rahman on 3/14/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain{
    let bill:Float
    let tip:Int
//    var totalBill:Float
    let numberOfPersons:Int
//    var billPerPerson:Float
    
    func calculateTotalBill()->Float{
        let totalBill = bill+(bill*(Float(tip)/100.00))
        return totalBill
    }
    
    func calculateBillPerPerson()->Float{
        let billPerPerson = calculateTotalBill()/Float(numberOfPersons)
        return billPerPerson
    }
    
    func getTip()->Int{
        return tip
    }
    
    func getNumberOfPersons()->Int{
        return numberOfPersons
    }
}
