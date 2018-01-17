//
//  HomeViewController.swift
//  Runner
//
//  Created by ☁️WillJun_Cho on 29/12/2017.
//  Copyright © 2017 ☁️WillJun_Cho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var isLocated: Bool = false
    
    @IBOutlet weak var mapView: MAMapView!
    var coordinateArray: [CLLocationCoordinate2D] = []
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        startLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addSegmentAction()
        
        AMapServices.shared().enableHTTPS = true
        initMapView()
        
        let locationManager = AMapLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = 3.0
        locationManager.startUpdatingLocation()
    }
    
    func addSegmentAction() {
        navigationItem.title = "Runner"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "nav_function_personal_default"), style: .plain, target: self, action: #selector(addRightButtonAction(_:)))
    }
    
    @objc func addRightButtonAction(_ sender:UIButton) {
//        pushVC(MyViewController())
//        self.cw_showDrawerViewController(MyViewController(), animationType: .default, configuration: nil)
    }
    
    func initMapView() {
        
        mapView.delegate = self
        mapView.zoomLevel = 15.5
        mapView.distanceFilter = 20
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow

        mapView.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        setUserLocationRepresentation()
        
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
        //调整定位蓝点的图标：
        r.image = UIImage(named: "icon_location_point")
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

extension HomeViewController: MAMapViewDelegate, AMapLocationManagerDelegate {
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        
        if !updatingLocation {
            return
        }
        if userLocation.location.horizontalAccuracy < 0 {
            return
        }
        // only the first locate used.
        if !self.isLocated {
            self.isLocated = true
            self.mapView.userTrackingMode = .follow
            self.mapView.centerCoordinate = userLocation.location.coordinate
//            self.actionSearchAround(coordinate:  userLocation.location.coordinate)
        }
        
//        UserLocationDefaul = mapView.userLocation
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!) {
        NSLog("location:{lat:\(location.coordinate.latitude); lon:\(location.coordinate.longitude); accuracy:\(location.horizontalAccuracy)};");
    }
    
}

