//
//  MainViewController.swift
//  CompositionLayoutSecondApp
//
//  Created by Matvei Khlestov on 07.05.2024.
//

import UIKit

// MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - Public Properties
    var sections: [CollectionSection] = []
    
    // MARK: - UI Elements
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCells()
        collectionView.registerSupplementaryViews()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.contentInset.top = 30
        return collectionView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainCollectionView)
    }
}

// MARK: - Private Methods
private extension MainViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            switch section {
            case 0: self?.createNewsSection()
            case 1: self?.createEventsSection()
            default: self?.createUsersSection()
            }
        }
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                               heightDimension: .estimated(165))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        return createSection(group: group, supplementaryItems: [self.createHeaderSize(), self.createFooterSize()])
    }
    
    private func createEventsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .estimated(51))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        return createSection(group: group, supplementaryItems: [self.createHeaderSize()])
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .estimated(173))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        return createSection(group: group, supplementaryItems: [self.createHeaderSize()])
    }
    
    private func createSection(group: NSCollectionLayoutGroup,
                               supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    
    private func createHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(24)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top,
            absoluteOffset: CGPoint(x: 0, y: -12)
        )
    }
    
    private func createFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(15)
            ),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom,
            absoluteOffset: CGPoint(x: 0, y: 11)
        )
    }
    
    func configureCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let item = sections[indexPath.section].items[indexPath.item]
        let cellReuseIdentifier: String
        
        switch indexPath.section {
        case 0: cellReuseIdentifier = NewsViewCell.reuseID
        case 1: cellReuseIdentifier = EventViewCell.reuseID
        default: cellReuseIdentifier = UserViewCell.reuseID
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        guard let cell = cell as? CellProtocol else { return UICollectionViewCell() }
        cell.configure(with: item)
        return cell as? UICollectionViewCell ?? UICollectionViewCell()
    }
    
    func configureSupplementaryViews(for collectionView: UICollectionView,
                                     kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let item = sections[indexPath.section]
        let cellReuseIdentifier: String
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0: cellReuseIdentifier = NewsHeaderCell.reuseID
            case 1: cellReuseIdentifier = EventsHeaderCell.reuseID
            default: cellReuseIdentifier = UsersHeaderCell.reuseID
            }
        case UICollectionView.elementKindSectionFooter:
            switch indexPath.section {
            default:
                cellReuseIdentifier = NewsFooterCell.reuseID
            }
            
        default:
            return UICollectionReusableView()
        }
        
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath
        )
        guard let supplementaryView = supplementaryView as? SupplementaryViewProtocol else { return UICollectionReusableView()}
        supplementaryView.setup(with: item)
        return supplementaryView as? UICollectionReusableView ?? UICollectionReusableView()
    }
}

// MARK: - UICollectionView Cell Registration
private extension UICollectionView {
    func registerCells() {
        register(NewsViewCell.self, forCellWithReuseIdentifier: NewsViewCell.reuseID)
        register(EventViewCell.self, forCellWithReuseIdentifier: EventViewCell.reuseID)
        register(UserViewCell.self, forCellWithReuseIdentifier: UserViewCell.reuseID)
    }
    
    func registerSupplementaryViews() {
        register(
            NewsHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NewsHeaderCell.reuseID
        )
        
        register(
            EventsHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: EventsHeaderCell.reuseID
        )
        
        register(
            UsersHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: UsersHeaderCell.reuseID
        )
        
        register(
            NewsFooterCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: NewsFooterCell.reuseID
        )
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        configureCell(for: collectionView, at: indexPath)
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        configureSupplementaryViews(for: collectionView, kind: kind, at: indexPath)
    }
}

