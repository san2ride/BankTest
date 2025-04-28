//
//  APRService.swift
//  BluBank
//
//  Created by Jason Sanchez on 4/21/25.
//

import Foundation

enum CreditScoreServiceError: LocalizedError {
    case noCreditScoreFound
    
    // Provide localized error desccriptions
    var errorDescription: String? {
        switch self {
            case .noCreditScoreFound:
                return NSLocalizedString(
                    "No Credit score was found for the provided SSN.",
                    comment: "Error message when no credit is found.")
        }
    }
}

struct APRService {
    // 3rd Party Service
    let creditScoreService: CreditScoreService
    
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
            throw CreditScoreServiceError.noCreditScoreFound
        }
    }
}
