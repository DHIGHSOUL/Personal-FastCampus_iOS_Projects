//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by ROLF J. on 2023/04/29.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImage.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImage.image = UIImage(named: imageName)
    }
}
