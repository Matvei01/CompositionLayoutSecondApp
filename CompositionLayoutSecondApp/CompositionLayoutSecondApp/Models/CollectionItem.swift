//
//  CollectionItem.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import Foundation

struct CollectionItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    let text: String
    var name: String? = nil
    var header: String? = nil
    var date: String? = nil
}
