//
//  MyTableViewCell.swift
//  Runner
//
//  Created by ☁️WillJun_Cho on 17/01/2018.
//  Copyright © 2018 ☁️WillJun_Cho. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func addCellData(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            titleLabel.text = "历史记录"
        default:
            print("敬请期待...")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
