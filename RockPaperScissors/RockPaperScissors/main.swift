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

func 숫자에따라다른반응() {
//    숫자가 0일때 -
//    숫자가 1일때 -
//    숫자가 2일때 -
//    숫자가 3일때 -
//    숫자가 기타일때 -
}

func 배열만들기() {
    //[컴퓨터가 만든 수, 사용자 입력 수]를 배열로 만드는 함수
}

func 배열에따라조건으로결과값나누기() {
//    승리하는 경우 -> 이겼습니다.
//    패배하는 경우 -> 졌습니다.
//    비기는 경우 -> 비겼습니다. -> 재시작
}







// 가위(1) -> 바위(2)
// 바위(2)  -> 보(3)
// 보(3) -> 가위(1)

// 숫자로만 생각하지 않고 sting으로 표현할 수 있지 않을까?
// 조합을 표현해서 -> Array, Dictionary, Set
