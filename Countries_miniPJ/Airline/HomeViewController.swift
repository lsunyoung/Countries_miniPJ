//
//  HomeViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/28.
//

import UIKit
import AVFoundation //사운드, 진동 메소드

class HomeViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeimageView: UIImageView!
    @IBOutlet weak var bellButton: UIButton!
    
    var images = ["travel1","travel2","travel3"]
//    var images = [#imageLiteral(resourceName: "travel1"),#imageLiteral(resourceName: "travel2"),#imageLiteral(resourceName: "travel3")]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        homeimageView.image = UIImage(named: images[0])
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        Menu()
        
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()
    }

    @IBAction func ChangePage(_ sender: Any) {
        homeimageView.image = UIImage(named: images[pageControl.currentPage])
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
    private func addContentScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = scrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            //            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
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
