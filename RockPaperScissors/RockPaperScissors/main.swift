//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


struct RockScissorsPaper {

    func playRockScissorsPaper(userChoice: Int) -> Void {
        let randomRockScissorsPaperChoice: Int = Int.random(in: 1...3)
    }

    func decideGameOption(convertedUserSelection: Int) -> Void {
        if [1,2,3].contains(convertedUserSelection) {
            //게임진행
            //playRockScissorsPaper(userChoice: Int)
        }
        // 0이면 게임종료.
    }

    func checkValidUserSelection(userSelection: String?) -> Bool {
        //userSelection 옵셔널바인딩
        //userSelection이 0...3 -> true 아니면 false
        return true
    }

    //유저입력
    func getUserSelection() -> Void {
        //게임입력메세지 출력
        let userSelection: String? = readLine()
        if checkValidUserSelection(userSelection: userSelection) {
            //convertedUserSelection: userSelection Int형으로 변환
            decideGameOption(convertedUserSelection: 1)
        }else {
            //잘못된 입력 메세지 출력
            //startGame()
        }
    }

    func startGame() {
        getUserSelection()
    }
}
