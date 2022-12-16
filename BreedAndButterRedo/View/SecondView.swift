//
//  SecondView.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//

import SwiftUI

struct SecondView: View {
    var users: CachedUser
        var body: some View {
            Form {
                Section("About"){
                    Text(users.wrappedAbout)
                }
                Section("Address"){
                    Text(users.wrappedAddress)
                }
                Section("Company name"){
                    Text(users.wrappedCompany)
                }
            }
            .navigationTitle(users.wrappedName)
            .navigationBarTitleDisplayMode(.inline)
        }
    
}

