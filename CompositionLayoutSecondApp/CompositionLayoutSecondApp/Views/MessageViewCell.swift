//
//  MessageViewCell.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 11.05.2024.
//

import UIKit

// MARK: - MessageViewCell
final class MessageViewCell: UITableViewCell, TableViewCellProtocol {
    static var reuseID: String = "MessageViewCell"
    
    // MARK: - UI Elements
    private lazy var userImageView: UIImageView = {
        let imageView = ReuseImageView(radius: 28)
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 16, weight: .light)
        )
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 12, weight: .light)
        )
        return label
    }()
    
    private lazy var messageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            fullNameLabel, messageLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Override Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func configure(with user: User) {
        userImageView.image = UIImage(named: user.image)
        fullNameLabel.text = user.name
        messageLabel.text = user.message
    }
}

// MARK: - Private methods
private extension MessageViewCell {
    func setupView() {
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        setupSubviews(
            userImageView,
            messageStackView
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}

// MARK: - Constraints
private extension MessageViewCell {
    func setConstraints() {
        setConstraintsForUserImageView()
        setConstraintsForMessageStackView()
    }
    
    func setConstraintsForUserImageView() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 29),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            userImageView.widthAnchor.constraint(equalToConstant: 56),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
    }
    
    func setConstraintsForMessageStackView() {
        NSLayoutConstraint.activate([
            messageStackView.topAnchor.constraint(equalTo: topAnchor, constant: 38),
            messageStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 9),
            messageStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            messageStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
    }
}
