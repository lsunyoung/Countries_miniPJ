//
//  CWebViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/26.
//

import UIKit
import WebKit

class CWebViewController: UIViewController {
    var strURL:String?

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://www.0404.go.kr/new_osm/index_x.jsp?a1=15571139.906030&a2=4476152.376380&a3=5&a4=") else {return}
        let request = URLRequest(url: url)
//        guard let strURL = self.strURL, let url = URL(string: strURL) else {return}
//        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.dismiss(animated: true) //모달뷰 Back
    }
    
    @IBAction func actList(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil) //모달뷰 root 이동

//        self.presentingViewController?.dismiss(animated: false, completion: nil)
//        self.presentingViewController?.dismiss(animated: true, completion: nil) //모달뷰 root 이동
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
