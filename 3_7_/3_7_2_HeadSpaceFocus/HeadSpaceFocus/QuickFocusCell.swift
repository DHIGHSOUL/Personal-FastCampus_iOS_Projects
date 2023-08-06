//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by ROLF J. on 2023/08/03.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ quickFocus: QuickFocus) {
        imageView.image = UIImage(named: quickFocus.imageName)
        titleLabel.text = quickFocus.title
        descriptionLabel.text = quickFocus.description
    }
}
