//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by ROLF J. on 2023/05/10.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var focusList: [Focus] = Focus.list
    @IBOutlet weak var refreshButton: UIButton!
    
    var curated: Bool = false
    
    enum Section {
        case main
    }
    typealias Item = Focus
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//      DiffableDataSource
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
//      Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        dataSource.apply(snapshot)
        
//      CompositionLayout
        collectionView.collectionViewLayout = layout()
        
//      Refresh Button
        refreshButton.layer.cornerRadius = 10
        buttonUpdate()
    }
    
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func buttonUpdate() {
        let title = curated ? "See All" : "See Recommandation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle()
        self.focusList = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        dataSource.apply(snapshot)
        
        buttonUpdate()
    }
}
