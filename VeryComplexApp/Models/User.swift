//
//  User.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
