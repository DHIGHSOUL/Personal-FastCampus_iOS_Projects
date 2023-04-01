//
//  ZooListCollectionViewCell.swift
//  ZooList
//
//  Created by ROLF J. on 2023/04/02.
//

import UIKit

class ZooListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var getInDate: UILabel!
    
    func configure(_ animal: Animal) {
        animalImage.image = UIImage(named: animal.name)
        animalName.text = animal.name
        getInDate.text = formattedDateString(dateString: animal.inDate)
        
    }
    
    func formattedDateString(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "MM/dd"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
