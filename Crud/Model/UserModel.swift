import Foundation

struct UserModel: Identifiable, Decodable {
    var id: String
    var name: String
    var email: String
    var position: String?
    var status: Bool
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case position
        case status
        case createdAt = "created_at"
        case updatedAt = "update_at"
    }
}
