//
//  AirData.swift
//  Countries_miniPJ
//
//  Created by lsy on 2022/10/28.
//

import Foundation

//let a = ["2022년" , "2023년", "2024년", "2025년", "2026년", "2028년", "2029년", "2030년" ]
//let b = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
//let c = ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일", "15일", "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일", "26일", "27일", "28일", "29일", "30일", "31일"]

let person = ["1명","2명","3명","4명"]


//let aa = ["제주","부산","김포","청주"]
//let bb = ["도쿄","오사카","후쿠오카","삿포로","오키나와","나고야"]
//let cc = ["다낭","방콕","세부","싱가포르","코타키나발루","나트랑/캄란","호치민","대만/타오위안","치앙마이","올란바토르","하노이","푸켓"]
//let dd = ["하와이/호놀룰루","로스앤젤레스","뉴욕","샌프라시스코","라스베가스","댈러스","밴쿠버","토론토"]
//let ee = ["파리","런던","로마","바르셀로나","프랑크푸르트","프라하","암스테르담","이스탄불"]
//let ff = ["괌","사이판","시드니","멜버른"]


struct Nation {
    let name:String
}
let nations:[String:[Nation]] = [
    "국내":[
        Nation(name: "제주"),
        Nation(name: "부산"),
        Nation(name: "김포"),
        Nation(name: "인천"),
        Nation(name: "청주")
    ],
    "일본":[
        Nation(name: "도쿄"),
        Nation(name: "오사카"),
        Nation(name: "후쿠오카"),
        Nation(name: "삿포로"),
        Nation(name: "오키나와"),
        Nation(name: "나고야")
    ],
    "아시아":[
        Nation(name: "다낭"),
        Nation(name: "방콕"),
        Nation(name: "세부"),
        Nation(name: "싱가포르"),
        Nation(name: "코타기나발루"),
        Nation(name: "나트랑/캄란"),
        Nation(name: "호치민"),
        Nation(name: "대만/타오위안"),
        Nation(name: "차앙마이"),
        Nation(name: "올란바토르"),
        Nation(name: "하노이"),
        Nation(name: "푸켓")
    ],
    "미주":[
        Nation(name: "하와이/호놀룰루"),
        Nation(name: "로스엔젤레스"),
        Nation(name: "뉴욕"),
        Nation(name: "샌프란시스코"),
        Nation(name: "라스베가스"),
        Nation(name: "댈러스"),
        Nation(name: "벤쿠버"),
        Nation(name: "토론토")
    ],
    "유럽":[
        Nation(name: "파리"),
        Nation(name: "런던"),
        Nation(name: "로마"),
        Nation(name: "바르셀로나"),
        Nation(name: "프랑크푸르트"),
        Nation(name: "프라하"),
        Nation(name: "암스테르담"),
        Nation(name: "이스탄불")
    ],
    "대양주":[
        Nation(name: "괌"),
        Nation(name: "사이판"),
        Nation(name: "시드니"),
        Nation(name: "멜버른")
    ]
]

//["charleyrivers","chilkoottrail","chincoteague","hiddenlake","icybay","lakemcdonald","rainbowlake","silversalmoncreek","stmarylake","turtlerock","twinlake","umbagog"]
