//
//  ListUser.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

struct ListUserView: View {
    
    @EnvironmentObject var model: ReadingUserViewModel
    
    // Trabalhar para que atualizacao ocorra somente quando puxar a tela de baixo para cima e nao sempre que a tela é aberta
    
    var body: some View {

            VStack(alignment: .leading) {
                Text("User List")
                    .font(.largeTitle)
                    .padding(.top, 20)
                    .padding(.leading, 15)
                
                if model.errorMessage.isEmpty {
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(model.users) { item in
                                NavigationLink(destination: UserDetailsView(user: item)) {
                                    UserItemView(item: item)
                                        .padding(.vertical, -10)
                                }
                            }
                        }
                    }
                } else {
                    Text(model.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                model.fetchUsers()
            }
        }
}

#Preview {
    ListUserView()
        .environmentObject(ReadingUserViewModel())
}
