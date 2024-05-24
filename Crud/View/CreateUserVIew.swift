//
//  CreateUser.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

struct CreateUserView: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var userPosition: String = ""
    @State private var status: String = "Active"
    @State private var message: String = ""
    
    @Binding var isPresented: Bool
    @State var shouldShowHStack: Bool

    var body: some View {
        VStack {
            
            if shouldShowHStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.blue)
                                .frame(width: 30, height: 30)
                            
                            Image(systemName: "xmark")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
            }
            
            Text("User Information")
                .padding(.bottom, 20.0)

            Section(header: Text("")) {
                TextField("Username", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $userEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                TextField("Function", text: $userPosition)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
            }

            Text(message)
                .foregroundColor(message.contains("failed") ? .red : .blue)
                .padding(.top, 10.0)

            Button(action: {
                if validate() {
                    createUser()
                    
                    message = "User \(userName) created."
                    
                    userName = ""
                    userEmail = ""
                    userPosition = ""
                }
            }, label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .controlSize(.large)
            .frame(width: 100, height: 50)
            .padding(.top, 20.0)
        }
        .padding(30)
        
        Spacer()
    }

    func validate() -> Bool {
        if userName.isEmpty || userEmail.isEmpty || userPosition.isEmpty {
            message = "Please fill in all fields."
            return false
        } else {
            message = ""
            return true
        }
    }

    func createUser() {
        CreateUserViewModel.createUser(userName: userName, userEmail: userEmail, userPosition: userPosition) { response in
            DispatchQueue.main.async {
                self.message = response
            }
        }
    }
}

#Preview {
    CreateUserView(isPresented: .constant(true), shouldShowHStack: true)
}
