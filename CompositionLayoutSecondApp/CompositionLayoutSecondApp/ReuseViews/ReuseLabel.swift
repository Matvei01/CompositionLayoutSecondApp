//
//  ReuseLabel.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

final class ReuseLabel: UILabel {
    
    init(font: UIFont, textColor: UIColor? = nil, alignment: NSTextAlignment? = nil, lines: Int? = nil) {
        super.init(frame: .zero)
        setupLabel(font: font, textColor: textColor ?? .black, alignment: alignment ?? .left, lines: lines ?? 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(font: UIFont, textColor: UIColor, alignment: NSTextAlignment, lines: Int) {
        self.font = font
        self.textColor = textColor
        textAlignment = alignment
        numberOfLines = lines
        translatesAutoresizingMaskIntoConstraints = false
    }
}
