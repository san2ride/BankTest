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
        self.balance += amount
    }
}
