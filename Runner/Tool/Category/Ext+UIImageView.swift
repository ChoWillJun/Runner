//
//  Ext+UIImageView.swift
//  SwiftPractice
//
//  Created by liushaohua on 15/10/25.
//  Copyright © 2015年 liushaohua. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView{

    /// 快速创建 imageView
    ///
    /// - parameter imgName:  图片名字
    ///
    /// - returns:
    convenience init(imgName: String) {
        self.init(image: UIImage(named:imgName))
    }
    
    
    ///
    /// - parameter withUrlString:      图片的 urlString
    /// - parameter placeholderImgName:  默认图片的名字
    func LX_setImage(withUrlString: String?, placeholderImgName: String?){
        // 获取图片的 url
        let url = URL(string: withUrlString ?? "")
        
        self.kf.setImage(with: url, placeholder: UIImage(named: placeholderImgName ?? ""), options: nil, progressBlock: nil, completionHandler: nil)
        
    }

    
    /// -----设置圆角图片
    /// - parameter withUrlString:      图片的 urlString
    /// - parameter placeholderImgName:  默认图片的名字
    func LX_setCornerImage(withUrlString: String?, placeholderImgName: String?){
        // 获取图片的 url
        let url = URL(string: withUrlString ?? "")
        
        let processor = RoundCornerImageProcessor(cornerRadius: (self.height)/2, targetSize: CGSize(width: (self.bounds.width),
                                                                                                           height: (self.bounds.height)), roundingCorners: .all)
        self.kf.setImage(with: url, placeholder: UIImage(named: placeholderImgName ?? ""), options: [.cacheSerializer(FormatIndicatedCacheSerializer.png), .processor(processor), .scaleFactor(UIScreen.main.scale), .backgroundDecode], progressBlock: nil, completionHandler: nil)
    }
    



}
