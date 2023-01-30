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

}
