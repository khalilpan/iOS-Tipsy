//
//  BillBrain.swift
//  Tipsy
//
//  Created by khalil.panahi
//

import Foundation

struct BillBrain {
    var bill = Bill()
    var billValue:Float?
    
    mutating func updateTipAmount(selesctedButton: String) {
        switch selesctedButton {
        case "zeroPct":
            bill.tipAmount = 0.0
        case "tenPct":
            bill.tipAmount = 0.1
        case "twentyPct":
            bill.tipAmount = 0.2
        default:
            bill.tipAmount = 0.0
        }
    }

    mutating func updateSplitValue(value: Int) {
        bill.splitValue = value
    }
    
    func getSplitValue() -> Int {
        return bill.splitValue ?? 0
    }
    
    func getTipAmount() -> Float? {
        bill.tipAmount ?? nil
    }
    
    func getBillValue() -> Float? {
        return billValue ?? nil
    }
    
    mutating func calculateTheBill(receivedValue: String) -> Float? {
        if let value = Float(receivedValue){
            let totalValue = value + (value * bill.tipAmount!)
        
            
            if let splitV = bill.splitValue {
                billValue = totalValue
                / Float(splitV)
            }
        }
        
        if let billV = billValue {
            return billV
        }
        return nil
    }
}
