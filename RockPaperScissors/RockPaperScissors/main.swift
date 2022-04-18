//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func inputMenu() -> String {
    let userInput = readLine()
    print(userInput)
    guard let menuNumber = userInput  else { return "asdfsf" }  // 질문: 아무것도 입력을 안했을 때else 안의 return값이 안나오고 optional("")이 나오는 이유
    return menuNumber
}

printMenu()
inputMenu()
