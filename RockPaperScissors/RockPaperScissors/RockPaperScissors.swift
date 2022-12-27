//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/26.
//

import Foundation

class RockPaperScissors {
    let end = 0
    let scissors = 1
    let rock = 2
    let paper = 3
    
    var winner = ""
    var isFirst = true
    
    func verifyUserChoice(userChoice: Result<Int, InputError>, computerChoice: Int) {
        switch userChoice {
        case .success(let selectedUserNumber):
            self.winner = decideWinner(user: selectedUserNumber, computer: computerChoice)
        case .failure(let error):
            print(error.rawValue)
            startGame()
        }
    }
    
    func startGame() {
        displayRockPaperScissors()
        
        let userChoice = readInput()
        let computerChoice = generateRockPaperScissors()
        
        switch userChoice {
        case .success(let selectedUserNumber):
            self.winner = decideWinner(user: selectedUserNumber, computer: computerChoice)
        case .failure(let error):
            print(error.rawValue)
            startGame()
        }
        
        if winner == "사용자" {
            print("이겼습니다!")
            startMookZziPpa()
        } else if winner == "컴퓨터" {
            print("졌습니다!")
            startMookZziPpa()
        } else if winner == "무승부"{
            print("비겼습니다!")
            startGame()
        }
    }
    
    func startMookZziPpa() {
        calculateTurn(winner: winner)
        
        let userChoice = readInput()
        let computerChoice = generateRockPaperScissors()
        var mookZziPpaWinner = ""
        
        switch userChoice {
        case .success(let selectedUserNumber):
            mookZziPpaWinner = decideWinner(user: selectedUserNumber, computer: computerChoice)
        case .failure(let error):
            print(error.rawValue)
            startMookZziPpa()
        }
        
        if mookZziPpaWinner == "사용자" {
            self.winner = mookZziPpaWinner
            startMookZziPpa()
        } else if mookZziPpaWinner == "컴퓨터" {
            self.winner = mookZziPpaWinner
            startMookZziPpa()
        } else if mookZziPpaWinner == "무승부"{
            print("\(winner)의 승리!")
        }
    }
    
    private func displayRockPaperScissors() {
        let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func displayMookZziPpa(winner: String) {
        let menuMessage = "[\(winner)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func readInput() -> Result<Int, InputError> {
        guard let input = readLine() else {
            return .failure(.invalidInput)
        }
        guard let number = Int(input) else {
            return .failure(.invalidInput)
        }
        
        switch number {
        case end...paper:
            return .success(number)
        default:
            return .failure(.invalidInput)
        }
    }
    
    private func generateRockPaperScissors() -> Int {
        return Int.random(in: scissors...paper)
    }
    
    private func decideWinner(user: Int, computer: Int) -> String {
        if user > computer {
            if user == paper && computer == scissors {
                return "컴퓨터"
            } else {
                return "사용자"
            }
        } else if user < computer {
            if user == scissors && computer == paper {
                return "사용자"
            } else {
                return "컴퓨터"
            }
        }
        
        return "무승부"
    }
    
    func calculateTurn(winner: String) {
        if isFirst {
            isFirst = false
        } else {
            print("\(winner)의 턴입니다.")
        }
        displayMookZziPpa(winner: winner)
    }
    
}
