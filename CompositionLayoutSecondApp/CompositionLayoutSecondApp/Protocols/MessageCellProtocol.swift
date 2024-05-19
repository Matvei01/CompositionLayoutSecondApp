//
//  MessageCellProtocol.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 11.05.2024.
//

protocol MessageCellProtocol: AnyObject {
    static var reuseID: String { get }
    func configure(with user: User)
}
