//
//  HomeViewController.swift
//  Runner
//
//  Created by ☁️WillJun_Cho on 29/12/2017.
//  Copyright © 2017 ☁️WillJun_Cho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AMapServices.shared().enableHTTPS = true
        
//        mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .follow
        
        self.setUserLocationRepresentation()
        
        self.view.addSubview(mapView)
    }
    
    //MARK: 自定义小蓝点
    func setUserLocationRepresentation() {
        //初始化 MAUserLocationRepresentation 对象：
        let r = MAUserLocationRepresentation()
        //精度圈是否显示
        r.showsAccuracyRing = false
        //是否显示蓝点方向指向
        r.showsHeadingIndicator = false
        //调整精度圈填充颜色
        r.locationDotBgColor = UIColor.clear
        //调整精度圈边线颜色
        r.locationDotFillColor = UIColor.clear
        //调整精度圈边线宽度
        r.lineWidth = 0
        //        //调整定位蓝点的图标：
        //        r.image = UIImage(named: "")
        //执行
        mapView?.update(r)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
