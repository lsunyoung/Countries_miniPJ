//
//  CXMainTableViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/27.
//

import UIKit

class CXMainTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnPrev: UIBarButtonItem!
    @IBOutlet weak var btnNext: UIBarButtonItem!

    var isLock = true
    var tagType:TagType = .none
    var tempModel:item?
    var countries:[item] = []
    
//    var countries:[[String:String]] = []
//    var country:[String:String] = [:]
//    var key:String?
    
    let apiKey = "IUpAoCHPrPTH%2BSCBSuIelR2KXw%2BHxUgTxq%2Fas2Jht7G373n9Pie1CvUICyeEhlaFUB3Crr0Lzqj%2FkAQUYnKq1A%3D%3D"
    
    var page = 1
    var lastPage = 1
    var totalPage = 196
    var num = 20
    
    var heartb:UIButton?
    var isheartOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        self.title = "나라 정보"

        self.tableView.keyboardDismissMode = .onDrag //스크롤 시 키보드 내림
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))) //화면 터치 시 키보드 내림
        
        search(with: "", page: page, total: totalPage)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) { //화면 터치 시 키보드 내림
        if sender.state == .ended {
            view.endEditing(true)
        }
        sender.cancelsTouchesInView = false
    }
    
    func search(with query:String?, page:Int, total:Int) {
        guard let q = query?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let str = "http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?serviceKey=\(apiKey)&returnType=XML&countryName=\(q)&pageNo=\(page)&numOfRows=\(total)"
        guard let url = URL(string: str) else {return}
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { data, _, error in
            guard let data = data else {return}
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            DispatchQueue.main.async {
                self.btnNext.isEnabled = page < self.lastPage
            }
        }.resume()
        btnPrev.isEnabled = page > 1
    }

    @IBAction func actPrev(_ sender: Any) {
        page += 1
        search(with: searchBar.text, page: page, total: num)
    }
    
    @IBAction func actNext(_ sender: Any) {
        page -= 1
        search(with: searchBar.text, page: page, total: num)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        let flag = flags[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "countrycell", for: indexPath)
        
        if let imageView = cell.viewWithTag(1) as? UIImageView {
            imageView.image = UIImage(named: flag) }
        
//        let lblcountry_nm = cell.viewWithTag(2) as? UILabel
//        lblcountry_nm?.text = country["countryName"]
//
//        let lblcountry_eng_nm = cell.viewWithTag(3) as? UILabel
//        lblcountry_eng_nm?.text = country["countryEnName"]
//
//        let lblcontinent_eng_nm = cell.viewWithTag(4) as? UILabel
//        lblcontinent_eng_nm?.text = country["continent"]
        
        
        let lblcountry_nm = cell.viewWithTag(2) as? UILabel
        lblcountry_nm?.text = country.countryName

        let lblcountry_eng_nm = cell.viewWithTag(3) as? UILabel
        lblcountry_eng_nm?.text = country.countryEnName

        let lblcontinent_eng_nm = cell.viewWithTag(4) as? UILabel
        lblcontinent_eng_nm?.text = country.continent
        
//        if indexPath.row < totalPage {
//            cell.accessoryView = UIImageView(image: (UIImage(systemName: "heart")))
//            cell.accessoryView?.tintColor = .systemPink
//        }
        
        return cell
    }

    @IBAction func actHeart(_ sender: UIButton) {
//        sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
        if (isheartOn==true) {
            let alert = UIAlertController(title: "안내", message: "즐겨찾기 성공", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action1)
            self.present(alert, animated: true)
        } else if (isheartOn==false) {
            let alert = UIAlertController(title: "안내", message: "즐겨찾기 해제", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action1)
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "country" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let vc = segue.destination as? CDetailViewController
            vc?.country = countries[indexPath.row]
            vc?.flag = flags[indexPath.row]
        }
    }
}

extension CXMainTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        search(with: searchBar.text, page: page, total: num)
        searchBar.resignFirstResponder()
    }
}

//extension CXMainTableViewController: XMLParserDelegate {
//    func parserDidStartDocument(_ parser: XMLParser) {
//        countries = []
//    }
//
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        if elementName == "item" {
//            country = [:]
//        } else if elementName == "basic" {
//            key = "basic"
//        } else if elementName == "continent" {
//            key = "continent"
//        } else if elementName == "countryEnName" {
//            key = "continent"
//        } else if elementName == "countryName" {
//            key = "continent"
//        } else if elementName == "id" {
//            key = "id"
//        } else if elementName == "imgUrl" {
//            key = "imgUrl"
//        } else if elementName == "wrtDt" {
//            key = "wrtDt"
//        } else if elementName == "numOfRows" {
//            key = "numOfRows"
//        }
//    }
//
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        if let key = self.key {
//            country[key] = string
//
//            if key == "basic" {
//                country[key] = string
//            } else if key == "continent" {
//                country[key] = string
//            } else if key == "countryEnName" {
//                country[key] = string
//            } else if key == "countryName" {
//                country[key] = string
//            } else if key == "id" {
//                country[key] = string
//            } else if key == "imgUrl" {
//                country[key] = string
//            } else if key == "numOfRows" {
//                country[key] = string
//            } else if key == "numOfRows" {
//                if let count = Int(string){
//                    self.lastPage = count / 10 + 1
//                }
//            }
//        }
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == "item"{
//            countries.append(country)
//        }
//    }
//
//    func parserDidEndDocument(_ parser: XMLParser) {
//        print(self.countries)
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//}

extension CXMainTableViewController: XMLParserDelegate {
    func parserDidStartDocument(_ parser: XMLParser) {
        countries = []
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == "item" {
            isLock = true
            tempModel = item.init()
        } else if elementName == "basic" {
            tagType = .basic
        } else if elementName == "continent" {
            tagType = .continent
        } else if elementName == "countryEnName" {
            tagType = .countryEnName
        } else if elementName == "countryName" {
            tagType = .countryName
        } else if elementName == "id" {
            tagType = .id
        } else if elementName == "imgUrl" {
            tagType = .imgUrl
        } else if elementName == "wrtDt" {
            tagType = .wrtDt
        } else if elementName == "numOfRows" {
            tagType = .numOfRows
        } else {
            tagType = .none
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            guard let tempModel = tempModel else {
                return
            }
            countries.append(tempModel)
            isLock = false
        } else {
            print("didEnd Error")
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let parseString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        if isLock {
            switch tagType {
            case .basic:
                tempModel?.basic = parseString
            case .continent:
                tempModel?.continent = parseString
            case .countryEnName:
                tempModel?.countryEnName = parseString
            case .countryName:
                tempModel?.countryName = parseString
            case .id:
                tempModel?.id = parseString
            case .imgUrl:
                tempModel?.imgUrl = parseString
            case .wrtDt:
                tempModel?.wrtDt = parseString
            case .numOfRows:
                if let count = Int(string){
                    self.lastPage = count / 10 + 1
                }
            case .none: break
            }
        }
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print(self.countries)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
//extension String {
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
