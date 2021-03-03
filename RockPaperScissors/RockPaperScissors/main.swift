//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


struct RockScissorsPaper {
    
    private func playRockScissorsPaper(with userChoice: Int) {
        let randomRockScissorsPaperChoice: Int = Int.random(in: 1...3)
        let criterion: Int = (userChoice - randomRockScissorsPaperChoice + 3) % 3
        if criterion == 1 {
            print("이겼습니다!")
        } else if criterion == 2 {
            print("졌습니다!")
        } else {
            print("비겼습니다!")
            startGame()
        }
    }
    
    private func decideGameOption(with convertedUserSelection: Int) {
        if (1...3).contains(convertedUserSelection) {
            playRockScissorsPaper(with: convertedUserSelection)
        }
    }
    
    private func checkValidation(_ userSelection: String) -> Bool {
        if let selection = Int(userSelection) {
            if (0...3).contains(selection) {
                return true
            }
        }
        return false
    }
    
    private func convert(_ userSelection: String) -> Int {
        if let convertedUserSelection: Int = Int(userSelection) {
            return convertedUserSelection
        } else {
            let notIntError: Int = -1
            return notIntError
        }
    }
    
    private func restartGame() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
    
    private func getUserSelection() {
        if let userSelection = readLine() {
            if checkValidation(userSelection) {
                let convertedUserSelection: Int = convert(userSelection)
                decideGameOption(with: convertedUserSelection)
            } else {
                restartGame()
            }
        }
        }
    
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator: "")
        getUserSelection()
    }
}

let newGame = RockScissorsPaper()
newGame.startGame()
