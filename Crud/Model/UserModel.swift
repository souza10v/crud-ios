//
//  User.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import Foundation

struct UserModel: Identifiable, Decodable {
    var id: UUID? = UUID()
    var name: String
    var email: String
    var status: Bool
}
