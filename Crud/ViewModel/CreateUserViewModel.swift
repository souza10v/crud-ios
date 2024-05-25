import Foundation

class CreateUserViewModel: ObservableObject {
    
    static func createUser(userName: String, userEmail: String, userPosition: String, completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "http://localhost:3333/user") else {
            completion("Invalid URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") //define to tipo
        
        let userData = [
            "name": userName,
            "email": userEmail,
            "position": userPosition
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: userData) else {
            completion("Error: JSON serialization failed")
            return
        }
        
        urlRequest.httpBody = jsonData
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion("Registration failed: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion("Error: HTTP request failed")
                return
            }
            
            guard let data = data else {
                completion("Error: No data received")
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let message = jsonResponse["message"] as? String {
                    completion(message)
                } else {
                    completion("Error: Invalid response")
                }
            } catch {
                completion("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
