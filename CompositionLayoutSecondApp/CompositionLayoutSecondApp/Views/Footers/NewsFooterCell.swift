//
//  NewsFooterCell.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 19.05.2024.
//

import UIKit

// MARK: - NewsFooterCell
final class NewsFooterCell: UICollectionReusableView, SupplementaryViewProtocol {
    static var reuseID: String = "NewsFooterCell"
    
    // MARK: - UI Elements
    private lazy var footerTitle: UILabel = {
        let label = ReuseLabel(font: .systemFont(ofSize: 12, weight: .light), lines: 0)
        return label
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func setup(with section: CollectionSection) {
        footerTitle.text = section.footer
    }
    
    // MARK: - Private methods
    private func setupView() {
        addSubview(footerTitle)
        
        setConstraints()
    }
}

// MARK: - Constraints
private extension NewsFooterCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            footerTitle.topAnchor.constraint(equalTo: topAnchor),
            footerTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            footerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            footerTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
