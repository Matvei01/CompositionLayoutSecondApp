//
//  CellProtocol.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

protocol CellProtocol: AnyObject {
    static var reuseID: String { get }
    func configure(with item: CollectionItem)
}
