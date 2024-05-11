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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        let mainVC = MainViewController()
        mainVC.sections = sections
        
        let messageVC = MessageViewController()
        messageVC.users = users
        
        let navMessageVC = UINavigationController(rootViewController: messageVC)
        
        let profileVC = ProfileViewController()
        
        let navProfileVC = UINavigationController(rootViewController: profileVC)
        
        viewControllers = [
            generateVC(
                rootViewController: mainVC,
                title: "Main",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                rootViewController: navMessageVC,
                title: "Messages",
                image: UIImage(systemName: "message.fill")
            ),
            generateVC(
                rootViewController: navProfileVC,
                title: "Profile",
                image: UIImage(systemName: "person.fill")
            )
        ]
    }
    
    private func generateVC(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image
        return rootViewController
    }
}
