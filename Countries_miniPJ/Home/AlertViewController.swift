//
//  AlertViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/26.
//

import UIKit

class AlertViewController: UIViewController {
    let date = Date()
    
    @IBOutlet weak var datepickerView: UIDatePicker!
//    var pickerView:UIPickerView = UIPickerView()
    var focusedRow:Int = 0
    var selectedRow:Int = 0
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblAdult: UILabel!
    @IBOutlet weak var lblChild: UILabel!
    @IBOutlet weak var lblBaby: UILabel!
    var lbladultText:UILabel = UILabel()
    var lblchildText:UILabel = UILabel()
    var lblbabyText:UILabel = UILabel()
    var lbladultInt:UILabel = UILabel()
    var lblchildInt:UILabel = UILabel()
    var lblbabyInt:UILabel = UILabel()
    @IBOutlet weak var stepperAdult: UIStepper!
    @IBOutlet weak var stepperChild: UIStepper!
    @IBOutlet weak var stepperBaby: UIStepper!
    var person1 = 0.0
    var person2 = 0.0
    var person3 = 0.0
    var sum = 9.0
    
    @IBOutlet weak var lblSeat: UILabel!
    
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblEnd: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "항공권"
        
        update()
        dateYYYY()
        dateMM()
        dateDD()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        minDate()
    }
    func minDate() { // date 최소/최대 날짜 설정
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var componenets = DateComponents()
        componenets.calendar = calendar
        componenets.day = 0
        let minimum = calendar.date(byAdding: componenets, to: currentDate)
        datepickerView.minimumDate = minimum
    }
    @objc func update() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss EEE"
        formatter.locale = Locale(identifier: "ko") //한글 변환
        lblTime.text = "현재 시간 " + formatter.string(from: date as Date)
    }
    @objc func dateYYYY() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        lblYear.text = formatter.string(from: date as Date) + "년"
    }
    @objc func dateMM() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        lblMonth.text = formatter.string(from: date as Date) + "월"
    }
    @objc func dateDD() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        lblDate.text = formatter.string(from: date as Date) + "일"
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    @IBAction func segChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
        } else if sender.selectedSegmentIndex == 1 {
        } else if sender.selectedSegmentIndex == 2 {
        }
    }
    
    @IBAction func actPickerDate(_ sender: UIButton) { //날짜 Date피커뷰
        let alert = UIAlertController(title: "날짜 선택", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "취소", style: .cancel) { _ in
//            self.pickerView.selectedRow(inComponent: 0)
        }
        let action2 = UIAlertAction(title: "확인", style: .default) { _ in
//            self.selectedRow = self.focusedRow
            
            let dateFormat1 = DateFormatter()
            dateFormat1.dateFormat = "yyyy"
            self.lblYear.text = dateFormat1.string(from: self.datepickerView.date) + "년"
            let dateFormat2 = DateFormatter()
            dateFormat2.dateFormat = "MM"
            self.lblMonth.text = dateFormat2.string(from: self.datepickerView.date) + "월"
            let dateFormat3 = DateFormatter()
            dateFormat3.dateFormat = "dd"
            self.lblDate.text = dateFormat3.string(from: self.datepickerView.date) + "일"
            
            self.lblYear.textColor = UIColor.black
            self.lblMonth.textColor = UIColor.black
            self.lblDate.textColor = UIColor.black
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        datepickerView.frame = CGRect(x: 50, y: 50, width: 270, height: 130)
//        pickerView.delegate = self
//        pickerView.dataSource = self
        alert.view.addSubview(datepickerView)
        self.present(alert, animated: true,completion: nil)
    }
    
    @IBAction func actPerson(_ sender: Any) {
        let alert = UIAlertController(title: "승객", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "취소", style: .cancel)
        let action2 = UIAlertAction(title: "확인", style: .default) { _ in
            self.selectedRow = self.focusedRow
            self.lblAdult.textColor = UIColor.black
            self.lblChild.textColor = UIColor.black
            self.lblBaby.textColor = UIColor.black
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        lbladultText.text = "성인"
        lbladultText.frame = CGRect(x: 40, y: 65, width: 50, height: 20)
        alert.view.addSubview(lbladultText)
        lblchildText.text = "소아"
        lblchildText.frame = CGRect(x: 40, y: 115, width: 50, height: 20)
        alert.view.addSubview(lblchildText)
        lblbabyText.text = "유아"
        lblbabyText.frame = CGRect(x: 40, y: 165, width: 50, height: 20)
        alert.view.addSubview(lblbabyText)
        
        lbladultInt.text = "1명"
        lbladultInt.frame = CGRect(x: 210, y: 65, width: 50, height: 20)
        alert.view.addSubview(lbladultInt)
        lblchildInt.text = "\(Int(stepperChild.value))명"
        lblchildInt.frame = CGRect(x:210, y: 115, width: 50, height: 20)
        alert.view.addSubview(lblchildInt)
        lblbabyInt.text = "\(Int(stepperBaby.value))명"
        lblbabyInt.frame = CGRect(x: 210, y: 165, width: 50, height: 20)
        alert.view.addSubview(lblbabyInt)
        
        stepperAdult.frame = CGRect(x: 250, y: 60, width: 50, height: 20)
//        stepperAdult.wraps = true
//        stepperAdult.autorepeat = true
        stepperAdult.minimumValue = 1
        print(person1)
        alert.view.addSubview(stepperAdult)
        stepperChild.frame = CGRect(x: 250, y: 110, width: 50, height: 20)
        stepperChild.value = person2
        alert.view.addSubview(stepperChild)
        stepperBaby.frame = CGRect(x: 250, y: 160, width: 50, height: 20)
        stepperBaby.value = person3
        alert.view.addSubview(stepperBaby)
        
        present(alert, animated: true)
    }
    
    @IBAction func actAdult(_ sender: UIStepper) { //사람 수 선택
        lbladultInt.text = "\(Int(sender.value).description)명"
        lblAdult.text = "\(Int(sender.value).description)명"
        stepperAdult.maximumValue = sum
//        person1 = Double(sender.value)
        
//        if person1 + person2 + person3 == sum {
//            stepperAdult.maximumValue = person1
//            stepperChild.maximumValue = person2
//            stepperBaby.maximumValue = person3
//            if person1 + person2 + person3 != sum {
//            }
//        }
    }
    @IBAction func actChild(_ sender: UIStepper) {
        lblchildInt.text = "\(Int(sender.value).description)명"
        lblChild.text = "\(Int(sender.value).description)명"
        stepperChild.maximumValue = sum
//        person2 = Double(sender.value)
    }
    @IBAction func actBaby(_ sender: UIStepper) {
        lblbabyInt.text = "\(Int(sender.value).description)명"
        lblBaby.text = "\(Int(sender.value).description)명"
        stepperBaby.maximumValue = sum
//        person3 = Double(sender.value)
    }
    
    
    @IBAction func actSeat(_ sender: Any) { //좌석 선택
        let alert = UIAlertController(title: "좌석등급", message: "선택하세요.", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "일반석", style: .default) { _ in
            self.lblSeat.text = "일반석"
            self.lblSeat.textColor = UIColor.black
        }
        let action2 = UIAlertAction(title: "프리미엄 일반석", style: .default) { _ in
            self.lblSeat.text = "프리미엄 일반석"
            self.lblSeat.textColor = UIColor.black
        }
        let action3 = UIAlertAction(title: "비지니스석", style: .default) { _ in
            self.lblSeat.text = "비지니스석"
            self.lblSeat.textColor = UIColor.black
        }
        let action4 = UIAlertAction(title: "일등석", style: .default) { _ in
            self.lblSeat.text = "일등석"
            self.lblSeat.textColor = UIColor.black
        }
        let action5 = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(action4)
        alert.addAction(action5)
        
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "start1" {
            let vc = segue.destination as? StartTableViewController
            vc?.lblStart = lblStart
        } else if segue.identifier == "end1" {
            let vc = segue.destination as? EndTableViewController
            vc?.lblEnd = lblEnd
        } else if segue.identifier == "pro" {
            let vc = segue.destination as? ProgressViewController
            vc?.lblStart = lblStart
            vc?.lblEnd = lblEnd
        } else {
            let vc = segue.destination as? CalendarViewController
            vc?.lblYear = lblYear
            vc?.lblMonth = lblMonth
            vc?.lblDate = lblDate
        }
    }
    
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// 피커뷰
//extension AlertViewController: UIPickerViewDataSource, UIPickerViewDelegate {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 3
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            return a.count
//        } else if component == 1 {
//            return b.count
//        } else {
//            return c.count
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let label = UILabel()
//        if component == 0 {
//            label.text = a[row]
//            label.font = .systemFont(ofSize: 20)
//        } else if component == 1 {
//            label.text = b[row]
//            label.font = .systemFont(ofSize: 20)
//        } else {
//            label.text = c[row]
//            label.font = .systemFont(ofSize: 20)
//        }
//        return label
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return a[row]
//        } else if component == 1 {
//            return b[row]
//        } else {
//            return c[row]
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if component == 0 {
//            lblYear.text = a[row]
//        } else if component == 1 {
//            lblMonth.text = b[row]
//        } else {
//            lblDate.text = c[row]
//        }
//        focusedRow = row
//    }
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 30
//    }
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        if component == 0 {
//            return 110
//        } else if component == 1 {
//            return 80
//        } else {
//            return 60
//        }
//    }
//}
