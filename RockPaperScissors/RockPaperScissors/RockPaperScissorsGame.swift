//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//
class RockPaperScissorsGame {
    
    enum turn: String {
        case player = "사용자"
        case computer = "컴퓨터"
    }
    
    var scissors: String = RockPaperSciccorsCondition.scissors.choiceRockPaperScissors
    var rock: String = RockPaperSciccorsCondition.rock.choiceRockPaperScissors
    var paper: String = RockPaperSciccorsCondition.paper.choiceRockPaperScissors
    var end: String = RockPaperSciccorsCondition.end.choiceRockPaperScissors
    
    func startGame() {
        gameResult()
    }
    
    func inputUserNumber() -> String {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        guard let userInput = readLine() else { return "" }
        return userInput
    }
    
    func choiceRockPaperScissors() -> String {
        let numberList: [String] = ["1", "2", "3"]
        guard let choicedCase = numberList.randomElement() else {
            return ""
        }
        return choicedCase
    }
    
    func gameResult() {
        let userNumber: String = inputUserNumber()
        let computerNumber: String = choiceRockPaperScissors()
        
        print(userNumber, computerNumber)
        if userNumber == computerNumber {
            print("비겼습니다...")
            startGame()
            
        } else if userNumber == "3" && computerNumber == "1" {
            print("졌습니다...")
            MukjjibbaGame(winner: .player).startGame()
            startGame()
            
        } else if userNumber > computerNumber {
            print("이겼습니다...")
            MukjjibbaGame(winner: .player).startGame()
            startGame()

        } else if userNumber == "1" && computerNumber == "3" {
            print("이겼습니다...")
            MukjjibbaGame(winner: .player).startGame()
            startGame()
            
        } else if userNumber < computerNumber{
            print("졌습니다...")
            MukjjibbaGame(winner: .computer).startGame()
            startGame()
        }
    }
}
