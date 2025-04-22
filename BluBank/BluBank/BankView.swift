//
//  BankView.swift
//  BluBank
//
//  Created by Jason Sanchez on 4/21/25.
//

import SwiftUI

struct BankView: View {
    @State private var ssn: String = ""
    @State private var apr: Double?
    @State private var message: String?
    
    private var isFormValid: Bool {
        ssn.isSSN && !ssn.isEmptyOrWhiteSpace
    }
    var body: some View {
        Form {
            TextField("Enter ssn", text: $ssn)
                .accessibilityIdentifier("ssnTextField")
            Button("Calculate APR") {
                // call aprService.getAPR
            }
            .accessibilityIdentifier("calculateAPRButton")
            .disabled(!isFormValid)
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .center)
            
            if let apr {
                Text("\(apr)")
                    .accessibilityIdentifier("aprText")
            }
            if let message {
                Text("\(message)")
                    .accessibilityIdentifier("messageText")
            }
        }
    }
}

#Preview {
    NavigationStack {
        BankView()
    }
}
