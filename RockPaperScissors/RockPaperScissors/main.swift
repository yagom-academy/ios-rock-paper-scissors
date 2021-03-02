//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


struct RockScissorsPaper {
  
    private func playRockScissorsPaper(userChoice: Int) -> Void {
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
  
    private func decideGameOption(convertedUserSelection: Int) -> Void {
        if [1, 2, 3].contains(convertedUserSelection) {
            playRockScissorsPaper(userChoice: convertedUserSelection)
        }
    }
    
    private func checkValidUserSelection(userSelection: String) -> Bool {
        if let selection = Int(userSelection) {
            if (0...3).contains(selection) {
                return true
            }
        }
        return false
    }

    private func convertUserSelection(userSelection: String) -> Int {
        if let convertedUserSelection: Int = Int(userSelection) {
            return convertedUserSelection
        }
        return -1
    }
    
    private func getUserSelection() -> Void {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator: "")
        if let userSelection: String = readLine() {
            if checkValidUserSelection(userSelection: userSelection) {
                let convertedUserSelection: Int = convertUserSelection(userSelection: userSelection)
                decideGameOption(convertedUserSelection: convertedUserSelection)
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                startGame()
            }
        }
    }

    func startGame() {
        getUserSelection()
    }
}

let newGame: RockScissorsPaper = RockScissorsPaper()
newGame.startGame()
