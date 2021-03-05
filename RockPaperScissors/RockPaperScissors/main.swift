class RockPaperScissors {
    
    var userValue: String = ""
    var computerValue: String = ""
    var computerArray = ["Scissors", "Rock", "Paper"]
    var valuesArray: Array<String> = []
    let scissors: String = "Scissors"
    let rock: String = "Rock"
    let paper: String = "Paper"
    
    func makeComputerValue() {
        if let computerArrayValue = computerArray.randomElement() {
            computerValue = computerArrayValue
        }
    }
    
    func printUserValue() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        if let result = readLine() {
            userValue = result
        }
    }
    
    func inputUserValue() {
        if userValue == "1" {
            userValue = scissors
        } else if userValue == "2" {
            userValue = rock
        } else if userValue == "3" {
            userValue = paper
        } else if userValue == "0" {
            userValue = "게임종료"
            print(userValue)
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            playGame()
        }
    }
    
    func plusArray() {
        valuesArray.append(userValue)
        valuesArray.append(computerValue)
    }
    
    func compareValue() {
        let winArray = [[rock, scissors], [scissors, paper], [paper, rock]]
        let loseArray = [[scissors, rock], [paper, scissors], [rock, paper]]
        let drawArray = [[rock, rock], [scissors, scissors], [paper, paper]]
        if winArray.contains(valuesArray) {
            print("이겼습니다")
        } else if loseArray.contains(valuesArray) {
            print("졌습니다")
        } else if drawArray.contains(valuesArray) {
            print("비겼습니다")
            valuesArray = []
            playGame()
        }
    }
    
    func playGame() {
        makeComputerValue()
        printUserValue()
        inputUserValue()
        plusArray()
        compareValue()
    }
}

RockPaperScissors().playGame()










