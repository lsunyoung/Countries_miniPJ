//
//  MyPageData.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/11/02.
//

import Foundation
import UIKit

//struct POSTS {
//    var text: String
//    var image: String
//}
//
//var posts:[POSTS] = [
//    POSTS(text:"유럽",image: "abc")
//]

func docUrlFileName(_ fileName:String)->URL{
    let fileManager = FileManager.default
    let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let docUrl = paths[0]
    let fileUrl = docUrl.appendingPathComponent("sample.png") //IOS15
//    let fileUrl = docUrl.appending(component: fileName) //IOS16
    return fileUrl
}


func getFilePath(fileName:String)->String{
    // 복사할 파일 경로
    let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let docPath = docDir[0] as NSString        //복사할 파일 이름
    let targetPath = docPath.appendingPathComponent("post.plist")
    return targetPath
}
func saveImageWithUrl(_ url:URL, image:UIImage?, quality:CGFloat = 0.5) throws{
    if let image = image, let data = image.jpegData(compressionQuality: quality){
        do {
            try data.write(to: url)
        } catch {
            throw error
            //print("저장 실패")
        }
    }
}

func makeAlertWithOneAction(title:String?, message:String?, actionTitle:String="확인", actionStyle:UIAlertAction.Style = .default) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: actionTitle, style: actionStyle)
    alert.addAction(action)
    return alert
}
func copyFile(_ org:String, to:String){
    let fileManager = FileManager.default
    // targetPath에 파일이 없을때만 복사
    if !fileManager.fileExists(atPath: to) {
        do{
            try fileManager.copyItem(atPath: org, toPath: to)
        } catch {
            print("복사하는데 실패했습니다.")
        }
    }
}
