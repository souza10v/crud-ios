import Foundation

class DeletingUserViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    
    func deleteUser(userID: String, completion: @escaping () -> Void) {
                
        guard let url = URL(string: "http://localhost:3333/user?id=\(userID.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to delete user: \(error.localizedDescription)"
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: No HTTP response"
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: HTTP request failed with status code \(httpResponse.statusCode)"
                }
                return
            }
            
            if let data = data, let responseBody = String(data: data, encoding: .utf8) {
            }
            
            DispatchQueue.main.async {
                self.errorMessage = ""
                completion()  // Call the completion handler to notify about the successful deletion
            }
        }.resume()
    }
}
