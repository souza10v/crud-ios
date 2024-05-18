//
//  ListUser.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

struct ListUserView: View {
    var items: [UserModel]
    
    var body: some View {
        NavigationView {
            List(items) { item in
                NavigationLink(destination: UserDetailsView(user: item)) {
                    UserItemView(item: item)
                }
            }
            .navigationTitle("User List")
        }
    }
}

#Preview {
    let sampleData = [
        UserModel(name: "John Doe", email: "john@example.com", status: true),
        UserModel(name: "Jane Smith", email: "jane@example.com", status: true),
        UserModel(name: "Alice Johnson", email: "alice@example.com", status: false)
    ]
    
    ListUserView(items: sampleData)
}
