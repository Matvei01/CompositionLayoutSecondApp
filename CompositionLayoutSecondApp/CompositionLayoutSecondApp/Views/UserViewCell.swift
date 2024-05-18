//
//  UserViewCell.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

// MARK: - UserViewCell
final class UserViewCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "UserViewCell"
    
    // MARK: - UI Elements
    private lazy var userImageView: UIImageView = {
        let imageView = ReuseImageView(radius: 25)
        return imageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 14, weight: .heavy),
            alignment: .center
        )
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 14, weight: .regular),
            textColor: .appGraySecond,
            alignment: .center
        )
        return label
    }()
    
    private lazy var writeButton: UIButton = {
        let button = ReuseButton(
            title: "Написать",
            titleColor: .appBlue,
            titleFont: .systemFont(ofSize: 14, weight: .regular)
        )
        return button
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 20
        
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func configure(with item: CollectionItem) {
        userImageView.image = UIImage(named: item.image)
        headerLabel.text = item.name
        textLabel.text = item.text
    }
}

// MARK: - Private methods
private extension UserViewCell {
    func setupView() {
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        for subview in [userImageView , headerLabel, textLabel, writeButton] {
            addSubview(subview)
        }
    }
}

// MARK: - Constraints
private extension UserViewCell {
    func setConstraints() {
        setConstraintsForUserImageView()
        setConstraintsForHeaderLabel()
        setConstraintsForTextLabel()
        setConstraintsForWriteButton()
    }
    
    func setConstraintsForUserImageView() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
    }
    
    func setConstraintsForHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 4),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func setConstraintsForTextLabel() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 6),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14)
        ])
    }
    
    func setConstraintsForWriteButton() {
        NSLayoutConstraint.activate([
            writeButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 11),
            writeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            writeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            writeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17)
        ])
    }
}
