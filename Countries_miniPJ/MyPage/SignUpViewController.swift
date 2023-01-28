//
//  SignUpViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/19.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var IDTextfield: UITextField!
    @IBOutlet weak var OverlapButton: UIButton! {
        didSet {
            OverlapButton.isEnabled = false
        }
    }
    @IBOutlet weak var IDTextDescription: UILabel!
    @IBOutlet weak var PWTextfield: UITextField!
    @IBOutlet weak var PWTextDescription: UILabel!
    @IBOutlet weak var RPWTextfield: UITextField!
    @IBOutlet weak var RPWTextDescription: UILabel!
    @IBOutlet weak var MailTextfield: UITextField!
    @IBOutlet weak var MailTextDescription: UILabel!
    @IBOutlet weak var PhoneTextfield: UITextField!
    @IBOutlet weak var PhoneTextDescription: UILabel!
    @IBOutlet weak var SendButton: UIButton! {
        didSet {
            SendButton.isEnabled = false
        }
    }
    @IBOutlet weak var CertifiedTextfield: UITextField!
    @IBOutlet weak var CertifiedCheckButton: UIButton! {
        didSet {
            CertifiedCheckButton.isEnabled = false
        }
    }
    @IBOutlet weak var CertifiedTextDescription: UILabel!
    @IBOutlet weak var NameTextfield: UITextField!
    @IBOutlet weak var NickTextfield: UITextField!
    @IBOutlet weak var BirthdayButton: UIButton!
    @IBOutlet weak var Yearlbl: UILabel!
    @IBOutlet weak var Monthlbl: UILabel!
    @IBOutlet weak var Daylbl: UILabel!
    @IBOutlet weak var calendarView: UIDatePicker!
    
    @IBOutlet weak var CheckBox: SignUpCheckBox!
    @IBOutlet weak var CheckButton1: UIButton!
    @IBOutlet weak var CheckButton2: UIButton!
    @IBOutlet weak var CheckButton3: UIButton!
    
    @IBOutlet weak var signupButton: UIButton! {
        didSet {
            signupButton.isEnabled = false
        }
    }
    
    var num : String = "" //인증 번호
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text()
        ButtonEnable()
    }
    func text() {
        IDTextfield.placeholder = " 아이디 입력*"
        PWTextfield.placeholder = " 비밀번호 입력*"
        RPWTextfield.placeholder = " 비밀번호 재입력*"
        MailTextfield.placeholder = " 이메일 입력*"
        PhoneTextfield.placeholder = " 휴대폰번호 입력*"
        CertifiedTextfield.placeholder = " 인증번호 입력*"
        NameTextfield.placeholder = " 이름 입력*"
        NickTextfield.placeholder = " 닉네임 입력"
        OverlapButton.layer.cornerRadius = 10
        SendButton.layer.cornerRadius = 10
        CertifiedCheckButton.layer.cornerRadius = 10
        signupButton.layer.cornerRadius = 10
        IDTextDescription.isHidden = true
        PWTextDescription.isHidden = true
        RPWTextDescription.isHidden = true
        MailTextDescription.isHidden = true
        PhoneTextDescription.isHidden = true
        CertifiedTextDescription.isHidden = true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //키보드 내림
    }
    private func ButtonEnable() { //필드 입력 시 버튼 enable
        self.IDTextfield.addAction(UIAction(handler: { _ in
            if self.IDTextfield.text?.isEmpty == true {
                self.OverlapButton.isEnabled = false
            } else {
                self.OverlapButton.isEnabled = true
            }
        }), for: .editingChanged)
        if SendButton.isEnabled == false {
            SendButton.setTitleColor(.systemGray, for: .normal)
        }
        self.PhoneTextfield.addAction(UIAction(handler: { _ in
            if self.PhoneTextfield.text?.isEmpty == true {
                self.SendButton.isEnabled = false
                self.SendButton.setTitleColor(.systemGray, for: .normal)
            } else {
                self.SendButton.isEnabled = true
                self.SendButton.setTitleColor(.white, for: .normal)
            }
        }), for: .editingChanged)
        self.CertifiedTextfield.addAction(UIAction(handler: { _ in
            if self.CertifiedTextfield.text?.isEmpty == true {
                self.CertifiedCheckButton.isEnabled = false
            } else {
                self.CertifiedCheckButton.isEnabled = true
            }
        }), for: .editingChanged)
    }
    
    @IBAction func IdTextFieldTyped(_ sender: Any) {
        IDTextDescription.isHidden = false // label 보여주기
                
                let userWord = IDTextfield.text?.lowercased() // 소문자 변환
                IDTextfield.text = userWord // 변환된 소문자로 바꿔주기
                
                let minCount = 5
                let maxCount = 12
                let count = userWord!.count

        switch count {
        case 0:
            IDTextDescription.text = " 아이디는 필수입력 정보입니다."
        case 1..<minCount:
            IDTextDescription.text = " 아이디는 5글자 이상이어야 합니다."
        case minCount...maxCount:
            let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isVaildPattern = (userWord!.range(of: idPattern, options: .regularExpression) != nil)
            if isVaildPattern {
                IDTextDescription.text = "조건에 맞는 아이디입니다."
                IDTextDescription.isHidden = true
            } else {
                IDTextDescription.text = " 소문자, 숫자, -, _만 사용할 수 있습니다."
            }
        default:
            IDTextDescription.text = " 아이디는 12글자 이하이어야 합니다."
        }
    }
    
    @IBAction func actOverlab(_ sender: UIButton) {
        let userWord = IDTextfield.text?.lowercased() // 소문자 변환
        IDTextfield.text = userWord // 변환된 소문자로 바꿔주기
        let minCount = 5
        let maxCount = 12
        let count = userWord!.count
        switch count {
        case 1..<minCount:
            let alert = UIAlertController(title: "사용 불가", message: "아이디는 5글자 이상이어야 합니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        case minCount...maxCount:
            let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isVaildPattern = (userWord!.range(of: idPattern, options: .regularExpression) != nil)
            if isVaildPattern {
                let alert = UIAlertController(title: "사용 가능", message: "ID 사용 가능합니다:)", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default) { _ in
                    self.IDTextfield.isEnabled = false
                    self.OverlapButton.isEnabled = false
                }
                alert.addAction(action)
                present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "사용 불가", message: "소문자, 숫자, -, _만 사용할 수 있습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
        default:
            let alert = UIAlertController(title: "사용 불가", message: "아이디는 12글자 이하이어야 합니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
        let IDTextCount = IDTextfield.text!.count
        if (IDTextCount >= 5){
            
            let alert = UIAlertController(title: "사용 가능", message: "ID 사용 가능합니다:)", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default) { _ in
                self.IDTextfield.isEnabled = false
                self.OverlapButton.isEnabled = false
            }
            alert.addAction(action)
            present(alert, animated: true)
        }
        let alert = UIAlertController(title: "사용 불가", message: "아이디는 5자리 이상 12자리 이하만 가능합니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func PwTextFieldTyped(_ sender: Any) { //비밀번호 필드
//        PWTextfield.textContentType = .newPassword //ios12 (새 패스워드)
        PWTextfield.isSecureTextEntry = true //비밀번호 * 표시
        PWTextDescription.isHidden = false
                
                let minCount = 8
                let maxCount = 16
                let count = PWTextfield.text!.count

                switch count {
                case 0:
                    PWTextDescription.text = " 비밀번호는 필수입력 정보입니다."
                case 1..<minCount:
                    PWTextDescription.text = " 비밀번호는 8글자 이상이어야 합니다."
                case minCount...maxCount:
                    let idPattern = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{\#(minCount),\#(maxCount)}$"#
                    let isVaildPattern = (PWTextfield.text!.range(of: idPattern, options: .regularExpression) != nil)
                    if isVaildPattern {
                        PWTextDescription.text = "조건에 맞는 비밀번호입니다."
                        PWTextDescription.isHidden = true
                    } else {
                        PWTextDescription.text = " 영문, 숫자, 특수문자가 필수로 입력되어야 합니다."
                    }
                default:
                    PWTextDescription.text = " 비밀번호는 16글자 이하이어야 합니다."
                }
    }
    
    @IBAction func RPwTextFieldTyped(_ sender: Any) { //비밀번호 재입력 필드
//        PWTextfield.textContentType = .password //ios11 (일반 패스워드)
        RPWTextfield.isSecureTextEntry = true //비밀번호 * 표시
        if PWTextfield.text != RPWTextfield.text {
            RPWTextDescription.isHidden = false
            RPWTextDescription.text = " 비밀번호가 일치하지 않습니다."
        } else {
            RPWTextDescription.isHidden = true
            RPWTextDescription.text = " 비밀번호가 일치합니다."
        }
    }
    
    @IBAction func MailTextFieldTyped(_ sender: Any) { //이메일 필드
        MailTextDescription.isHidden = false
                
                let idPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
                let isVaildPattern = (MailTextfield.text!.range(of: idPattern, options: .regularExpression) != nil)
                
                if MailTextfield.text!.isEmpty {
                    MailTextDescription.text = " 이메일은 필수로 입력해야합니다."
                } else if isVaildPattern {
                    MailTextDescription.text = "조건에 맞는 이메일입니다."
                    MailTextDescription.isHidden = true
                } else {
                    MailTextDescription.text = " 올바르지 않은 이메일 형식입니다."
                }
    }
    
    @IBAction func PhoneTextFieldTyped(_ sender: Any) { //휴대폰번호 필드
        PhoneTextDescription.isHidden = false
                let convertDigit = PhoneTextfield.text!.replacingOccurrences(of: #"\D"#, with: "", options: .regularExpression)
                let count = convertDigit.count
                let rightNumberCount = [10, 11] //올바른 폰넘버 갯수
                switch count {
                case 0:
                    PhoneTextDescription.text = " 휴대폰 번호는 필수로 입력해야합니다."
                    PhoneTextfield.text = convertDigit
                case 1...3:
                    PhoneTextfield.text = convertDigit
                case 4...7:
                    PhoneTextfield.text = convertDigit.prefix(3) + "-" + convertDigit.suffix(convertDigit.count-3)
                    PhoneTextDescription.text =  "올바르지 않은 휴대폰 번호 입니다."
                case 8...11:
                    let startIndex = convertDigit.index(convertDigit.startIndex, offsetBy: 3)
                    let endingIndex = convertDigit.index(convertDigit.startIndex, offsetBy: count-5)
                    let middleNumber = convertDigit[startIndex...endingIndex]
                    PhoneTextfield.text = convertDigit.prefix(3) + "-" + middleNumber + "-" + convertDigit.suffix(4)
                    if rightNumberCount.contains(count) {
                        PhoneTextDescription.text = "올바른 휴대폰 번호입니다."
                        PhoneTextDescription.isHidden = true
                    } else {
                        PhoneTextDescription.text = " 올바르지 않은 휴대폰 번호입니다."
                    }
                default:
                    PhoneTextDescription.text = " 올바르지 않은 휴대폰 번호입니다."
                }
    }
    
    @IBAction func actSend(_ sender: UIButton) { //전송 버튼
        let phonetext = PhoneTextfield.text!
        let count = phonetext.count
        if (count < 13) || (count > 13) {
            let alert = UIAlertController(title: "전송 실패", message: " 휴대폰 번호를 모두 입력해주세요.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            num = String(Int.random(in: 100000...999999)) //랜덤 번호
            let alert = UIAlertController(title: "인증 번호", message: num, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default) { _ in
            }
            alert.addAction(action)
            present(alert, animated: true)

            SendButton.setTitle("재전송", for: .normal)
            CertifiedTextfield.isEnabled = true
            CertifiedCheckButton.isEnabled = true
        }
    }
    
    @IBAction func CertifiedTextFieldTyped(_ sender: Any) { //인증번호 필드
        CertifiedTextDescription.isHidden = false
                let convertDigit = CertifiedTextfield.text!.replacingOccurrences(of: #"\D"#, with: "", options: .regularExpression)
                CertifiedTextfield.text = convertDigit
                let count = convertDigit.count
                switch count {
                case 0:
                    CertifiedTextDescription.text = "인증번호를 입력해주세요"
                case 6:
                    CertifiedTextDescription.isHidden = true
                default:
                    CertifiedTextDescription.text = "인증번호 6자리를 숫자 입력해주세요."
                }
    }
    
    @IBAction func actCkeck(_ sender: UIButton) { //인증 버튼
        let CertifiedCheckText = CertifiedTextfield.text!
                if CertifiedCheckText.count != 6  {
                    let alert = UIAlertController(title: "인증 실패", message: "인증번호 6자리 입력해주세요.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                } else if CertifiedCheckText == num {
                    let alert = UIAlertController(title: "인증 완료", message: "인증이 완료되었습니다:D", preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .default) { _ in
                        self.CertifiedCheckButton.isEnabled = false
                        self.CertifiedTextfield.isEnabled = false
                    }
                    alert.addAction(action)
                    present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "인증 실패", message: "올바르지 않은 인증번호 입니다.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                }
    }
    
    @IBAction func actBirthday(_ sender: UIButton) { //생년월일 버튼
        let alert = UIAlertController(title: "날짜 선택", message: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "취소", style: .cancel)
        let action2 = UIAlertAction(title: "확인", style: .default) { _ in
            let dateFormat1 = DateFormatter()
            dateFormat1.dateFormat = "yyyy"
            self.Yearlbl.text = dateFormat1.string(from: self.calendarView.date) + "년"
            let dateFormat2 = DateFormatter()
            dateFormat2.dateFormat = "MM"
            self.Monthlbl.text = dateFormat2.string(from: self.calendarView.date) + "월"
            let dateFormat3 = DateFormatter()
            dateFormat3.dateFormat = "dd"
            self.Daylbl.text = dateFormat3.string(from: self.calendarView.date) + "일"
            
            self.Yearlbl.textColor = UIColor.black
            self.Monthlbl.textColor = UIColor.black
            self.Daylbl.textColor = UIColor.black
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        calendarView.frame = CGRect(x: 60, y: 50, width: 270, height: 250)
        alert.view.addSubview(calendarView)
        self.present(alert, animated: true,completion: nil)
    }
    
    @IBAction func actAgreeCheck(_ sender: UIButton) { //약관 동의 버튼
        let agreementArray  = [CheckBox, CheckButton1, CheckButton2, CheckButton3]
        if sender.tag == 0 {
                    if agreementArray[0]!.isSelected {
                        for i in agreementArray {
                            i?.isSelected = false
                            signupButton.isEnabled = false
                        }
                    } else {
                        for i in agreementArray {
                            i?.isSelected = true
                            CheckBox.tintColor = .black
                            CheckButton1.tintColor = .black
                            CheckButton2.tintColor = .black
                            CheckButton3.tintColor = .black
                            signupButton.isEnabled = true
                        }
                    }
//                } else {
//                    if agreementArray[sender.tag]!.isSelected {
//                        agreementArray[sender.tag]!.isSelected = false
//                    } else {
//                        agreementArray[sender.tag]!.isSelected = true
//                    }
//                }
                } else {
                    agreementArray[sender.tag]!.isSelected = agreementArray[sender.tag]!.isSelected ? false : true
                }
    }
    
    @IBAction func actSignUp(_ sender: UIButton) { //가입 버튼
        let alert = UIAlertController(title: "가입 완료", message: "가입이 완료되었습니다 *^^*", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true)
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

}
