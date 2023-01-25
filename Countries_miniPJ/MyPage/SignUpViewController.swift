//
//  SignUpViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/19.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var IDTextfield: UITextField!
    @IBOutlet weak var PWTextfield: UITextField!
    @IBOutlet weak var RPWTextfield: UITextField!
    @IBOutlet weak var NameTextfield: UITextField!
    @IBOutlet weak var NickTextfield: UITextField!
    @IBOutlet weak var BirthTextfield: UITextField!
    @IBOutlet weak var signupButton: UIButton! {
        didSet {
            signupButton.isEnabled = false
        }
    }
    @IBOutlet weak var chackBox: SignUpCheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IDTextfield.placeholder = "아이디 입력"
        PWTextfield.placeholder = "비밀번호 입력"
        RPWTextfield.placeholder = "비밀번호 재입력"
        NameTextfield.placeholder = "이름 입력"
        NickTextfield.placeholder = "닉네임 입력"
        BirthTextfield.placeholder = "생년월일 입력"
        ButtonEnable()
    }
    private func ButtonEnable() { //필드 입력 시 로그인 버튼 enable
        self.IDTextfield.addAction(UIAction(handler: { _ in
            if self.IDTextfield.text?.isEmpty == true {
                self.signupButton.isEnabled = false
            } else {
                self.signupButton.isEnabled = true
            }
        }), for: .editingChanged)
    }
    
    @IBAction func actOverlab(_ sender: Any) {
        let alert = UIAlertController(title: "중복 확인", message: "사용 가능합니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    
    @IBAction func actSignUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
