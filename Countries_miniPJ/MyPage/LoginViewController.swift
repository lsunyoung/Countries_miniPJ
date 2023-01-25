//
//  LoginViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    var lblLogin:UILabel?
    var lblMy:UILabel?
    var lblID:UILabel?
    var logoutButton:UIButton?

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
        textField1.placeholder = "아이디"
        textField2.placeholder = "비밀번호"
        
        ButtonEnable()
        setPasswordShowButton()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //키보드 내림
    }
    
    private func ButtonEnable() { //필드 입력 시 로그인 버튼 enable
        self.textField1.addAction(UIAction(handler: { _ in
            if self.textField1.text?.isEmpty == true {
                self.LoginButton.isEnabled = false
            } else {
                self.LoginButton.isEnabled = true
            }
        }), for: .editingChanged)
    }
    private func setPasswordShowButton() {
        eyeButton = UIButton.init(primaryAction: UIAction(handler: {[self]_ in
            textField2.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }))
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.imagePadding = 5
        buttonConfig.baseBackgroundColor = .clear
        buttonConfig.baseForegroundColor = .darkGray
        
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        self.eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        self.eyeButton.configuration = buttonConfig
        
        self.textField2.rightView = eyeButton
        self.textField2.rightViewMode = .always
    }
    
    @IBAction func actLoginButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        if let lblLogin = lblLogin {
            lblLogin.text = "이선영님 안녕하세요:)"
        }
        if let lblID = lblID {
            lblID.text = textField1.text
        }
        if let lblMy = lblMy {
            lblMy.text = "내정보"
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
