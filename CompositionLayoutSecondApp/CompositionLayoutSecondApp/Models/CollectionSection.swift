//
//  CollectionSection.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import Foundation

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let header: String
    let items: [CollectionItem]
    var footer: String? = nil
    
    static func getSections() -> [CollectionSection] {
        
        let news = [
            CollectionItem(
                image: "сoca-сola",
                text: "Coca-Cola делает ставку на то, что искусственный интеллект...",
                header: "Coca-Cola активно внедряет ИИ",
                date: "7 мая 2024"
            ),
            CollectionItem(
                image: "train",
                text: "Рекордное путешествие началось вечером...",
                header: "Поезд на водороде попал в книгу Гиннеса",
                date: "6 мая 2024"
            ),
            CollectionItem(
                image: "hindu",
                text: "Индия, со времен обретения независимости...",
                header: "Индия смогла снизить уровень бедности",
                date: "9 мая 2024"
            ),
            CollectionItem(
                image: "bmw",
                text: "BMW Vision Neue Klasse X — это электрический внедорожник...",
                header: "В BMW показали новый внедорожник",
                date: "10 мая 2024"
            )
        ]
        
        let events = [
            CollectionItem(
                image: "party",
                text: "Арт-вечеринки в студии ArtSpace — это возможность интересно провести время"),
            CollectionItem(
                image: "comic",
                text: "Свежие шутки от опытных комиков и восходящих звёзд стендапа — на бесплатных концертах от Stand Up Afisha."
            ),
            CollectionItem(
                image: "steak",
                text: "Чтобы научиться готовить идеальные стейки дома, приходите на мастер-класс в студию EventyOn. Здесь можно..."
            ),
            CollectionItem(
                image: "paint",
                text: "Креативное пространство «Люмьер-Холл» приглашает полюбоваться невероятными картинами поэта моря Ивана..."
            ),
            CollectionItem(
                image: "sculpture",
                text: "Если вы ищете необычное хобби или просто хотите расслабиться в творческой атмосфере, занятие в студии..."
            ),
            CollectionItem(
                image: "dinner",
                text: "Компания Fastlife приглашает на групповые свидания в необычном формате. Миссия проекта — помочь одиноким..."
            )
        ]
        
        let users = [
            CollectionItem(
                image: "Anna",
                text: "Hey! What's up?",
                name: "Anna Sidorova"
            ),
            CollectionItem(
                image: "Artur",
                text: "Hi! Are you going out?",
                name: "Artur Bodrov"
            ),
            CollectionItem(
                image: "Ivan",
                text: "Hey! What time's practice?",
                name: "Ivan Ivanov"
            ),
            CollectionItem(
                image: "Ruslan",
                text: "Hey! Going to the soccer game?",
                name: "Ruslan Bogatov"
            )
        ]
        
        let newsSection = CollectionSection(header: "Новости", items: news, footer: "Главные новости недели")
        
        let eventsSection = CollectionSection(header: "События", items: events)
        
        let usersSection = CollectionSection(header: "Пользователи", items: users)
        return [newsSection, eventsSection, usersSection]
    }
}
