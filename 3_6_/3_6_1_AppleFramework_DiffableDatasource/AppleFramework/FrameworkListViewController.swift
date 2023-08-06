//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    enum Section {
        case main
    }
    
    typealias Item = AppleFramework
    
//  SectionIdentifierType, ItemIdentifierType -> Hashable
//  Hashable -> Hashing을 가능하게 해주는 Protocol
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
//    Data, Presentation, Layout ->
//    DiffableDataSource(Presentation(Snapshot), Data), CompositionalLayout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.dataSource = self
        collectionView.delegate = self
        
//      파란색으로 Parameter를 보여줄 때 엔터를 클릭하면 자동으로 Closure를 생성해줌
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
//          itme -> list[indexPath.item]
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            
            cell.configure(item)
            
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
//        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowlayout.estimatedItemSize = .zero
//        }
        
//        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//extension FrameworkListViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
//            return UICollectionViewCell()
//        }
//        let framework = list[indexPath.item]
//        cell.configure(framework)
//        return cell
//    }
//}
//
//extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        // 3열일때 계산
//        let interItemSpacing: CGFloat = 10
//        let padding: CGFloat = 16
//
//        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
//
//
////        // 2열일때 계산
////        let interItemSpacing: CGFloat = 10
////        let padding: CGFloat = 16
////
////        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2) / 2
////        let height = width * 1.5
////        return CGSize(width: width, height: height)
////
////        // 4열일때 계산
////        let interItemSpacing: CGFloat = 10
////        let padding: CGFloat = 16
////
////        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 4
////        let height = width * 1.5
////        return CGSize(width: width, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
