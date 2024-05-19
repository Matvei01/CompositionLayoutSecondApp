//
//  MessageViewController.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

// MARK: - MessageViewController
final class MessageViewController: UIViewController {
    
    // MARK: - Public Properties
    var users: [User] = []
    
    // MARK: - UI Elements
    private lazy var messagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MessageViewCell.self, forCellReuseIdentifier: MessageViewCell.reuseID)
        tableView.dataSource = self
        tableView.layer.cornerRadius = 30
        tableView.rowHeight = 101
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - UITableViewDataSource
extension MessageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageViewCell.reuseID, for: indexPath)
        
        let user = users[indexPath.row]
        
        guard let cell = cell as? MessageViewCell else { return UITableViewCell()}
        cell.configure(with: user)
        cell.layer.cornerRadius = 30
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Private methods
private extension MessageViewController {
    func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(messagesTableView)
        
        setConstraints()
    }
}

// MARK: - Constraints
private extension MessageViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            messagesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            messagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            messagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            messagesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -227)
        ])
    }
}


