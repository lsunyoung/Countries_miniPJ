//
//  LoginViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/02.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var lblLogin:UILabel?
    var lblID:UILabel?
    var logoutButton:UIButton?
    var MyButton:UIButton?

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var LoginButton: UIButton! {
        didSet {
            LoginButton.isEnabled = false
        }
    }
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var GuestButton: UIButton!
    
    var eyeButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField()
        
        ButtonEnable()
        setPasswordShowButton()
        textField1.delegate = self
        textField2.delegate = self
    }
    func textField() {
        textField1.placeholder = "아이디"
        textField2.placeholder = "비밀번호"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //화면 터치 시 키보드 내림
    }
    func textFieldReturn(_textField: UITextField) -> Bool { //수정해야함
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        return true
    }
    private func ButtonEnable() { //필드 입력 시 로그인 버튼 enable
        self.textField1.addAction(UIAction(handler: { _ in
            if (self.textField1.text?.isEmpty == true) && (self.textField2.text?.isEmpty == true) {
                self.LoginButton.isEnabled = false
            } else {
                self.LoginButton.isEnabled = true
            }
        }), for: .editingChanged)
    }
    private func setPasswordShowButton() { //비밀번호 *표시
        textField2.isSecureTextEntry = true
        eyeButton = UIButton.init(primaryAction: UIAction(handler: {[self]_ in
            textField2.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }))
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.imagePadding = 5
        buttonConfig.baseBackgroundColor = .clear
        buttonConfig.baseForegroundColor = .darkGray
        
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal) //선택 없을 때
        eyeButton.setImage(UIImage(systemName: "eye"), for: .selected) //선택 했을 때
        eyeButton.configuration = buttonConfig
        
        textField2.rightView = eyeButton
        textField2.rightViewMode = .always
    }
    
    @IBAction func actLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        if let lblLogin = lblLogin {
            lblLogin.text = "이선영님 안녕하세요 :)"
        }
        if let lblID = lblID {
            lblID.text = textField1.text
        }
        if let MyButton = MyButton {
            MyButton.setTitle(" 내정보", for: .normal)
            MyButton.setTitleColor(.white, for: .normal)
            MyButton.backgroundColor = UIColor.darkGray
            MyButton.setImage(UIImage(systemName: "person"), for: .normal)
        }
        if let logoutButton = logoutButton {
            logoutButton.setTitle("로그아웃", for: .normal)
            logoutButton.setTitleColor(.white, for: .normal)
            logoutButton.backgroundColor = UIColor.darkGray
        }
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
