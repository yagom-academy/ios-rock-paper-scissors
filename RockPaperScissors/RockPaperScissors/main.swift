//
//  RockPaperScissors - main.swift
//  Created by Coda & Tak
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

var inputNumber: Int = 0
var randomNumber: Int = 0
var storageOfComputerAndUserNumber: Array<Int> = []

print("가위(1), 바위(2), 보(3)! <종료: 0> : ")

func makeRandomNumber() {
    randomNumber = Int.random(in: 1...3)
}
makeRandomNumber()

func inputPlayersNumber() {
    let storage: String? = readLine()
    guard let pocket: String = storage else { return }
    guard let a = Int(pocket) else { return }
    inputNumber = a
}
inputPlayersNumber()

func makeArrayOrReturn() {
    if inputNumber == 0 {
        return
    } else if inputNumber == 1 || inputNumber == 2 || inputNumber == 3 {
        배열만들기()
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        // 최초상태로 복귀
    }
}
makeArrayOrReturn()

func 배열만들기() {
    storageOfComputerAndUserNumber.append(randomNumber)
    storageOfComputerAndUserNumber.append(inputNumber)
    print(storageOfComputerAndUserNumber)
    //[컴퓨터가 만든 수, 사용자 입력 수]를 배열로 만드는 함수
    }

func 배열에따라조건으로결과값나누기() {
    if storageOfComputerAndUserNumber == [1,2] || storageOfComputerAndUserNumber == [2,3] || storageOfComputerAndUserNumber == [3,1] {
        print("이겼습니다!")
        return
    } else if storageOfComputerAndUserNumber == [2,1] ||
                storageOfComputerAndUserNumber == [3,2] || storageOfComputerAndUserNumber == [1,3] {
        print("졌습니다!")
        return
    } else if randomNumber == inputNumber {
        print("비겼습니다!")
        // 최초상태로 복귀
    }
//    승리하는 경우 -> 이겼습니다.
//    패배하는 경우 -> 졌습니다.
//    비기는 경우 -> 비겼습니다. -> 재시작
}
배열에따라조건으로결과값나누기()






// 가위(1) -> 바위(2)
// 바위(2)  -> 보(3)
// 보(3) -> 가위(1)

// 숫자로만 생각하지 않고 sting으로 표현할 수 있지 않을까?
// 조합을 표현해서 -> Array, Dictionary, Set
