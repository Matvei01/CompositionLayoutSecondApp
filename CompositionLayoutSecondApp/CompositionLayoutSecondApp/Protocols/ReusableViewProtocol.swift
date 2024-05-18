//
//  ReusableViewProtocol.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 18.05.2024.
//

protocol ReusableViewProtocol: AnyObject {
    static var reuseID: String { get }
    func setupHeader(header: String)
}
