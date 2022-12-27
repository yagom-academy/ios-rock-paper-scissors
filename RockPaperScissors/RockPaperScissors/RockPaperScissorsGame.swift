//  RockPaperScissors - RockPaperScissorsGame.swift
//  Created by vetto, songjun on 2022.12.27

enum ScissorsRockPaper: Int { //MARK
    case scissors = 1
    case rock = 2
    case paper = 3
    case wrongHand
}


func makeRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func inputUserNumber() -> Int {
    guard let userInput = readLine() else {
        return inputUserNumber()
    }
    guard let userNumber = Int(userInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserNumber()
    }
    return userNumber
}

func printMenu() {
    print("")
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func convertNumberToHand(userNumber: Int, computerNumber: Int) -> (ScissorsRockPaper, ScissorsRockPaper) {
    guard let userHand = ScissorsRockPaper(rawValue: userNumber) else {
        return (ScissorsRockPaper.wrongHand, ScissorsRockPaper.wrongHand)
    }
    guard let computerHand = ScissorsRockPaper(rawValue: computerNumber) else {
        return (ScissorsRockPaper.wrongHand, ScissorsRockPaper.wrongHand)
    }
    return (userHand, computerHand)
}

func compareHand(computerHand: Int, userHand: Int) -> String {
    let result: String
    
  // 변경
    if userHand - computerHand == 0 {
        result = "비겼습니다!"
    } else if userHand - computerHand == -2 || userHand - computerHand == 1 {
        result = "이겼습니다!"
    } else {
        result = "졌습니다!"
    }
    
    return result
}


func startGame() {
    
    while true {
        printMenu()
        let userInput = inputUserNumber()
        switch userInput {
        case 0:
            print("게임 종료")
            return
        case 1,2,3:
            
            print(compareHand(computerHand: makeRandomComputerNumber(), userHand: userInput))
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}



//switch userNumber {
//case 1:
//    userHand = a.scissors
//case 2:
//    userHand = a.rock
//case 3:
//    userHand = a.paper
//}

