//
//  User.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import Foundation

struct User {
    let name: String
    let image: String
    let message: String
    
    static func getUsers() -> [User] {
        [
            User(name: "Anna", image: "Anna", message: "Hey! What's up?"),
            User(name: "Artur", image: "Artur", message: "Hi! Are you going out?"),
            User(name: "Ivan", image: "Ivan", message: "Hey! What time's practice?"),
            User(name: "Ruslan", image: "Ruslan", message: "Hey! Going to the soccer game?"),
        ]
    }
}
