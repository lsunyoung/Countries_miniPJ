//
//  ProgreesViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/27.
//

import UIKit

class ProgressViewController: UIViewController {
    @IBOutlet weak var lbls: UILabel!
    @IBOutlet weak var lble: UILabel!
    var lblStart:UILabel?
    var lblEnd:UILabel?
    
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actIndicator.startAnimating()
        self.title = "항공권"
        
        if let lblStart = lblStart {
            lbls.text = lblStart.text
        }
        if let lblEnd = lblEnd {
            lble.text = lblEnd.text
        }
    }
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
