class RockPaperScissors {
    
    var userValue: String = " "
    var computerArray = ["Scissors", "Rock", "Paper"]
    var computerValue: String = " "
    
    func inputUserValue() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        if let result = readLine() {
                userValue = result
        }
        if userValue == "1" {
            userValue = "Scissors"
        } else if userValue == "2" {
            userValue = "Rock"
            } else if userValue == "3" {
                userValue = "Paper"
            } else if userValue == "0" {
            userValue = "게임종료"
            }
        }
    
    func makeComputerValue() {
        if let computerArrayValue = computerArray.randomElement() {
            computerValue = computerArrayValue
        }
    }
    
    func compareValue() {
        switch userValue {
        case "Rock":
            if computerValue == "Scissors" {
                print("이겼습니다")
            } else if computerValue == "Rock" {
                print("비겼습니다")
                return playGame()
            } else if computerValue == "Paper" {
                print("졌습니다")
            }
        case "Scissors":
            if computerValue == "Scissors" {
                print("비겼습니다")
                return playGame()
            } else if computerValue == "Rock" {
                print("졌습니다")
            } else if computerValue == "Paper" {
                print("이겼습니다")
            }
        case "Paper":
            if computerValue == "Scissors" {
                print("졌습니다")
            } else if computerValue == "Rock" {
                print("이겼습니다")
            } else if computerValue == "Paper" {
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
    
    func playGame() {
        makeComputerValue()
        inputUserValue()
        compareValue()
    }
}

RockPaperScissors().playGame()




