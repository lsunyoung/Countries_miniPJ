//
//  CDetailViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/26.
//

import UIKit

class CDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    ////XML
    //    var country:[String:String]?
    
    var country:item?
    var flag:String?
    
    //////JSON
    //    var country:Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let country = country {
            lblName.text = "\(country.countryName)(\(country.countryEnName))"
            lblDetail.text = country.continent
            
            
//            textView.text = country.basic.htmlEscaped
            print(String(htmlEncodedString: country.basic)!)
//            print(country.basic.components(separatedBy: ["&lt;div&gt;","&lt;br&gt;&#xD;","&lt;p style=&quot;margin-left: 20px; margin-right: 20px;&quot;&gt;","&#xD;"]).joined())
        }
        if let flag = flag {
            imageView.image = UIImage(named: flag)
        }

//        if let country = country {
//            textView.text = country["basic"]
//            lblDatil.text = country["basic"]
//        }
    }
    public func configureCell(imageURL: String, title: String, director: String, actor: String, pubDate: String) {
        // 다음과 같이 String 값 뒤에 .htmlEscaped를 붙여서 사용
        textView.text = country?.basic.htmlEscaped
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
extension String { //html 태그 제거 + html entity들 디코딩
    init?(htmlEncodedString: String) {
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        self.init(attributedString.string)
    }
}

extension String {
    // html 태그 제거 + html entity들 디코딩.
    var htmlEscaped: String {
        guard let encodedData = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributed = try NSAttributedString(data: encodedData,
                                                    options: options,
                                                    documentAttributes: nil)
            return attributed.string
        } catch {
            return self
        }
    }
}

