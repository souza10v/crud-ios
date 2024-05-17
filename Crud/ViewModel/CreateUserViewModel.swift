//
//  CreateUserViewModel.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import Foundation

class CreateUserViewModel: ObservableObject {
    
    static func createUser(userName: String, userEmail: String) {
        
        guard let url = URL(string: "http://localhost:3333/customer") else {
            print("Inalvid URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userData = [
            "name": userName,
            "email": userEmail
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: userData)
        
        if let jsonData = jsonData {
            print("JSON:", String(data: jsonData, encoding: .utf8) ?? "JSON serialization failed")
            urlRequest.httpBody = jsonData
        } else {
            print("Error: JSON serialization failed")
            return
        }
        
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error:", error)
                DispatchQueue.main.async {
                    // self.isShowingAlert = true
                    let alertMessage = "Registration failed: \(error.localizedDescription)"
                    print(alertMessage)
                }
                return
            }
            
            guard let data = data else {
                print("Error: No data received")
                DispatchQueue.main.async {
                    // self.isShowingAlert = true
                    // self.alertMessage = "Registration failed: No response from server"
                    let alertMessage = "Registration failed: No response from server"
                    print(alertMessage)
                }
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                print(jsonResponse)
                DispatchQueue.main.async {
                    // self.isShowingAlert = true
                    let alertMessage = "Registration successful!"
                    print(alertMessage)
                    // Handle successful registration (e.g., clear fields, navigate to another view)
                }
            } catch {
                print("Error:", error)
                DispatchQueue.main.async {
                    // self.isShowingAlert = true
                    let alertMessage = "Registration failed: Error parsing response"
                    print(alertMessage)
                }
            }
        }.resume()
        
    }
}

