//
//  CalendarViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/18.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var lblYear:UILabel?
    var lblMonth:UILabel?
    var lblDate:UILabel?

    @IBOutlet weak var calendarView: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // date 최소/최대 날짜 설정
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var componenets = DateComponents()
        componenets.calendar = calendar
        componenets.day = 0
        let minimum = calendar.date(byAdding: componenets, to: currentDate)
        calendarView.minimumDate = minimum
    }
    
    @IBAction func actCalendar(_ sender: UIDatePicker) {
        let datePicker = sender
        let dateFormat1 = DateFormatter()
        dateFormat1.dateFormat = "yyyy"
        lblYear?.text = dateFormat1.string(from: datePicker.date) + "년"
        let dateFormat2 = DateFormatter()
        dateFormat2.dateFormat = "MM"
        lblMonth?.text = dateFormat2.string(from: datePicker.date) + "월"
        let dateFormat3 = DateFormatter()
        dateFormat3.dateFormat = "dd"
        lblDate?.text = dateFormat3.string(from: datePicker.date) + "일"
        lblYear?.textColor = UIColor.black
        lblMonth?.textColor = UIColor.black
        lblDate?.textColor = UIColor.black
    }
    
    @IBAction func actComplete(_ sender: Any) {
        self.dismiss(animated: true)
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
