//
//  ChatViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/20.
//

import UIKit

class ChatViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate */{

    var text1 = ["안녕하세요 무엇을 도와드릴까요?"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return text1.count
//    }
}
