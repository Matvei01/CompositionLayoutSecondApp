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
            User(name: "Anna Sidorova", image: "Anna", message: "Hey! What's up?"),
            User(name: "Artur Bodrov", image: "Artur", message: "Hi! Are you going out?"),
            User(name: "Ivan Ivanov", image: "Ivan", message: "Hey! What time's practice?"),
            User(name: "Ruslan Bogatov", image: "Ruslan", message: "Hey! Going to the soccer game?"),
            User(name: "Petr Bogatov", image: "Petr", message: "Hey! Going to the soccer game?"),
            User(name: "Sergei Menshov", image: "Sergei", message: "Hey! Going to the soccer game?"),
            User(name: "Stepan Krasnov", image: "Stepan", message: "Hey! Going to the soccer game?"),
            User(name: "Denis Petrov", image: "Denis", message: "Hey! Going to the soccer game?"),
            User(name: "Andrey Andreev", image: "Andrey", message: "Hey! Going to the soccer game?"),
        ]
    }
}
