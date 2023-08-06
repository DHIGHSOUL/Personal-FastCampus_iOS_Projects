//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by ROLF J. on 2023/04/30.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        mainImageView.image = UIImage(named: imageName)
        nameLabel.text = "National Geographic"
        profileImageView.image = UIImage(systemName: "pawprint.circle.fill")
    }
}
