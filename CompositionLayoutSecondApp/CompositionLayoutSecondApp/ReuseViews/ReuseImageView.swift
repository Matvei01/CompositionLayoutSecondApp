//
//  ReuseImageView.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

final class ReuseImageView: UIImageView {
    
    init(radius: CGFloat? = nil) {
        super.init(frame: .zero)
        setupImageView(with: radius ?? 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView(with radius: CGFloat) {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = radius
        translatesAutoresizingMaskIntoConstraints = false
    }
}
