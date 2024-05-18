//
//  TabBarController.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    var sections = CollectionSection.getSections()
    
    var users = User.getUsers()
    
    var rows = TableViewRow.getRowItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        let mainVC = MainViewController()
        mainVC.sections = sections
        
        let messageVC = MessageViewController()
        messageVC.users = users
        
        let profileVC = ProfileViewController()
        profileVC.rows = rows
        
        viewControllers = [
            generateVC(
                rootViewController: mainVC,
                title: "Main",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                rootViewController: messageVC,
                title: "Messages",
                image: UIImage(systemName: "message.fill")
            ),
            generateVC(
                rootViewController: profileVC,
                title: "Profile",
                image: UIImage(systemName: "person.fill")
            )
        ]
    }
    
    private func generateVC(rootViewController: UIViewController,
                            title: String, image: UIImage?) -> UIViewController {
        
        rootViewController.navigationItem.title = title
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}
