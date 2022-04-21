//
//  StartGame.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/19.
//
import Foundation

struct RockScissorsPaperGame: Game {
    
  // MARK: - 프린트 함수 모음
    
    func printRockScissorsPaperMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    func printInvalidResult() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    func printEndGame() {
        print("게임 종료")
    }
    
    //MARK: - 가위 바위 보 게임 
    
    private enum Numbers {
        static let range = 1...3
    }
    
    func startGame() {
        printRockScissorsPaperMenu()
        let userChoiceNumber = inputNumber()
        
        switch userChoiceNumber {
        case 0:
            printEndGame()
        case 1,2,3:
            guard let userInput = makeUserSign(userInput: userChoiceNumber) else { return }
            guard let computerInput = makeComputerSign() else { return }
            
            let result = decideRockScissorsPaperResult(userSign: userInput, computerSign: computerInput)
            printResult(of: result)
        default:
            printInvalidResult()
            startGame()
        }
    }
    
    func makeUserSign(userInput: Int) -> RockScissorsPaper? {
        let userSign = RockScissorsPaper(rawValue: userInput)
        return userSign
    }
    
    func makeComputerSign() -> RockScissorsPaper? {
        let randomNumber = Int.random(in: Numbers.range)
        let computerRandomSign = RockScissorsPaper(rawValue: randomNumber)
        return computerRandomSign
    }
    
    func printResult(of result: GameResult) {
        print(result.message)
        
        switch result {
        case .win, .lose:
            printEndGame()
        case .draw:
            startGame()
        }
    }
}

