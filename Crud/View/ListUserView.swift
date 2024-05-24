//
//  ListUser.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

struct ListUserView: View {
    
    @EnvironmentObject var model: ReadingUserViewModel
    @State private var searchTerm = ""
    @State var isAddViewShowing = false
    
    var filteredUsers: [UserModel] {
        if searchTerm.isEmpty {
            return model.users
        } else {
            return model.users.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack{
                    Text("User List")
                        .font(.largeTitle)
                        .padding(.top, 20)
                        .padding(.leading, 15)
                    
                    Spacer()
                    
                    ZStack {
                        
                        Button(action: {
                            isAddViewShowing = true
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.blue)
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "plus")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        })
                    }
                    .padding(.trailing, 22.0)
                }
                .sheet(isPresented: $isAddViewShowing) {
                    CreateUserView(isPresented: $isAddViewShowing, shouldShowHStack: true)
                }
                
                
                HStack {
                    TextField("Search Users", text: $searchTerm)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if !searchTerm.isEmpty {
                                    Button(action: {
                                        self.searchTerm = ""
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                }
                .padding(.vertical, 10)
                
                
                
                if model.errorMessage.isEmpty {
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(filteredUsers) { item in
                                NavigationLink(destination: UserDetailsView(user: item)) {
                                    UserItemView(item: item)
                                        .padding(.vertical, -16)
                                }
                                Divider()
                                    .padding(.horizontal, 15.0)
                            }
                        }
                    }
                } else {
                    Text(model.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
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
