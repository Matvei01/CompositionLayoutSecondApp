//
//  EventViewCell.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

// MARK: - EventViewCell
final class EventViewCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "EventViewCell"
    
    // MARK: - UI Elements
    private lazy var eventImageView: UIImageView = {
        let imageView = ReuseImageView()
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 14, weight: .regular),
            textColor: .black,
            lines: 1
        )
        return label
    }()
    
    private lazy var transitionButton: UIButton = {
        let button = UIButton()
        button.setImage(.transition, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 10
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func configure(with item: CollectionItem) {
        eventImageView.image = UIImage(named: item.image)
        textLabel.text = item.text
    }
}

// MARK: - Private methods
private extension EventViewCell {
    func setupView() {
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        for subview in [eventImageView, textLabel, transitionButton] {
            addSubview(subview)
        }
        
    }
}

// MARK: - Constraints
private extension EventViewCell {
    func setConstraints() {
        setConstraintsForNewsImageView()
        setConstraintsForTextLabel()
        setConstraintsForTransitionButton()
    }
    
    func setConstraintsForNewsImageView() {
        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            eventImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            eventImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            eventImageView.widthAnchor.constraint(equalToConstant: 25),
            eventImageView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setConstraintsForTextLabel() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            textLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 10)
        ])
    }
    
    func setConstraintsForTransitionButton() {
        NSLayoutConstraint.activate([
            transitionButton.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            transitionButton.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 27),
            transitionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            transitionButton.widthAnchor.constraint(equalToConstant: 16),
            transitionButton.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
