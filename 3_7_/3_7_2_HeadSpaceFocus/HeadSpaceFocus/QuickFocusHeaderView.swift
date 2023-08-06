//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by ROLF J. on 2023/08/03.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
