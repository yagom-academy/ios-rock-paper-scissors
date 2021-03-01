//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RockPaperScissors {
    // 가위바위보 게임의 상태값(프로퍼티)
    // 컴퓨터가 랜덤으로 생성한 가위바위보 번호를 저장하는 프로퍼티 (String 타입)
    // 사용자가 입력한 가위바위보 번호를 저장하는 프로퍼티 (String 타입)
    // 게임의 진행 상태를 저장하는 프로퍼티
    var comNumberValue = 0
    var userNumberValue = 0
    
    // 가위바위보 게임의 기능(메서드)
    // 1. 컴퓨터가 랜덤으로 1, 2, 3을 반환하는 기능
    // 2. 사용자의 가위바위보를 입력받는 기능
    func comNumberGenerator() -> Int {
        let numberGeneration = Int.random(in: 1...3)
        comNumberValue = numberGeneration
        return numberGeneration
    }
    
    func userInputNumber() -> Int {
        while true {
            guard let userInputText = readLine() else {
                continue
            }
            guard let userInputNumber = Int(userInputText) else {
                continue
            }
            
            switch userInputNumber {
            case 0:
                print("게임 종료")
                return 0
            case 1:
                print("가위")
                return 1
            case 2:
                print("바위")
                return 2
            case 3:
                print("보")
                return 3
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
    
    // 3. 1,2 메서드를 통해 게임 결과를 반환하는 기능
    // 4. 게임스타트 기능(잘못된 입력 처리)
}

