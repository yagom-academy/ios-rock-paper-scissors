//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class IOMachine{
    func readInt()->Int{
        guard let input:String = readLine() else {
            return -1
        }
        
        guard let int:Int = Int(input) else {
            return -1
        }
        
        return int
    }
}

class RPSMachine{
    private let ioMachine = IOMachine()
    
    private enum RPSState : Int{
        case continueGame = 1
        case endGame = 0
        case error = -1
    }
    
    private func vaildateWin(RPSType type:Int){
        
        let computerRPSType = Int.random(in: 1...3)
        
        guard type != computerRPSType else {
            print("비겼습니다")
            return
        }
        
        if  (type == 1 && computerRPSType == 2)
        ||  (type == 2 && computerRPSType == 3)
        ||  (type == 3 && computerRPSType == 1) {
            print("졌습니다")
        } else {
            print("이겼습니다")
        }
        
    }
    
    private func checkUserInput() -> RPSState {
        let watingMessage = "가위(1), 바위(2), 보(3)!<종료 : 0>"
        let errorMessage = "잘못된 입력입니다"
        
        print(watingMessage, terminator: " ")
        
        let userInput = ioMachine.readInt()
        
        guard 0...3 ~= userInput else {
            print(errorMessage)
            
            return RPSState.error
        }
        
        if userInput == 0  {
            return RPSState.endGame
        } else {
            self.vaildateWin(RPSType: userInput)
            
            return RPSState.continueGame
        }

    }
    
    func gameStart(){
        var isEnd = false
        
        while isEnd == false {
            isEnd = self.checkUserInput() == RPSState.endGame
        }
    }
}

RPSMachine().gameStart()

