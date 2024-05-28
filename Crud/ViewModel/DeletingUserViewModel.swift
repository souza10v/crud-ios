//
//  DeletingUserViewModel.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/26/24.
//

import Foundation

class DeletingUserViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    
    func deleteUser(userID: String) {
        
        guard let url = URL(string: "http://localhost:3333/user") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userData = [
            "userID": userID,
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
