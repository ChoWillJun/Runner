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
    var coordinateArray: [CLLocationCoordinate2D] = []
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        startLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AMapServices.shared().enableHTTPS = true
        
        initMapView()
        
    }
    
    func initMapView() {
        
        mapView.delegate = self
        mapView.zoomLevel = 15.5
        mapView.distanceFilter = 3.0
        mapView.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        self.view.addSubview(mapView)
    }
    
    //MARK: 自定义小蓝点
    func setUserLocationRepresentation() {
        //初始化 MAUserLocationRepresentation 对象：
        let r = MAUserLocationRepresentation()
        //精度圈是否显示
        r.showsAccuracyRing = false
        //是否显示蓝点方向指向
        r.showsHeadingIndicator = true
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
    
    func startLocation() {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = MAUserTrackingMode.follow
        mapView.pausesLocationUpdatesAutomatically = false
        mapView.allowsBackgroundLocationUpdates = true
    }
    
    func updatePath () {
        
        // 每次获取到新的定位点重新绘制路径
        
        // 移除掉除之前的overlay
        let overlays = self.mapView.overlays
        self.mapView.removeOverlays(overlays)
        
        let polyline = MAPolyline(coordinates: &self.coordinateArray, count: UInt(self.coordinateArray.count))
        self.mapView.add(polyline)
        
        // 将最新的点定位到界面正中间显示
        let lastCoord = self.coordinateArray[self.coordinateArray.count - 1]
        self.mapView.setCenter(lastCoord, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: MAMapViewDelegate {
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        // 地图每次有位置更新时的回调
        
        if updatingLocation {
            // 获取新的定位数据
            let coordinate = userLocation.coordinate
            
            // 添加到保存定位点的数组
            self.coordinateArray.append(coordinate)
            
            updatePath()
        }
    }
    
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay.isKind(of: MAPolyline.self) {
            let polylineView = MAOverlayRenderer(overlay: overlay)
//            polylineView.lineWidth = 6
//            polylineView.strokeColor = UIColor(red: 4 / 255.0, green:  181 / 255.0, blue:  108 / 255.0, alpha: 1.0)

            return polylineView
        }
        
        return nil

    }
    
}
