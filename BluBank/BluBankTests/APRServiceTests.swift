//
//  APRServiceTests.swift
//  BluBankTests
//
//  Created by Jason Sanchez on 4/21/25.
//

import Testing
@testable import BluBank

struct APRServiceTests {
    @Test(arguments: [("123-45-6789", 1.0...3.0), ("888-65-4321", 6.0...10.0)])
    func apr_is_within_expected_range_for_valid_ssn(params: (String, ClosedRange<Double>)) async throws {
        let (ssn, expectedAPRRange) = params
        
        let aprService = APRService(creditScoreService: MockCreditScoreService())
        let apr = try await aprService.getAPR(ssn: ssn)
        
        #expect(expectedAPRRange.contains(apr))
    }
}
