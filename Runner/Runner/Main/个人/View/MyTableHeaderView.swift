//
//  MyTableHeaderView.swift
//  Runner
//
//  Created by ☁️WillJun_Cho on 18/01/2018.
//  Copyright © 2018 ☁️WillJun_Cho. All rights reserved.
//

import UIKit

class MyTableHeaderView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!

//    var model:CustomerInfo! {
//        didSet {
//            if model.nickName == nil {
//                model.nickName = "到了么用户" + (model.mobile ?? "")
//            }
//
//            self.nameLable.text = model.nickName ?? "到了么用户"
//            self.phoneLabel.text = model.mobile ?? ""
//            self.headImageView.LX_setCornerImage(withUrlString: model.head ?? IMAGE_USER_HEADIMG, placeholderImgName: IMAGE_USER_HEADIMG)
//        }
//    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.headImageView.LX_setImage(withUrlString: "headImage", placeholderImgName: "headImage")
        
    }

}
