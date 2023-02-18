//
//  CommentViewController.swift
//  Countries_miniPJ
//
//  Created by 이선영 on 2023/02/12.
//

import UIKit

class CommentViewController: UIViewController, UISheetPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    @objc func handleTap(sender: UITapGestureRecognizer) { //화면 터치 시 키보드 내림
        if sender.state == .ended {
            view.endEditing(true)
        }
        sender.cancelsTouchesInView = false
    }
    @objc public func presentModalBtnTap() {
            
            let vc = UIViewController()
            vc.view.backgroundColor = .systemYellow
            
            vc.modalPresentationStyle = .pageSheet
            
            if let sheet = vc.sheetPresentationController {
                
                //지원할 크기 지정
                sheet.detents = [.medium(), .large()]
                //크기 변하는거 감지
                sheet.delegate = self
               
                //시트 상단에 그래버 표시 (기본 값은 false)
                sheet.prefersGrabberVisible = true
                
                //처음 크기 지정 (기본 값은 가장 작은 크기)
                //sheet.selectedDetentIdentifier = .large
                
                //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
                //sheet.largestUndimmedDetentIdentifier = .medium
            }
            present(vc, animated: true, completion: nil)
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
