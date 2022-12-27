//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/26.
//

import Foundation

class RockPaperScissors {
    enum Menu: Int {
        case end = 0
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    func startGame() {
        displayMenu()
        
        let userChoice = readInput()
        let computerChoice = generateRockPaperScissors()
        var winner: String = ""
        
        switch userChoice {
        case .success(let selectedUserNumber):
            winner = decideWinner(user: selectedUserNumber, computer: computerChoice)
        case .failure(let error):
            print(error.rawValue)
            startGame()
        }
        
        if winner == "사용자" {
            print("이겼습니다!")
        } else if winner == "컴퓨터" {
            print("졌습니다!")
        } else if winner == "무승부"{
            print("비겼습니다!")
            startGame()
        }
    }
    
    private func displayMenu() {
        let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        print(menuMessage, terminator: " ")
    }
    
    private func readInput() -> Result<Menu, InputError> {
        guard let input = readLine() else {
            return .failure(.invalidInput)
        }
        guard let number = Int(input) else {
            return .failure(.invalidInput)
        }
        
        switch number {
        case Menu.end.rawValue:
            return .success(.end)
        case Menu.scissors.rawValue:
            return .success(.scissors)
        case Menu.rock.rawValue:
            return .success(.rock)
        case Menu.paper.rawValue:
            return .success(.paper)
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
}
