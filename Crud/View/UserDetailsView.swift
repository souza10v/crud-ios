//
//  UserDetails.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/18/24.
//

import SwiftUI

struct UserDetails: View {
    
    var user: UserModel
    
    var body: some View {
        Text(user.name)
    }
}

#Preview {
    
    let sampleData = UserModel(name: "John Doe", email: "john@example.com", status: true)
    
    UserDetails(user: sampleData)
}
