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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "게시판"
        tableView.rowHeight = 450
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let targetPath = getFilePath(fileName: "post.plist")
                print("targetPath:\(targetPath)")
        guard let originPath = Bundle.main.path(forResource: "post", ofType: "plist") else {return}
                print("originPath:\(originPath)")
        copyFile(originPath, to: targetPath)
        post = NSMutableArray(contentsOfFile: targetPath)
        tableView.dataSource = self
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
