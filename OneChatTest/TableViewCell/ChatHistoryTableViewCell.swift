//
//  ChatHistoryTableViewCell.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

class ChatHistoryTableViewCell: UITableViewCell {

    static let identifier = "ChatHistoryTableViewCell"
    static let nib = UINib.init(nibName: ChatHistoryTableViewCell.identifier, bundle: nil)
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 25
    }
    
    func setData( data : ChatRoomModel?){
        guard let data = data else{return}
        titleLabel.text = data.name
        statusLabel.text = data.message == "" ? "-" : data.message
        profileImage.image = UIImage.init(named: "ic_person")
    }

 
    
}
