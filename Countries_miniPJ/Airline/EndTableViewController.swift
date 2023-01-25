//
//  EndTableViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/01.
//

import UIKit

class EndTableViewController: UITableViewController {

    var lblEnd:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "도시 선택"
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return nations.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keys = nations.keys.sorted()
        let key = keys[section]
        if let group = nations[key] {
            return group.count
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let keys = nations.keys.sorted()
        let key = keys[indexPath.section]
        guard let group = nations[key] else {return cell}
        let nation = group[indexPath.row]
        
        let lblName = cell.viewWithTag(1) as? UILabel
        lblName?.text = nation.name
        
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = UILabel()
        let keys = nations.keys.sorted()
        let key = keys[section]
        head.text = "\(key)"
        head.textAlignment = .center
        head.font = .boldSystemFont(ofSize: 30)
        head.textColor = .white
        head.backgroundColor = .systemGray5
        
        return head
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keys = nations.keys.sorted()
        let key = keys[indexPath.section]
        guard let group = nations[key] else {fatalError()}
        let nation = group[indexPath.row]
        
        if let lblEnd = lblEnd {
            lblEnd.text = nation.name
            lblEnd.textColor = UIColor.black
        }
        self.navigationController?.popViewController(animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

