//
//  BluBankTests.swift
//  BluBankTests
//
//  Created by Jason Sanchez on 4/21/25.
//

import Testing
@testable import BluBank

struct BankAccountTests {
    @Test(arguments: [DepositType.cash, DepositType.check])
    func deposit_amount_using_check_or_cash_increases_balance(_ depositType: DepositType) async throws {
        let bankAccount = BankAccount(accountNumber: "123456", balance: 500)
        bankAccount.deposit(amount: 200, depositType: depositType)
        
        #expect(bankAccount.balance == 700)
    }
}
