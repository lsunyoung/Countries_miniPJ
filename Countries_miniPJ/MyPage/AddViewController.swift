//
//  AddViewController.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/02.
//

import UIKit
import PhotosUI

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var addimageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    var post:NSMutableArray?

    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "새게시물"
        textField.placeholder = "문구 입력..."

        picker.delegate = self

    }
    @IBAction func actImageAdd(_ sender: Any) {
//        picker.sourceType = .camera
//        present(picker, animated: true)
        let alert = UIAlertController(title: "선택", message: "선택해주세요.", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "카메라", style: .default) { _ in
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true)
        }
        let action2 = UIAlertAction(title: "사진", style: .default) { _ in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true)
        }
        let action3 = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true)
    }
    
    @IBAction func actSave(_ sender: Any) {
        if textField.text?.isEmpty == true {
            let alert = UIAlertController(title: "게시물 등록 실패", message: "문구를 입력해주세요.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)

            alert.addAction(action)
            present(alert, animated: true)
        }
        let alert = UIAlertController(title: "게시물 등록 안내", message: "등록하시겠습니까?", preferredStyle: .alert)
        let actioncheck = UIAlertAction(title: "확인", style: .default) { _ in
            let saveUrl = docUrlFileName("sample.png")
            guard let savedData = try? Data(contentsOf: saveUrl) else {return}
            let image = UIImage(data: savedData)
            self.addimageView.image = image
            if let text = self.textField.text/*, let images = self.addimageView.image*/ {
                let newPost = ["text":text, "image":"hiddenlake"] as [String : String]
                self.post?.add(newPost)
                self.post?.write(toFile: getFilePath(fileName: "post.plist"), atomically: true)
                
                let alert = UIAlertController(title: "게시물 등록 성공", message: "등록이 완료되었습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .default) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        }
        let actioncencle = UIAlertAction(title: "취소", style: .destructive)

        alert.addAction(actioncheck)
        alert.addAction(actioncencle)
        present(alert, animated: true)
        
    }
    @IBAction func actBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - Navigation

}
extension AddViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let library = info[.originalImage] as? UIImage else {return}
        addimageView.image = library
        picker.dismiss(animated: true)
        
        let saveUrl = docUrlFileName("sample.png")
        print(saveUrl)
        do {
            try saveImageWithUrl(saveUrl, image: addimageView.image, quality: 0.8)
        } catch {
            let alert = makeAlertWithOneAction(title: nil, message: "저장에 실패했습니다.")
            present(alert, animated: true)
            print("저장실패")
        }

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
