//
//  CummunityTableViewCell.swift
//  Countries_miniPJ
//
//  Created by 이선영 on 2023/01/30.
//

import UIKit

class CummunityTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
