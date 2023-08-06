//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by ROLF J. on 2023/04/29.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var frameworkCollectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frameworkCollectionView.dataSource = self
        frameworkCollectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        frameworkCollectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        if let flowLayout = frameworkCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
    }
}

extension FrameworkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        
        return cell
    }
    
    
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
