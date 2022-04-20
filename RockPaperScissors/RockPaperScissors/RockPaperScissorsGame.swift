//
//  functions.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/18.
//
class RockPaperScissorsGame {
    var userNumber: String = ""
    var randomNumber: String = ""
    var resultOfCheck: Bool = true
    var gameResult: String = ""
    
    func startGame() {
        while true {
            inputUserNumber()
            choiceRockPaperScissors()
            compare(userNumber, with: randomNumber)
            checkInput(from: userNumber)
            
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
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        guard let userInput = readLine() else { return }
        self.userNumber = userInput
    }
    
    func choiceRockPaperScissors() {
        let numberList: [String] = ["1", "2", "3"]
        guard let choicedCase = numberList.randomElement() else { return }
        self.randomNumber = choicedCase
    }
    
    func compare(_ userInput: String, with randomNumber: String) {
        if userInput == "3" && randomNumber == "1" {
            self.gameResult = "졌습니다."
        } else if userInput == "1" && randomNumber == "3" {
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
    
    func checkInput(from inputData: String) {
        let allright: [String] = ["1", "2", "3"]
        
        if allright.contains(inputData) {
            self.resultOfCheck = false
        } else {
            self.resultOfCheck = true
        }
    }
}
