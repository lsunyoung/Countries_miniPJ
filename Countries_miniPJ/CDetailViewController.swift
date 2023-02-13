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
    @IBOutlet weak var lblSub: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    
    ////XML
    //    var country:[String:String]?
    
    var country:item?
    var flag:String?
    
    //////JSON
    //    var country:Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexImageAndLabel()
        setLanguage()
        Menu()
    }
    func indexImageAndLabel() {
        if let country = country {
            lblName.text = "\(country.countryName)(\(country.countryEnName))"
            lblDetail.text = country.continent
        }
        if let flag = flag {
            imageView.image = UIImage(named: flag)
        }
        
        imageView.layer.cornerRadius = imageView.frame.width/8 //모서리 라운드처리
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.clear.cgColor  //원형 이미지의 테두리 제거
    }
    
    func setLanguage() {
//        if let country = country {
//            lblSub.text = String(format: NSLocalizedString("Text", comment: ""), "\(country.countryName)")
//        }
            //설정된 언어 코드 가져오기
            let language = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as! String // 초기에 "ko-KR" , "en-KR" 등으로 저장되어있음
            let index = language.index(language.startIndex, offsetBy: 2)
            let languageCode = String(language[..<index]) //"ko" , "en" 등
            
            //설정된 언어 파일 가져오기
            let path = Bundle.main.path(forResource: languageCode, ofType: "lproj")
            let bundle = Bundle(path: path!)
            
            lblSub.text = bundle?.localizedString(forKey: "Text", value: nil, table: nil)
    }
    func Menu() {
        var menuItems: [UIAction] {
            return [
                UIAction(title: "한국어", image: UIImage(named: ""), handler: { (_) in
                    self.languageButton.setImage(UIImage(systemName: ""), for: .normal)
                    //한국어로 변경
                    UserDefaults.standard.set(["ko"], forKey: "AppleLanguages")
                            UserDefaults.standard.synchronize()
                            
                    //보통 메인화면으로 이동시켜줌
                    self.setLanguage()
                }),
                UIAction(title: "영어", image: UIImage(named: ""), handler: { (_) in
                    self.languageButton.setImage(UIImage(systemName: ""), for: .normal)
                    //영어로 변경
                    UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
                            UserDefaults.standard.synchronize()
                            
                    //보통 메인화면으로 이동시켜줌
                    self.setLanguage()
                }),
                UIAction(title: "일본어", image: UIImage(named: ""), handler: { (_) in
                    self.languageButton.setImage(UIImage(systemName: ""), for: .normal)
                    //일본어로 변경
                    UserDefaults.standard.set(["ja"], forKey: "AppleLanguages")
                            UserDefaults.standard.synchronize()
                            
                    //보통 메인화면으로 이동시켜줌
                    self.setLanguage()
                })
            ]
        }
        var demoMenu: UIMenu {
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
        }
        languageButton.menu = demoMenu
        languageButton.showsMenuAsPrimaryAction = true //짧게 눌러서 메뉴
    }

//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
//extension String { //html 태그 제거 + html entity들 디코딩
//    init?(htmlEncodedString: String) {
//        guard let data = htmlEncodedString.data(using: .utf8) else {
//            return nil
//        }
//        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
//            .documentType: NSAttributedString.DocumentType.html,
//            .characterEncoding: String.Encoding.utf8.rawValue
//        ]
//        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
//            return nil
//        }
//        self.init(attributedString.string)
//    }
//}
//
//extension String {
//    // html 태그 제거 + html entity들 디코딩.
//    var htmlEscaped: String {
//        guard let encodedData = self.data(using: .utf8) else {
//            return self
//        }
//
//        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
//            .documentType: NSAttributedString.DocumentType.html,
//            .characterEncoding: String.Encoding.utf8.rawValue
//        ]
//
//        do {
//            let attributed = try NSAttributedString(data: encodedData,
//                                                    options: options,
//                                                    documentAttributes: nil)
//            return attributed.string
//        } catch {
//            return self
//        }
//    }
//}
//extension String { //html 태그 제거
//    if let country = country {
//            textView.text = country.basic.htmlEscaped
//            print(String(htmlEncodedString: country.basic)!)
//            print(country.basic.components(separatedBy: ["&lt;div&gt;","&lt;br&gt;&#xD;","&lt;p style=&quot;margin-left: 20px; margin-right: 20px;&quot;&gt;","&#xD;"]).joined())
//    }
//    public func configureCell(imageURL: String, title: String, director: String, actor: String, pubDate: String) {
//        // 다음과 같이 String 값 뒤에 .htmlEscaped를 붙여서 사용
//        textView.text = country?.basic.htmlEscaped
//}

