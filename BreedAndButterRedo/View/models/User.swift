//
//  User.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friends]
}

struct Friends: Identifiable, Codable {
    let id: String
    let name: String
}
