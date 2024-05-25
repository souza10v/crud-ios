//
//  EditingUserViewModel.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/25/24.
//

import Foundation

class EditingUserViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    
    func updateUser(userID: String, userName: String, userEmail: String, userPosition: String, userStatus: Bool) {
        
        guard let url = URL(string: "http://localhost:3333/user?id=\(userID)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userData = [
            "userID": userID,
            "name": userName,
            "email": userEmail,
            "position": userPosition,
            "status": userStatus
        ] as [String : Any]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: userData) else {
            self.errorMessage = "Error: JSON serialization failed"
            return
        }
        
        urlRequest.httpBody = jsonData
        
        URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch users: \(error.localizedDescription)"
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: HTTP request failed"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: No data received"
                }
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let message = jsonResponse["message"] as? String {
                    DispatchQueue.main.async {
                        self.errorMessage = ""
                    }
                } else {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error: Invalid response"
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: \(error.localizedDescription)"
                }
            }
            
        }.resume()
    }
}
