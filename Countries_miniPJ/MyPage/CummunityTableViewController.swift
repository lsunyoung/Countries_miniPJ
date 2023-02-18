//
//  CummunityTableViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/02.
//

import UIKit
import PhotosUI

class CummunityTableViewController: UITableViewController {

    var post:NSMutableArray?
    
    @IBOutlet weak var kakaoButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var snsButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "게시판"
        tableView.rowHeight = 450
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        targetPath()
        tableView.dataSource = self
    }
    
    func targetPath() {
        let targetPath = getFilePath(fileName: "post.plist")
                print("targetPath:\(targetPath)")
        guard let originPath = Bundle.main.path(forResource: "post", ofType: "plist") else {return}
                print("originPath:\(originPath)")
        copyFile(originPath, to: targetPath)
        post = NSMutableArray(contentsOfFile: targetPath)
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let post = self.post {
            return post.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let postIndex = post[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let post = self.post, let postIndex = post[indexPath.row] as? [String:String] else {return cell}
        let text:String? = postIndex["text"]
        let imageView = cell.viewWithTag(1) as? UIImageView
        if let imageName = postIndex["image"] {
            let image = UIImage(named: imageName)
            imageView?.image = image
        }
        let lbltext = cell.viewWithTag(2) as? UILabel
        lbltext?.text = text
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            post?.removeObject(at: indexPath.row)
            let fileName = getFilePath(fileName: "post.plist") //
            post?.write(toFile: fileName, atomically: true)  //
            tableView.deleteRows(at: [indexPath], with: .fade)  //삭제된 테이블 유지
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actShare(_ sender: Any) {
        let alert = UIAlertController(title: "공유", message: "\n\n\n\n\n", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "취소", style: .cancel) { _ in
        }
        alert.addAction(action1)
   
        kakaoButton.frame = CGRect(x: 70, y: 60, width: 50, height: 50)
        kakaoButton.setImage(UIImage(named: "kakaoTalk"), for: .normal)
        alert.view.addSubview(kakaoButton)
        facebookButton?.frame = CGRect(x: 160, y: 60, width: 50, height: 50)
        alert.view.addSubview(facebookButton)
        snsButton.frame = CGRect(x: 250, y: 60, width: 50, height: 50)
        alert.view.addSubview(snsButton)

        present(alert, animated: true)
    }
    @IBAction func actKakao(_ sender: Any) {
        // URLScheme 문자열을 통해 URL 인스턴스를 만들어 줍니다.
        if let url = NSURL(string: "kakaolink://"),
           //canOpenURL(_:) 메소드를 통해서 URL 체계를 처리하는 데 앱을 사용할 수 있는지 여부를 확인
           UIApplication.shared.canOpenURL(url as URL) {
            //사용가능한 URLScheme이라면 open(_:options:completionHandler:) 메소드를 호출해서
            //만들어둔 URL 인스턴스를 열어줍니다.
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
//        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actFacebook(_ sender: Any) {
        if let url = NSURL(string: "https://apps.apple.com/kr/app/facebook/id284882215"),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
//        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actSns(_ sender: Any) {
        if let url = NSURL(string: "sms://"),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
//        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? AddViewController
        vc?.post = post
    }
}
