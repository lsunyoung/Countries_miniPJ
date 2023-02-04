//
//  HomeViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/28.
//

import UIKit
import AVFoundation //사운드, 진동 메소드

class HomeViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var homeimageView: UIImageView!
    @IBOutlet weak var bellButton: UIButton!
   
    @IBOutlet weak var imageCircleView1: UIButton!
    @IBOutlet weak var imageCircleView2: UIImageView!
    @IBOutlet weak var imageCircleView3: UIImageView!
    @IBOutlet weak var imageCircleView4: UIImageView!
    @IBOutlet weak var imageCircleView5: UIImageView!
    @IBOutlet weak var imageCircleView6: UIImageView!
    @IBOutlet weak var imageCircleView7: UIImageView!
    @IBOutlet weak var imageCircleView8: UIImageView!
    @IBOutlet weak var imageCircleView9: UIImageView!
    @IBOutlet weak var imageCircleView10: UIImageView!
    @IBOutlet weak var imageCircleView11: UIImageView!
    
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var pageControl2: UIPageControl!
    
    var images = ["chilkoottrail","hiddenlake","chincoteague"]
           
    let Scrollimages = [UIImage(imageLiteralResourceName: "charleyrivers"),UIImage(imageLiteralResourceName: "stmarylake"),UIImage(imageLiteralResourceName: "silversalmoncreek"),UIImage(imageLiteralResourceName: "turtlerock")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        Menu()
        imageCircle()
        
        setImagePageControl()
        
        homeScrollView.delegate = self
        addContentScrollView()
        setScrollPageControl()
    }

    func Menu() {
        var menuItems: [UIAction] {
            return [
                UIAction(title: "알람 수신", image: UIImage(named: ""), handler: { (_) in
                    self.bellButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
                    UIDevice.vibrate()
                }),
                UIAction(title: "알람 미수신", image: UIImage(named: ""), handler: { (_) in
                    self.bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
                })
            ]
        }
        var demoMenu: UIMenu {
            return UIMenu(title: "선택", image: nil, identifier: nil, options: [], children: menuItems)
        }
        bellButton.menu = demoMenu
        bellButton.showsMenuAsPrimaryAction = true //짧게 눌러서 메뉴
    }
    
    @IBAction func ChangePage(_ sender: Any) {
        homeimageView.image = UIImage(named: images[pageControl.currentPage])
    }
    private func setImagePageControl() {
        homeimageView.image = UIImage(named: images[0])
        homeimageView.layer.cornerRadius = homeimageView.frame.width/8 //테두리 라운드 처리
        homeimageView.clipsToBounds = true
        pageControl.numberOfPages = images.count
    }
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func imageCircle() { //인기 도시 image
        imageCircleView1.layer.cornerRadius = imageCircleView1.layer.frame.size.width / 2 //0.5 곱해도됨
        imageCircleView1.clipsToBounds = true
        imageCircleView2.layer.cornerRadius = imageCircleView2.frame.height/2
        imageCircleView2.layer.borderWidth = 1
        imageCircleView2.clipsToBounds = true
        imageCircleView2.layer.borderColor = UIColor.clear.cgColor  //원형 이미지의 테두리 제거
        imageCircleView3.layer.cornerRadius = imageCircleView3.frame.height/2
        imageCircleView3.layer.borderWidth = 1
        imageCircleView3.clipsToBounds = true
        imageCircleView3.layer.borderColor = UIColor.clear.cgColor
        imageCircleView4.layer.cornerRadius = imageCircleView4.frame.height/2
        imageCircleView4.layer.borderWidth = 1
        imageCircleView4.clipsToBounds = true
        imageCircleView4.layer.borderColor = UIColor.clear.cgColor
        imageCircleView5.layer.cornerRadius = imageCircleView5.frame.height/2
        imageCircleView5.layer.borderWidth = 1
        imageCircleView5.clipsToBounds = true
        imageCircleView5.layer.borderColor = UIColor.clear.cgColor
        imageCircleView6.layer.cornerRadius = imageCircleView6.frame.height/2
        imageCircleView6.layer.borderWidth = 1
        imageCircleView6.clipsToBounds = true
        imageCircleView6.layer.borderColor = UIColor.clear.cgColor
        imageCircleView7.layer.cornerRadius = imageCircleView7.frame.height/2
        imageCircleView7.layer.borderWidth = 1
        imageCircleView7.clipsToBounds = true
        imageCircleView7.layer.borderColor = UIColor.clear.cgColor
        imageCircleView8.layer.cornerRadius = imageCircleView8.frame.height/2
        imageCircleView8.layer.borderWidth = 1
        imageCircleView8.clipsToBounds = true
        imageCircleView8.layer.borderColor = UIColor.clear.cgColor
        imageCircleView9.layer.cornerRadius = imageCircleView9.frame.height/2
        imageCircleView9.layer.borderWidth = 1
        imageCircleView9.clipsToBounds = true
        imageCircleView9.layer.borderColor = UIColor.clear.cgColor
        imageCircleView10.layer.cornerRadius = imageCircleView10.frame.height/2
        imageCircleView10.layer.borderWidth = 1
        imageCircleView10.clipsToBounds = true
        imageCircleView10.layer.borderColor = UIColor.clear.cgColor
        imageCircleView11.layer.cornerRadius = imageCircleView11.frame.height/2
        imageCircleView11.layer.borderWidth = 1
        imageCircleView11.clipsToBounds = true
        imageCircleView11.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func addContentScrollView() {
            for i in 0..<Scrollimages.count { //ScrollView에 Image 넣기
                let imageView = UIImageView()
                let xPos = homeScrollView.frame.width * CGFloat(i)
                imageView.frame = CGRect(x: xPos, y: 0, width: homeScrollView.bounds.width, height: homeScrollView.bounds.height)
                imageView.image = Scrollimages[i]
                imageView.layer.cornerRadius = imageView.frame.width/8 //테두리 라운드 처리
                imageView.clipsToBounds = true
                imageView.layer.borderColor = UIColor.clear.cgColor  //원형 이미지의 테두리 제거
                homeScrollView.addSubview(imageView)
                homeScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
            }
        homeScrollView.showsHorizontalScrollIndicator = false //가로 스크롤 표시줄 없애기
        homeScrollView.showsVerticalScrollIndicator = false //세로 스크롤 표시줄 없애기
        homeScrollView.isPagingEnabled = true //페이징 처리
        homeScrollView.bounces = false //첫 or 마지막 페이지에서 바운스 스크롤 효과 없애기
            }
    private func setScrollPageControl() {
        pageControl2.numberOfPages = Scrollimages.count //PageControl 페이지 갯수
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
extension UIDevice {
    static func vibrate() {
        //        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) //진동
        AudioServicesPlaySystemSound(4095) //진동
        //        AudioServicesPlaySystemSound(1016) //사운드
    }
}
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value))) //이미지 컨트롤
        
        let scrollControl = homeScrollView.contentOffset.x/homeScrollView.frame.size.width
        pageControl2.currentPage = Int(floor(scrollControl)) //스크롤 컨트롤
    }
}
