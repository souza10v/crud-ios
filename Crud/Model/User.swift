//
//  User.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import Foundation

class User: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var email: String
    var status: Bool
}
