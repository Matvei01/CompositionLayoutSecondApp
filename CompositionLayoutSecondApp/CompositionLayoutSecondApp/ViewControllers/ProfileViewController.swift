//
//  ProfileViewController.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

// MARK: - ProfileViewController
final class ProfileViewController: UIViewController {
    
    // MARK: - Public Properties
    var rows: [TableViewRow] = []
    
    // MARK: - UI Elements
    private lazy var profileImageView: UIImageView = {
        let imageView = ReuseImageView(radius: 100)
        imageView.image = UIImage(resource: .profile)
        return imageView
    }()
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        let row = rows[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.secondaryTextProperties.font = .systemFont(ofSize: 16, weight: .regular)
        
        switch indexPath.row {
        case 0:
            configureCellContent(
                content: &content,
                primaryText: row.primaryText,
                secondaryText: row.secondaryText,
                imageName: row.image,
                font: .systemFont(ofSize: 14, weight: .thin)
            )
        case 1:
            configureCellContent(
                content: &content,
                primaryText: row.primaryText,
                secondaryText: row.secondaryText,
                imageName: row.image,
                font: .systemFont(ofSize: 14, weight: .thin)
            )
        case 2:
            configureCellContent(
                content: &content,
                primaryText: row.primaryText,
                secondaryText: row.secondaryText,
                imageName: row.image,
                font: .systemFont(ofSize: 14, weight: .thin)
            )
        default:
            configureCellContent(
                content: &content,
                primaryText: row.primaryText,
                imageName: row.image,
                font: .systemFont(ofSize: 16, weight: .regular)
            )
        }
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    private func configureCellContent(content: inout UIListContentConfiguration,
                                      primaryText: String, secondaryText: String? = nil,
                                      imageName: String,
                                      font: UIFont) {
        content.text = primaryText
        content.secondaryText = secondaryText
        content.textProperties.font = font
        content.image = UIImage(systemName: imageName)
    }
}

// MARK: - Private methods
private extension ProfileViewController {
    func setupView() {
        view.backgroundColor = .white
        
        addSubviews()
        
        setConstraints()
    }
    
    func addSubviews() {
        setupSubviews(profileImageView, profileTableView)
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
}

// MARK: - Constraints
private extension ProfileViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            
            profileTableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
