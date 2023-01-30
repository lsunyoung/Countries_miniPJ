//
//  MyHeart.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/20.
//

import UIKit

class MyHeart: UIButton {

    /// 하트 이미지
    var checkBoxResouces = OnOffResources(
        onImage: UIImage(systemName: "heart.fill"),
        offImage: UIImage(systemName: "heart")
    ) {
        didSet {
            self.setChecked(isChecked)
        }
    }
    
    /// 체크 상태 변경
    var isChecked: Bool = false {
        didSet {
            guard isChecked != oldValue else { return }
            self.setChecked(isChecked)
        }
    }
    
    /// 이미지 직접 지정 + init
    init(resources: OnOffResources) {
        super.init(frame: .zero)
        self.checkBoxResouces = resources
        commonInit()
    }
    
    /// 일반적인 init + checkBoxResources 변경
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.setImage(checkBoxResouces.offImage, for: .normal)
        
        self.addTarget(self, action: #selector(check), for: .touchUpInside)
        self.isChecked = false
    }
    
    @objc func check(_ sender: UIGestureRecognizer) {
        isChecked.toggle()
    }
    
    /// 이미지 변경
    private func setChecked(_ isChecked: Bool) {
        if isChecked == true {
            self.setImage(checkBoxResouces.onImage, for: .normal)
        } else {
            self.setImage(checkBoxResouces.offImage, for: .normal)
        }
    }
    
    class OnOffResources {
        
        let onImage: UIImage?
        let offImage: UIImage?
        
        init(onImage: UIImage?, offImage: UIImage?) {
            self.onImage = onImage
            self.offImage = offImage
        }
    }
//    fileprivate func animate() {
//        //클릭 시 작게 - 크기 작게 1초 동안
//        UIView.animate(withDuration: 0.1, animations: { [weak self] in
//            guard let self = self else {return}
//            let newImage = self.isActivated ? self.activatedImage : self.normalImage
//            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
//            self.setImage(newImage, for: .normal)
//        }, completion: {_ in
//            //원래대로 복귀 - 크기 크게
//            UIView.animate(withDuration: 0.1, animations: {
//                self.transform = CGAffineTransform.identity
//            })
//        })
//    }
}
