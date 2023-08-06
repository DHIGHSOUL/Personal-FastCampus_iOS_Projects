//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

class PaywallViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerInfos: [BannerInfo] = BannerInfo.list
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    

    enum Section {
        case main
    }
    typealias Item = BannerInfo
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = bannerInfos.count
        
//      Diffable Datasource(Presentation)
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            
            cell.configure(item)
            cell.backgroundColor = self.colors[indexPath.item]
            return cell
        })
        
//      Snapshot(Data)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos, toSection: .main)
        dataSource.apply(snapshot)
        
//      Composition Layout(Layout)
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
    }
    
    func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            self.pageControl.currentPage = Int(offset.x / 294.0)
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

//  TASK: 아래 애플 샘플 코드 다운받아서 돌려보기
//  https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
//  https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler
//  https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views

