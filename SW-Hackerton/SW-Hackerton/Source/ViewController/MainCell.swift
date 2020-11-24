//
//  MainCell.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var acceptanceBtn: UIButton!
    
    var roomData:MainModel! {
        didSet { setupView() }
    }
    
    private func setupView(){
        self.roomName.text = roomData.room
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
}
