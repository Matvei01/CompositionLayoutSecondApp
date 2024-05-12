//
//  TableViewRow.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 12.05.2024.
//

struct TableViewRow {
    let primaryText: String
    var secondaryText: String? = nil
    let image: String
    
    static func getRowItems() -> [TableViewRow] {
        [
            TableViewRow(
                primaryText: "Имя",
                secondaryText: "Петр Соколов",
                image: "person"
            ),
            TableViewRow(
                primaryText: "Телефон",
                secondaryText: "89089975344",
                image: "phone"
            ),
            TableViewRow(
                primaryText: "Email",
                secondaryText: "petrov.96@mail.ru",
                image: "tray"
            ),
            TableViewRow(
                primaryText: "Настройки",
                image: "gearshape"
            )
        ]
    }
}
