//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


struct RockScissorsPaper {

    func playRockScissorsPaper(userChoice: Int) -> Void {
        let randomRockScissorsPaperChoice: Int = Int.random(in: 1...3)
        let criterion: Int = (userChoice - randomRockScissorsPaperChoice) % 3
        if criterion == 1 {
            print("이겼습니다!")
        } else if criterion == 2 {
            print("졌습니다!")
        } else {
            print("비겼습니다!")
            startGame()
        }
    }

    func decideGameOption(convertedUserSelection: Int) -> Void {
        if [1,2,3].contains(convertedUserSelection) {
            //게임진행
            //playRockScissorsPaper(userChoice: Int)
        }
        // 0이면 게임종료.
    }

    func checkValidUserSelection(userSelection: String) -> Bool {
        if let selection = Int(userSelection) {
            if (0...3).contains(selection) {
                return true
            }
        }
        return false
    }

    func convertUserSelection(userSelection: String) -> Int {
        if let convertedUserSelection: Int = Int(userSelection) {
            return convertedUserSelection
        }
        return -1
    }
    
    func getUserSelection() -> Void {
        //게임입력메세지 출력
        // userSelection을 String으로 바꿔서 아래 if문에 대입
        if let userSelection: String = readLine() {
            if checkValidUserSelection(userSelection: userSelection) {
                let convertedUserSelection: Int = convertUserSelection(userSelection: userSelection)
                decideGameOption(convertedUserSelection: convertedUserSelection)
            }else {
                //잘못된 입력 메세지 출력
                //startGame()
            }
        }
    }

    func startGame() {
        getUserSelection()
    }
}
