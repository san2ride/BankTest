//
//  APRService.swift
//  BluBank
//
//  Created by Jason Sanchez on 4/21/25.
//

import Foundation

enum CreditScoreServiceError: LocalizedError {
    case noCreditScoreFound
    case unavailable
    
    // Provide localized error desccriptions
    var errorDescription: String? {
        switch self {
            case .noCreditScoreFound:
                return NSLocalizedString(
                    "No Credit score was found for the provided SSN.",
                    comment: "Error message when no credit is found.")
            case .unavailable:
                return NSLocalizedString(
                    "Credit score is unavailable or not applicable for the given SSN",
                    comment: "Credit score is unavailable or not applicable for the given SSN")
        }
    }
}

struct APRService {
    // 3rd Party Service
    let creditScoreService: CreditScoreServiceProtocol
    
    func getAPR(ssn: String) async throws -> Double {
        guard let creditScore = try await creditScoreService.getCreditScore(ssn: ssn) else {
            throw CreditScoreServiceError.noCreditScoreFound
        }
        if let score = creditScore.score {
            if score > 650 {
                return Double.random(in: 1...3)
            } else {
                return Double.random(in: 6...10)
            }
        } else {
            throw CreditScoreServiceError.unavailable
        }
    }
}
