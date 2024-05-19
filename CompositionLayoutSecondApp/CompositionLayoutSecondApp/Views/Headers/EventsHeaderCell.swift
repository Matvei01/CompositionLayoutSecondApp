//
//  EventsHeaderCell.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 18.05.2024.
//

import UIKit

final class EventsHeaderCell: UICollectionReusableView, SupplementaryViewProtocol {
    static var reuseID: String = "EventsHeaderCell"
    
    // MARK: - UI Elements
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerTitle, headerButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerTitle: UILabel = {
        let label = ReuseLabel(font: .systemFont(ofSize: 20, weight: .black))
        return label
    }()
    
    private lazy var headerButton: UIButton = {
        let button = ReuseButton(
            title: "Подробнее",
            titleColor: .appBlue,
            titleFont: .systemFont(ofSize: 14, weight: .regular))
        return button
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
        headerTitle.text = section.header
    }
    
    // MARK: - Private methods
    private func setupView() {
        addSubview(headerStackView)
        
        setConstraints()
    }
}

// MARK: - Constraints
private extension EventsHeaderCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
