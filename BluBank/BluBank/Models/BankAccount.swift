//
//  BankAccount.swift
//  BluBank
//
//  Created by Jason Sanchez on 4/21/25.
//

import Foundation

enum BankAccountError: Error {
    case invalidAmount
}

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
    
    func deposit(amount: Double, depositType: DepositType) throws {
        
        let transferFeePercentage = 0.02 // 2%
        if amount < 0 {
            throw BankAccountError.invalidAmount
        }
        switch depositType {
            case .cash, .check:
                self.balance += amount
            case .transfer:
                let fee = amount * transferFeePercentage
                self.balance += (amount - fee)
        }
    }
}
