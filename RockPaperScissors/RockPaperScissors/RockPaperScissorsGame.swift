//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//
struct RockPaperScissorsGame {
    
    enum RockPaperSciccorsCondition: String {
        case scissors = "1"
        case rock = "2"
        case paper = "3"
        case end = "0"
    }
    
    var scissors: String = RockPaperSciccorsCondition.scissors.rawValue
    var rock: String = RockPaperSciccorsCondition.rock.rawValue
    var paper: String = RockPaperSciccorsCondition.paper.rawValue
    var end: String = RockPaperSciccorsCondition.end.rawValue
    
    func startGame() {
        let userNumber = inputUserNumber()
        let randomNumber = choiceRockPaperScissors()
        
        switch userNumber {
        case scissors:
            makeToChoiceScissors(randomNumber)
            break
        case rock:
            makeToChoiceRock(randomNumber)
            break
        case paper:
            makeToChoicePaper(randomNumber)
            break
        case end:
            print("게임 종료")
            break
        default:
            print("잘못된 입력입니다. 다시 시도해 주세요.")
            startGame()
        }
    }
    
    private func inputUserNumber() -> String {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        guard let userInput = readLine() else { return "" }
        return userInput
    }
    
    private func choiceRockPaperScissors() -> String {
        let numberList: [String] = ["1", "2", "3"]
        guard let choicedCase = numberList.randomElement() else {
            return ""
        }
        return choicedCase
    }
    
    private func makeToChoicePaper(_ comparedNumber: String) {
        switch comparedNumber {
        case scissors:
            print("졌습니다!")
            print("게임 종료")
        case rock:
            print("이겼습니다!")
            print("게임 종료")
        case paper:
            print("비겼습니다!")
            startGame()
        default:
            break
        }
    }
    
    private func makeToChoiceScissors(_ comparedNumber: String) {
        switch comparedNumber {
        case scissors:
            print("비겼습니다!")
            startGame()
        case rock:
            print("졌습니다!")
            print("게임 종료")
        case paper:
            print("이겼습니다!")
            print("게임 종료")
        default:
            break
        }
    }
    
    private func makeToChoiceRock(_ comparedNumber: String) {
        switch comparedNumber {
        case scissors:
            print("이겼습니다!")
            print("게임 종료")
        case rock:
            print("비겼습니다!")
            startGame()
        case paper:
            print("졌습니다!")
            print("게임 종료")
        default:
            break
        }
    }
}
