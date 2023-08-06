//
//  OnBoardingViewController.swift
//  NRCOnboarding
//
//  Created by ROLF J. on 2023/05/06.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardingCollectionView.dataSource = self
        onBoardingCollectionView.delegate = self
        
        if let layout = onBoardingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        pageControl.numberOfPages = messages.count
        pageControl.currentPage = 0
    }
}

extension OnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as? OnBoardingCell else {
            return UICollectionViewCell()
        }
        
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
    }
    
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.onBoardingCollectionView.bounds.width)
        pageControl.currentPage = index
    }
}
//
