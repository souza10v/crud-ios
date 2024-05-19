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
            VStack(alignment: .leading) {
                Text("User List")
                    .font(.largeTitle)
                    .padding(.top, 20)
                    .padding(.leading, 15)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(items) { item in
                            NavigationLink(destination: UserDetailsView(user: item)) {
                                UserItemView(item: item)
                                    .padding(.vertical, -10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListUserView(items: [UserModel(name: "John Doe", email: "john@example.com", status: true),
                         UserModel(name: "John Doe", email: "john@example.com", status: true),
                         UserModel(name: "John Doe", email: "john@example.com", status: true)])
}
