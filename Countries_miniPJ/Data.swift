//
//  Data.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/26.
//

import Foundation
////JSON
struct Countries:Codable {
    let alarm_lvl:Int
    let continent_cd:String
    let continent_eng_nm:String
    let continent_nm:String
    let country_eng_nm:String
    let country_iso_alp2:String
    let country_nm:String
    let dang_map_download_url:String
    let flag_download_url:String
    let map_download_url:String
    let region_ty:String
    let remark:String
    let written_dt:String
}
struct Meta:Codable {
    let numOfRows:Int
    let pageNo:Int
    let resultCode:Int
    let resultMsg:String
    let totalCount:Int
}

struct ResultData:Codable {
    let meta:Meta
    let documents:[Countries]
}


////XML
enum TagType {
    case basic
    case continent
    case countryEnName
    case countryName
    case id
    case imgUrl
    case wrtDt
    case numOfRows
    case none
}

struct item {
    var basic:String
    var continent:String
    var countryEnName:String
    var countryName:String
    var id:String
    var imgUrl:String
    var wrtDt:String
    var numOfRows:Int


    init() {
        basic = ""
        continent = ""
        countryEnName = ""
        countryName = ""
        id = ""
        imgUrl = ""
        wrtDt = ""
        numOfRows = 0
    }
}
let flags = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20","21", "22", "23", "24", "25", "26", "27", "28", "29", "30","31", "32", "33", "34", "35", "36", "37", "38", "39", "40",]


