//
//  CummunityTableViewCell.swift
//  Countries_miniPJ
//
//  Created by 이선영 on 2023/01/30.
//

import UIKit

class CummunityTableViewCell: UITableViewCell, UISheetPresentationControllerDelegate {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        commentButton.addTarget(self, action: #selector(presentModalBtnTap), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            if selected {
                contentView.layer.borderWidth = 15 //선택 테두리 선 굵기
                contentView.layer.borderColor = UIColor.systemGray4.cgColor
                contentView.layer.backgroundColor = UIColor.systemGray4.cgColor //백그라운드 색상
            } else {
                contentView.layer.cornerRadius = 40 //라운드
                contentView.layer.backgroundColor = UIColor.systemGray5.cgColor //백그라운드 색상
                contentView.layer.borderWidth = 15 //미선택 테두리 선 굵기
                contentView.layer.borderColor = UIColor.white.cgColor
            }
    }
//    @objc private func presentModalBtnTap() {
//            
//            let vc = UIViewController()
//            vc.view.backgroundColor = .systemYellow
//            
//            vc.modalPresentationStyle = .pageSheet
//            
//            if let sheet = vc.sheetPresentationController {
//                
//                //지원할 크기 지정
//                sheet.detents = [.medium(), .large()]
//                //크기 변하는거 감지
//                sheet.delegate = self
//               
//                //시트 상단에 그래버 표시 (기본 값은 false)
//                sheet.prefersGrabberVisible = true
//                
//                //처음 크기 지정 (기본 값은 가장 작은 크기)
//                //sheet.selectedDetentIdentifier = .large
//                
//                //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
//                //sheet.largestUndimmedDetentIdentifier = .medium
//            }
//            
//            present(vc, animated: true, completion: nil)
//        }
//    @IBAction func actShare(_ sender: Any) {
//        let alert = UIAlertController(title: "공유", message: "\n\n\n\n\n", preferredStyle: .actionSheet)
//        let action1 = UIAlertAction(title: "취소", style: .cancel) { _ in
//        }
//        alert.addAction(action1)
//        kakaoButton?.frame = CGRect(x: 70, y: 60, width: 50, height: 50)
//        alert.view.addSubview(kakaoButton)
//        facebookButton?.frame = CGRect(x: 160, y: 60, width: 50, height: 50)
//        alert.view.addSubview(facebookButton)
//        snsButton?.frame = CGRect(x: 250, y: 60, width: 50, height: 50)
//        alert.view.addSubview(snsButton)
//
//        present(alert, animated: true)
//    }
}
extension CummunityTableViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}
