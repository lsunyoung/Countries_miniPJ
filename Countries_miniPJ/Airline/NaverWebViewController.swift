//
//  NaverViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/18.
//

import UIKit
import WebKit

class NaverWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://m.naver.com") else {return}
        let request = URLRequest(url: url)
        webView.load(request)
       
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actNaver(_ sender: Any) {
        guard let url = URL(string: "https://m.naver.com") else {return}
        let request = URLRequest(url: url)
        webView.load(request)
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
