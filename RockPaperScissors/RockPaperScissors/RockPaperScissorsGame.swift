//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//
class RockPaperScissorsGame {
    var userNumber: String = ""
    var computerNumber: String = ""
    var resultOfCheck: Bool = true
    var gameResult: String = ""
    
    private var scissors: String = RockPaperScissors.scissors.theNumberOfCase
    private var paper: String = RockPaperScissors.paper.theNumberOfCase
    private var rock: String = RockPaperScissors.rock.theNumberOfCase
    private var endGame: String = RockPaperScissors.end.theNumberOfCase
    
    func startGame() {
        while true {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
            inputUserNumber()
            choiceRockPaperScissors()
            setRockPaperScissorsRule(userNumber, with: computerNumber)
            checkRockPaperScissorsRule(from: userNumber)
            
            if userNumber == endGame {
                break
            }
            
            if resultOfCheck {
                print("잘못된 입력입니다. 다시 시도해 주세요.")
                continue
            }
            
            print(gameResult)
            
            if gameResult == "이겼습니다." {
                break
            } else if gameResult == "졌습니다." {
                break
            }
        }
    }
    
    func inputUserNumber() {
        guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces) else { return }
        self.userNumber = userInput
    }
    
    func choiceRockPaperScissors() {
        let numberList: [String] = ["1", "2", "3"]
        
        guard let choicedCase = numberList.randomElement() else { return }
        self.computerNumber = choicedCase
    }
    
    func setRockPaperScissorsRule(_ userInput: String, with randomNumber: String) {
        if userInput == paper && randomNumber == scissors {
            self.gameResult = "졌습니다."
        } else if userInput == scissors && randomNumber == paper {
            self.gameResult = "이겼습니다."
        } else {
            if userInput == randomNumber {
                self.gameResult = "비겼습니다."
            } else if userInput < randomNumber {
                self.gameResult = "졌습니다."
            } else {
                self.gameResult = "이겼습니다."
            }
        }
    }
    
    func checkRockPaperScissorsRule(from inputData: String) {
        let allright: [String] = ["1", "2", "3", "0"]
        
        if allright.contains(inputData) {
            self.resultOfCheck = false
        } else {
            self.resultOfCheck = true
        }
    }
}
