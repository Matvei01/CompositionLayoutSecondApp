//
//  NewsViewCell.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

// MARK: - NewsViewCell
final class NewsViewCell: UICollectionViewCell, CellProtocol {
    static var reuseID: String = "NewsViewCell"
    
    // MARK: - UI Elements
    private lazy var newsImageView: UIImageView = {
        let imageView = ReuseImageView()
        return imageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 20, weight: .black),
            textColor: .white
        )
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 12, weight: .light),
            textColor: .appGray
        )
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = ReuseLabel(
            font: .systemFont(ofSize: 14, weight: .light),
            textColor: .white,
            lines: 1
        )
        return label
    }()
    
    private lazy var readButton: UIButton = {
        let button = ReuseButton(
            title: "Читать",
            titleColor: .white,
            titleFont: .systemFont(ofSize: 14, weight: .light)
        )
        return button
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        newsImageView.image = UIImage(named: item.image)
        headerLabel.text = item.header
        dateLabel.text = item.date
        textLabel.text = item.text
    }
}

// MARK: - Private methods
private extension NewsViewCell {
    func setupView() {
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        addSubview(newsImageView)
        
        for subview in [headerLabel, dateLabel, textLabel, readButton] {
            newsImageView.addSubview(subview)
        }
    }
}

// MARK: - Constraints
private extension NewsViewCell {
    func setConstraints() {
        setConstraintsForNewsImageView()
        setConstraintsForHeaderLabel()
        setConstraintsForDateLabel()
        setConstraintsForTextLabel()
        setConstraintsForReadButton()
    }
    
    func setConstraintsForNewsImageView() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setConstraintsForHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 23),
            headerLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 25),
            headerLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -25)
        ])
    }
    
    func setConstraintsForDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0),
            dateLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor)
        ])
    }
    
    func setConstraintsForTextLabel() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 9),
            textLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -15),
        ])
    }
    
    func setConstraintsForReadButton() {
        NSLayoutConstraint.activate([
            readButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 37),
            readButton.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -22),
            readButton.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            readButton.widthAnchor.constraint(equalToConstant: 46)
        ])
    }
}
