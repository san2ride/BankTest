//
//  APRServiceTests.swift
//  BluBankTests
//
//  Created by Jason Sanchez on 4/21/25.
//

import Testing
@testable import BluBank

struct APRServiceTests {
    @Test
    func apr_is_within_expected_range_for_valid_ssn() async throws {
        let ssn = "123-45-6789" // ssn with credit score > 650
        let expectedAPRRange = 1.0...3.0
        
        let aprService = APRService(creditScoreService: CreditScoreService())
        let apr = try await aprService.getAPR(ssn: ssn)
        
        #expect(expectedAPRRange.contains(apr))
    }
}
