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
    @State private var message: String = "" // Combined error and alert message

    var body: some View {
        VStack {
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
    CreateUserView()
}
