//
//  ReadingUserViewModel.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/19/24.
//

import Foundation

class ReadingUserViewModel: ObservableObject {
    
    @Published var users = [UserModel]()
    @Published var errorMessage: String = ""
    private var hasFetchedUsers = false
    
    func fetchUsers() {
        guard let url = URL(string: "http://localhost:3333/users") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch users: \(error.localizedDescription)"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            //View Json
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("Raw JSON response: \(jsonString)")
//            }
            
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                    self.errorMessage = ""
                    print("Data Worked")
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode users: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
