//
//  OnBoardingCell.swift
//  NRCOnboarding
//
//  Created by ROLF J. on 2023/05/06.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
}
