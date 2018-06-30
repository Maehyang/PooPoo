//
//  ViewController.swift
//  PooPoo
//
//  Created by Maehyang Lee on 2018. 6. 21..
//  Copyright © 2018년 MINE. All rights reserved.
//

import UIKit
import CoreLocation

class MapVC: UIViewController, MTMapViewDelegate, CLLocationManagerDelegate {
    lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    let locationManager = CLLocationManager()

    @IBOutlet var onOffImg: UIButton!
    
    
    // MARK: - Location Setting Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 위치 권한 설정
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.insertSubview(mapView, at: 0)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted {
            NSLog("위치권한 꺼짐")
            mapView.currentLocationTrackingMode = .off
            onOffImg.setImage(UIImage(named: "nav_arrow_gray"), for: .normal)
            let alert = UIAlertController(title: "위치 설정이 꺼짐", message: "위치 정보를 설정하려면 설정 > 일반 > 급똥 에서 위치 접근을 허용하십시오", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: false)
        } else if status == CLAuthorizationStatus.authorizedWhenInUse {
            NSLog("위치권한 켜져있음")
            mapView.currentLocationTrackingMode = .onWithoutHeading
        }
        

//        var items = [MTMapPOIItem]()
//        items.append(poiItem(name: "하나", latitude: 37.4981688, longitude: 127.0484572))
//        items.append(poiItem(name: "둘", latitude: 37.4987963, longitude: 127.0415946)))
//        mapView.addPOIItems(items)
//        mapView.fitAreaToShowAllPOIItems()
    }
    
    
    // MARK: - 지도 이동 감시
    func mapView(_ mapView: MTMapView!, centerPointMovedTo mapCenterPoint: MTMapPoint!) {
        print("지도가 이동함")
        mapView.currentLocationTrackingMode = .off
        onOffImg.setImage(UIImage(named: "nav_arrow_gray"), for: .normal)
        onOffImg.tag = 1
    }
    
    
    // MARK: - Map buttons
    
    @IBAction func onOffBtn(_ sender: UIButton) {
            if sender.tag == 1 { // 버튼 태그가 isOn 일 경우
                print("\(sender.tag)버튼이 눌렸습니다.")
                onOffImg.setImage(UIImage(named: "nav_arrow_blue"), for: .normal)
                mapView.currentLocationTrackingMode = .onWithoutHeading
                sender.tag = 2
            } else if sender.tag == 2 { // 버튼 태그가 isOnDirect 일 경우
                print("\(sender.tag)버튼이 눌렸습니다.")
                onOffImg.setImage(UIImage(named: "nav_arrow_direction"), for: .normal)
                mapView.currentLocationTrackingMode = .onWithHeading
                sender.tag = 0
            } else if sender.tag == 0 { // 버튼 태그가 isOff 일 경우
                print("\(sender.tag)버튼이 눌렸습니다.")
                onOffImg.setImage(UIImage(named: "nav_arrow_gray"), for: .normal)
                mapView.currentLocationTrackingMode = .off
                sender.tag = 1
            }
    }
    
    

}




