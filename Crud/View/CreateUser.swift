//
//  CreateUser.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

struct CreateUser: View {
    
    @State var userName : String = ""
    @State var userEmail : String = ""
    @State var userFunction : String = ""
    @State var status: String = "Active"
    
    @State var errorMessage: String = ""
    
    var body: some View {
        
        VStack{
            Text("User Information")
                .padding(.bottom, 20.0)
                Section(header: Text("")) {
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $userEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                    TextField("Function", text: $userFunction)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }
                
                Section(header: Text("")) {
                    Picker("Status", selection: $status) {
                        Text("Active").tag("Active")
                        Text("Inactive").tag("Inactive")
                        Text("Pending").tag("Pending")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: status) { newValue in
                        print("Status changed to: \(newValue)")}
                }
            
                Text(errorMessage)
                .padding(.top, 20.0)
            
                Button(action: {
                    if validate() {
                        print("\(userName), \(userEmail), \(userFunction), \(status)")
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
        if userName.isEmpty {
            errorMessage =  "User is empty."
            return false
        }
        
        if userEmail.isEmpty {
            errorMessage = "Email is empty."
            return false
        }
        
        if userFunction.isEmpty {
            errorMessage = "Function is empty."
            return false
        }
        
        errorMessage = ""
        return true
    }
}

#Preview {
    CreateUser()
}
