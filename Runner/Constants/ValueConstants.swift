//
//  pch.swift
//  LLProgramFrameworkSwift
//
//  Created by 奥卡姆 on 2017/9/5.
//  Copyright © 2017年 aokamu. All rights reserved.
//

import UIKit

//屏幕宽
let SCREEN_WIDTH = UIScreen.main.bounds.width
//屏幕高
let SCREEN_HEIGHT = UIScreen.main.bounds.height
//1像素线
let ONEPX = (1.0/UIScreen.main.scale)
//状态栏
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height 
//导航栏高度
let kNavBarHeight :  CGFloat = 44.0
// X之前屏幕tabbar的高度
let KTabbarHeight_Before  : CGFloat =  49.0
// 屏幕tabbar的高度
let SCREEN_TABBAR_HEIGHT = CGFloat(kStatusBarHeight > 20 ? 83 : 49)
// 屏幕navigation的高度
let SCREEN_NAV_HEIGHT = CGFloat(kStatusBarHeight + kNavBarHeight)
// 屏幕tabbar的高度差
let BottomForHome  = CGFloat(SCREEN_TABBAR_HEIGHT-KTabbarHeight_Before)
//分页请求数量
let DATA_LIMIT: Int = 10


// 自定义打印方法
func printLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum)) \(message)")
        
    #endif
}






