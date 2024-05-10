//
//  ReuseButton.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

final class ReuseButton: UIButton {

    init(title: String, titleColor: UIColor, titleFont: UIFont) {
        super.init(frame: .zero)
        setupButton(title, titleColor, titleFont)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(_ title: String, _ titleColor: UIColor, _ titleFont: UIFont) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        translatesAutoresizingMaskIntoConstraints = false
    }
}
