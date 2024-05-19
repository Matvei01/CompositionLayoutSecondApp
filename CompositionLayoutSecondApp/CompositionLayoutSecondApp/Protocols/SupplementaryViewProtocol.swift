//
//  SupplementaryViewProtocol.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 18.05.2024.
//

protocol SupplementaryViewProtocol: AnyObject {
    static var reuseID: String { get }
    func setup(with section: CollectionSection)
}
