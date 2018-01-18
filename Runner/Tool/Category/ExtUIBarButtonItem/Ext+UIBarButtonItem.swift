//
//  Ext+UIBarButtonItem.swift
//  SwiftPractice
//
//  Created by liushaohua on 15/10/22.
//  Copyright © 2015年 liushaohua. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience init(setHighlightedImg:String? ,title:String? ,target:Any?,action:Selector) {
        self.init()
        let  button = UIButton(setHighlightImage:setHighlightedImg, title: title, target: target, action: action)
        
        if setHighlightedImg == "icon-back-back" {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0); // 这里微调返回键的位置可以让它看上去和左边紧贴
        }
        
        self.customView = button        
        
    }

    convenience init(title: String?,
                     titleColor: UIColor = .blue,
                     titleFont: UIFont = UIFont.systemFont(ofSize: 16),
                     titleEdgeInsets: UIEdgeInsets = .zero,
                     target: Any?,
                     action: Selector?) {
        
        let button = UIButton(type: .system)
        button.setTitle((title! + "    "), for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.titleEdgeInsets = titleEdgeInsets
        if action != nil {
            button.addTarget(target, action: action!, for: .touchUpInside)
        }
        button.sizeToFit()
        if button.bounds.width < 40 || button.bounds.height > 40 {
            let width = 40 / button.bounds.height * button.bounds.width;
            button.bounds = CGRect(x: 0, y: 0, width: width, height: 40)
        }
        self.init(customView: button)
    }
    
    convenience init(imageName: String?,
                     selectImage: UIImage? = nil,
                     imageEdgeInsets: UIEdgeInsets = .zero,
                     target: Any?,
                     action: Selector?) {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage.init(named: imageName ?? "")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setImage(selectImage?.withRenderingMode(.alwaysOriginal), for: .selected)
        button.imageEdgeInsets = imageEdgeInsets
        if action != nil {
            button.addTarget(target, action: action!, for: .touchUpInside)
        }
        button.sizeToFit()
        if button.bounds.width < 40 || button.bounds.height > 40 {
            let width = 40 / button.bounds.height * button.bounds.width;
            button.bounds = CGRect(x: 0, y: 0, width: width, height: 40)
        }
        
        self.init(customView: button)
    }


}


