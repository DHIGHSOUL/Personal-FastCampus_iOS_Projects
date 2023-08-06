//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by ROLF J. on 2023/04/02.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // cell dequeue 시 identifier에 맞는 셀을 꺼내올 때 처음 실행되는 함수(Initialization)
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // thumbnail의 cornerRadius(코너의 모서리 둥근값 결정) 변경
        thumbnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        // String -> Date -> String
        // "2022-04-01" -> Date(2022-04-01) -> "04/01"
        
        let dateFormatter = DateFormatter()
        // String -> Date
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Date -> String
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "MM/dd"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
