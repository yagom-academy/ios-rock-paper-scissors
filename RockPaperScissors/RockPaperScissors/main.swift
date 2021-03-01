//
//  RockPaperScissors - main.swift
//  Created by Coda & Tak
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var randomNumber: Int = 0

print("가위(1), 바위(2), 보(3)! <종료: 0> : ")

func makeRandomNumber() {
    randomNumber = Int.random(in: 1...3)
}
/*
makeRandomNumber()
print(randomNumber)
*/

func inputPlayerNumber() {
    let storage: String? = readLine()
    guard let pocket: String = storage else { return }
    guard let inputNumber = Int(pocket) else { return }
    print(inputNumber) // 확인차
}
inputPlayerNumber()

// 가위(1) -> 바위(2)
// 바위(2)  -> 보(3)
// 보(3) -> 가위(1)

// 숫자로만 생각하지 않고 sting으로 표현할 수 있지 않을까?
// 조합을 표현해서 -> Array, Dictionary, Set
