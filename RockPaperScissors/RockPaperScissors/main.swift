//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


struct RockScissorsPaper {
    
    func playRockScissorsPaper(userChoice: Int) -> Void {
        //랜덤변수 생성
        //유저 승
            //"이겼습니다"출력
        //유저 패
            //"졌습니다"출력
        //무승부
            //"비겼습니다"출력
            //startGame()
    }
    
    func decideGameOption(convertedUserSelection: Int) -> Void {
        if [1,2,3].contains(convertedUserSelection) {
            playRockScissorsPaper(userChoice: convertedUserSelection)
        }
    }
    
    func checkValidUserSelection(userSelection: String) -> Bool {
        //userSelection 옵셔널바인딩
        //userSelection이 0...3 -> true 아니면 false
        return true
    }
    
    
    //유저입력
    func getUserSelection() -> Void {
        //게임입력메세지 출력
        print("가위(1), 바위(2), 보(3)! <종료>")
        if let userSelection: String = readLine() {
            if checkValidUserSelection(userSelection: userSelection) {
            }else {
                print("잘못된 입력입니다. 다시 시도해주세요")
                startGame()
            }
        }
    }
    
    func startGame() {
        //입력받기 getUserSelection()
        getUserSelection()
    }
}
