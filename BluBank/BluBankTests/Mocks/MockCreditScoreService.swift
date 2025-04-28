//
//  MockCreditScoreService.swift
//  BluBankTests
//
//  Created by Jason Sanchez on 4/28/25.
//

import Foundation
@testable import BluBank

struct MockCreditScoreService: CreditScoreServiceProtocol {
    func getCreditScore(ssn: String) async throws -> CreditScore? {
        switch ssn {
            case "123-45-6789": // Good Credit Score
                return CreditScore(score: 720, lastUpdated: "02/15/2025", reportedBy: "Experian")
            case "888-65-4321": // Bad Credit Score
                return CreditScore(score: 550, lastUpdated: "01/10/2025", reportedBy: "Equifax")
            default: // No Credit Score
                return nil
        }
    }
}
