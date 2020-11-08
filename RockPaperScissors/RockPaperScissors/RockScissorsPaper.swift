//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by Kyungmin Lee on 2020/11/08.
//

import Foundation



/// 묵찌빠 클래스
class RockScissorsPaper {
    var gameTurn: GameTurn?
    var gameStatus: GameStatus = .scissorsRockPaper
    var gameResult: GameResult?
    var userHand: Hand?
    var computerHand: Hand?
    var scissorsRockPaper: ScissorsRockPaper = ScissorsRockPaper()
    
    
    enum GameStatus: Int {
        case scissorsRockPaper = 0
        case initializeGame
        case inputUser
        case inputComputer
        case decideResult
        case changeTurn
        case endGame
        case exitGame
        
        mutating func goToNextStatus() {
            guard let nextStatus = GameStatus(rawValue: self.rawValue + 1) else {
                return
            }
         
            self = nextStatus
        }
        
        mutating func goTo(status: GameStatus) {
            self = status
        }
    }
    
    func progress() {
        switch gameStatus {
        case .scissorsRockPaper:
            doScissorsRockPaper()
            gameStatus.goToNextStatus()
            
        case .initializeGame:
            //initializeGame()
            printGame()
            gameStatus.goToNextStatus()
            
        case .inputUser:
            if inputUser() == true {
                gameStatus.goToNextStatus()
            }
            
        case .inputComputer:
            inputComputer()
            gameStatus.goToNextStatus()
            
        case .decideResult:
            decideResult()
            printGame()
            if let gameResult = self.gameResult, gameResult == .draw {
                // 비겼으면 가위바위보로 턴 결정
                gameStatus.goTo(status: .changeTurn)
            } else {
                gameStatus.goTo(status: .endGame)
                printGame()
            }
        case .changeTurn:
            changeTurn()
            printGame()
            gameStatus.goTo(status: .initializeGame)
            
            
        default:
            break
        
        }
        
        
    }
    
    func printGame() {
        switch gameStatus {
        case .initializeGame:
            guard let gameTurn = self.gameTurn else {
                break
            }
            
            print("[\(gameTurn.rawValue)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0 > : ", terminator: "")
            
        case .changeTurn:
            guard let gameTurn = self.gameTurn else {
                break
            }
            print("\(gameTurn.rawValue)의 턴입니다.")
            
        case .endGame:
            guard let gameResult = self.gameResult else {
                break
            }
            
            var winner: String = ""
            if gameResult == .win {
                winner = "사용자"
            } else {
                winner = "컴퓨터"
            }
            print("\(winner)의 승리!")
            
        case .exitGame:
            print("게임 종료")
        default:
            break
        }
    }
    
    func doScissorsRockPaper() {
        while true {
            // 가위바위보 진행
            scissorsRockPaper.progress()
            
            if scissorsRockPaper.gameStatus == .endGame {
                // 가위바위보 끝났으면
                guard let scissorsRockPaperResult = scissorsRockPaper.gameResult else {
                    break
                }
                
                // 결과에 따라 턴 쥐기
                // - 비겼으면 다시 가위바위보 진행
                if scissorsRockPaperResult == .win {
                    gameTurn = .user
                    break
                } else if scissorsRockPaperResult == .lose {
                    gameTurn = .computer
                    break
                }
            } else if scissorsRockPaper.gameStatus == .exitGame {
                // 게임 종료 입력되면 바로 게임 종료
                gameStatus.goTo(status: .exitGame)
                break
            }
        }
    }
    
    
     
    /// 유저 입력
    /// return: 잘못된 입력이면 false
    func inputUser() -> Bool {
        
        guard let input = readLine(), let inputNumber = Int(input),inputNumber >= 0, inputNumber <= 3 else {
            
            // 잘못된 입력이면 컴퓨터 턴
            print("잘못된 입력입니다. 다시 시도해주세요.")
            gameTurn = .computer
            gameStatus.goTo(status: .initializeGame)
            return false
        }
        
        // 0입력시 바로 게임 종료
        guard inputNumber != 0 else {
            gameStatus.goTo(status: .exitGame)
            return true
        }
        
        userHand = Hand.rockScissorsPaper(number: inputNumber)
        return true
    }
    
    func inputComputer() {
        computerHand = Hand.rockScissorsPaper(number: Int.random(in: 1...3))
    }
    
    func decideResult() {
        guard let userHand = self.userHand, let computerHand = self.computerHand, let gameTurn = self.gameTurn else {
            return
        }
        
        gameResult = userHand.decideRockScissorsPaperResult(otherHand: computerHand, gameTurn: gameTurn)
        
        // 디버깅용
        print("나:\(userHand) vs \(computerHand):컴퓨터")
    }
    
    /// 가위바위보 결과로 턴 결정
    /// - 묵찌빠 결과 비겼으면(서로 다른거 내서 승패 안났으면) 가위바위보 이긴쪽이 턴을 쥠
    func changeTurn() {
        guard let userHand = self.userHand, let computerHand = self.computerHand else {
            return
        }
        
        let scissorsRockPaperResult = userHand.decideScissorsRockPaperResult(otherHand: computerHand)
        
        if scissorsRockPaperResult == .win {
            self.gameTurn = .user
        }
        
        gameTurn = (scissorsRockPaperResult == .win) ? .user : .computer
    }
}
