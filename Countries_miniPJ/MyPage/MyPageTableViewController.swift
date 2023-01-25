//
//  MyPageTableViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/02.
//

import UIKit

class MyPageTableViewController: UITableViewController {

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblMy: UILabel!
    @IBOutlet weak var lblCalldibs: UILabel!
    @IBOutlet weak var lblCommunity: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "마이페이지"
        logoutButton.layer.cornerRadius = 10 //버튼 라운드 처리
    }

    @IBAction func actLogout(_ sender: Any) {
        logoutButton.setTitle("", for: .selected)
        logoutButton.setTitleColor(.white, for: .selected)
        logoutButton.backgroundColor = .white
        lblLogin.text = "로그인 해주세요."
        lblID.text = ""
        lblMy.text = ""
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let vc = segue.destination as? LoginViewController
            vc?.lblMy = lblMy
            vc?.lblLogin = lblLogin
            vc?.lblID = lblID
            vc?.logoutButton = logoutButton
        }
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
}
