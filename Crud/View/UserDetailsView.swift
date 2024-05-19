//
//  UserDetails.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/18/24.
//

import SwiftUI

struct UserDetailsView: View {
    var user: UserModel
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.largeTitle)
            Text(user.email)
                .font(.title2)
            Text(user.status ? "Active" : "Inactive")
                .font(.title3)
                .foregroundColor(user.status ? .green : .red)
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
        
    }
}

#Preview {
    UserDetailsView(user: UserModel(id: "321312", name: "John Doe", email: "john@example.com", status: true))
}

