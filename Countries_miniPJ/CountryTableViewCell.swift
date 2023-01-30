//
//  CountryTableViewCell.swift
//  Countries_miniPJ
//
//  Created by 이선영 on 2023/01/30.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.layer.borderWidth = 1 //선택 테두리 선 굵기
            contentView.layer.borderColor = UIColor.darkGray.cgColor
            contentView.layer.backgroundColor = UIColor.clear.cgColor //백그라운드 색상
        } else {
            contentView.layer.cornerRadius = 15 //라운드
            contentView.layer.backgroundColor = UIColor.clear.cgColor //백그라운드 색상
            contentView.layer.borderWidth = 1 //미선택 테두리 선 굵기
            contentView.layer.borderColor = UIColor.darkGray.cgColor
        }
    }

}
