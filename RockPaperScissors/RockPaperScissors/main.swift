//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


func playRockPaperScissors(){
    var a = true
    let input: String?
    while a {
        printRockPaperScissors()
        input = receiveInput()
        a = func()
    }
}

// 입력을 받아서
// 123 -> 할당
// 0 -> 전체 프로그램 종료
// 그 외 -> 입력받는 함수 재실행

//func 1230 () {
//
//}
//
//func 123 / 0 {
//
//}

func receiveInput() -> String? {
    guard let input = readLine() else { return nil }
    
    return input
}

func printRockPaperScissors(){
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}





//func playMukChiPa(){}
