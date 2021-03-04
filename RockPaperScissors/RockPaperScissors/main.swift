import Foundation

enum gameOption: String {
    case scissor = "Scissors"
    case rock = "Rock"
    case paper = "Paper"
    case exit = "게임종료"
}

var userValueString: String = " "
var computerValueString: String = " "

class RockPaperScissors {
    var userValue: Int = 0
    var computerValue: Int = 0
    //MARK: - computerValue의 값(Int)에 따라 열거형에서 comuputerValue2의 값(String)을 가져오는 함수
    func makeComputerValue() {
        computerValue = Int.random(in: 1...3)
    }
    //MARK: - computerValue에 따라 열거형 gameOption에서 원시 값을 가져오는 함수
    func inputComputerValue() {
        makeComputerValue()
        if computerValue == 1 {
            computerValueString = gameOption.scissor.rawValue
        } else if computerValue == 2 {
            computerValueString = gameOption.rock.rawValue
        } else if computerValue == 3 {
            computerValueString = gameOption.paper.rawValue
        }
    }
    //MARK: - 유저로부터 숫자를 입력 받고(Int) 그 입력 받은 숫자에 따라 열거형에서 값(String)을 가져와서 userValueString에 집어넣는 함수
    func inputUserValue() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        if let result = readLine() {
            if let resultInt = Int(result) {
                userValue = resultInt
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                return playGame()
            }
        }
        if userValue == 1 {
            userValueString = gameOption.scissor.rawValue
        } else if userValue == 2 {
            userValueString = gameOption.rock.rawValue
        } else if userValue == 3 {
            userValueString = gameOption.paper.rawValue
        } else if userValue == 0 {
            userValueString = gameOption.exit.rawValue
        }
    }
    //MARK: - userValueString과 computerValueString을 비교하여 결과를 출력하는 함수
    func compareStringValue() {
        switch userValueString {
        case "Rock":
            if computerValueString == "Scissors" {
                print("이겼습니다")
            } else if computerValueString == "Rock" {
                print("비겼습니다")
                return playGame()
            } else if computerValueString == "Paper" {
                print("졌습니다")
            }
        case "Scissors":
            if computerValueString == "Scissors" {
                print("비겼습니다")
                return playGame()
            } else if computerValueString == "Rock" {
                print("졌습니다")
            } else if computerValueString == "Paper" {
                print("이겼습니다")
            }
        case "Paper":
            if computerValueString == "Scissors" {
                print("졌습니다")
            } else if computerValueString == "Rock" {
                print("이겼습니다")
            } else if computerValueString == "Paper" {
                print("비겼습니다")
                return playGame()
            }
        case "게임종료":
            print("게임종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return playGame()
        }
    }
    //MARK: - 가위바위보를 시작하는 함수
    func playGame() {
        inputComputerValue()
        inputUserValue()
        compareStringValue()
    }
}

let startClass = RockPaperScissors()
startClass.playGame()


