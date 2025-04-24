//
//  BankAccount.swift
//  BluBank
//
//  Created by Jason Sanchez on 4/21/25.
//

import Foundation

enum DepositType {
    case check
    case cash
    case transfer
}

class BankAccount {
    var accountNumber: String
    private(set) var balance: Double
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(amount: Double, depositType: DepositType) {
        
        let transferFeePercentage = 0.02 // 2%
        switch depositType {
            case .cash, .check:
                self.balance += amount
            case .transfer:
                let fee = amount * transferFeePercentage
                self.balance += (amount - fee)
        }
    }
}
