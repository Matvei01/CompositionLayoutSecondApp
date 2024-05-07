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
    var footer: String? = nil
    let items: [CollectionItem]
    
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
                text: "Рекордное путешествие началось вечером 20 марта 2024 года...",
                header: "Поезд на водороде попал в книгу Гиннеса",
                date: "6 мая 2024"
            ),
            CollectionItem(
                image: "airplane",
                text: "Первый китайский самолет “сделанный из отечественных деталей...",
                header: "Китайский самолет составит конкуренцию Airbus и Boeing",
                date: "9 мая 2024"
            ),
            CollectionItem(
                image: "bmw",
                text: "BMW Vision Neue Klasse X — это электрический внедорожник...",
                header: "В BMW показали новый электрический внедорожник",
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
            )
        ]
        
        let users = [
            CollectionItem(
                image: "Anna",
                text: "Hey! What's up?",
                name: "Anna"
            ),
            CollectionItem(
                image: "Artur",
                text: "Hi! Are you going out?",
                name: "Artur"
            ),
            CollectionItem(
                image: "Ivan",
                text: "Hey! What time's practice?",
                name: "Ivan"
            ),
            CollectionItem(
                image: "Ruslan",
                text: "Hey! Going to the soccer game?",
                name: "Ruslan"
            )
        ]
        
        let newsSection = CollectionSection(
            header: "Новости",
            footer: "Lorem ipsum dolor sit amet consectetur. Enim suspendisse accumsan sed augue interdum velit aliquam lobortis donec.",
            items: news
        )
        
        let eventsSection = CollectionSection(header: "События", items: events)
        
        let usersSection = CollectionSection(header: "Пользователи", items: users)
        
        return [newsSection, eventsSection, usersSection]
    }
}
