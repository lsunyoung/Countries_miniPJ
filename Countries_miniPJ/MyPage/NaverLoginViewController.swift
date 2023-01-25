//
//  LoginViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/01.
//

import UIKit
import WebKit

class NaverLoginViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://nid.naver.com/nidlogin.login?svctype=262144") else {return}
        let request = URLRequest(url: url)
        webView.load(request)
    }

    // MARK: - Navigation
    
}
