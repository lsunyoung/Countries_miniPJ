//
//  PopularityViewController.swift
//  Countries_miniPJ
//
//  Created by 이선영 on 2023/01/28.
//

import UIKit
import MapKit
import CoreLocation

class PopularityViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager = CLLocationManager() // location manager
    var currentLocation: CLLocation! // 내 위치 저장
    
    @IBOutlet weak var viewTopHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    let MaxTopHeight: CGFloat = 350 //상단뷰 최대 크기
    let MinTopHeight: CGFloat = 100 + UIApplication.shared.statusBarFrame.height //상단뷰 최소 크기
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    let country = countries[2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        locationManager.delegate = self
        name()
        imageCircle()
        map()
//        self.view.bringSubviewToFront(View2)
//        self.view.bringSubviewToFront(imageView)
    }
    
    func name() {
        imageView.image = UIImage(named: country.imageName)
        lblName.text = country.name
        lblState.text = country.state
        lblDescription.text = country.description
    }
    
    func map() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도
        locationManager.startUpdatingLocation() //위치 업데이트 시작
        locationManager.startMonitoringSignificantLocationChanges() //위치 데이터 승인 요구
        self.currentLocation = locationManager.location //내 현재 위치를 locatioinManager.location 값을 저장
        self.mapView.mapType = MKMapType.standard //앱 죽는 현상 해결
        self.mapView.setCenter(CLLocationCoordinate2D(latitude: 36.45835, longitude: 127.85584), animated: true) // 지도의 센터를 설정 (x와 y 좌표, 줌 레벨 등을 설정)
        self.mapView.showsUserLocation = true // 위치보기 값 true
        self.mapView.setUserTrackingMode(.follow, animated: true)
        
        let pin = MKPointAnnotation()
        pin.title = "\(country.name)"
        pin.subtitle = "캘리포니아"
        pin.coordinate = CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude)
        mapView.addAnnotation(pin)
    }
//    // MARK : 위도, 경도에 따른 주소 찾기
//    func findAddr(lat: CLLocationDegrees, long: CLLocationDegrees){
//        let findLocation = CLLocation(latitude: lat, longitude: long)
//        let geocoder = CLGeocoder()
//        let locale = Locale(identifier: "Ko-kr")
//
//        geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
//            if let address: [CLPlacemark] = placemarks {
//                var myAdd: String = ""
//                if let area: String = address.last?.locality{
//                    myAdd += area
//                }
//                if let name: String = address.last?.name {
//                    myAdd += " "
//                    myAdd += name
//                }
//            }
//        })
//    }
    
    func imageCircle() {
        imageView.layer.cornerRadius = imageView.frame.height/2 //원형
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.darkGray.cgColor  //원형 이미지 테두리 색상
        imageView.layer.shadowColor = UIColor.darkGray.cgColor
        imageView.layer.shadowRadius = 1
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
    }

    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actMyLocation(_ sender: Any) {
        locationManager.requestWhenInUseAuthorization() //권한 요청
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    @IBAction func actSearchLocation(_ sender: Any) {
        let LocationValue = CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude)
        //범위 값을 매개변수로 하여 MKCoordinateSpanMake함수를 호출하고, 리턴 값을 spanValue로 받습니다.
        let spanValue = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        //pLocation와 spanValue를 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴 값을 pRegion으로 받습니다.
        let Region = MKCoordinateRegion(center: LocationValue, span: spanValue)
        //pRegion을 매개변수로하여 myMap.setRegion 함수를 호출합니다.
        mapView.setRegion(Region, animated: true)
    }
    
    @IBAction func actKakaomap(_ sender: Any) {
        let lat:Double = country.latitude
        let lon:Double = country.longitude
        let mylat:Double = 37.4921839765254
        let mylon:Double = 127.03046988548856
        
        let alert = UIAlertController(title: "카카오맵", message: "카카오맵 길찾기 이동하시겠습니까?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "확인", style: .default) { _ in
            //스키마로 외부 앱 실행(info에 Queried URL Schemes 앱(kakaomap) 추가)
            if let openApp = URL(string: "kakaomap://route?sp=\(mylat),\(mylon)&ep=\(lat),\(lon)&by=CAR"), UIApplication.shared.canOpenURL(openApp) {
                UIApplication.shared.open(openApp, options: [:], completionHandler: nil)
            } else {
                //앱 미설치시 앱스토어로 연결
                if let openStore = URL(string: "https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4%EB%A7%B5-%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD-no-1-%EC%A7%80%EB%8F%84%EC%95%B1/id304608425"), UIApplication.shared.canOpenURL(openStore) {
                    UIApplication.shared.open(openStore, options: [:], completionHandler: nil)
                }
            }
        }
        let action2 = UIAlertAction(title: "취소", style: .cancel) { _ in
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PopularityViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //현재 스크롤의 위치 (최상단 = 0)
        let y: CGFloat = scrollView.contentOffset.y
                
        //변경될 최상단 뷰의 높이
        let ModifiedTopHeight: CGFloat = viewTopHeight.constant - y
                
        if(ModifiedTopHeight > MaxTopHeight) { // *** 변경될 높이가 최댓값(300)을 초과함
            //현재 최상단뷰의 높이를 최댓값(300)으로 설정
            viewTopHeight.constant = MaxTopHeight
        } else if(ModifiedTopHeight < MinTopHeight) { // *** 변경될 높이가 최솟값(50+상태바높이) 미만임
            //현재 최상단뷰의 높이를 최솟값(50+상태바높이)으로 설정
            viewTopHeight.constant = MinTopHeight
        } else { // *** 변경될 높이가 최솟값(50+상태바높이)과 최댓값(300) 사이임
            //현재 최상단 뷰 높이를 변경함
            viewTopHeight.constant = ModifiedTopHeight
            scrollView.contentOffset.y = 0
        }
    }
}
