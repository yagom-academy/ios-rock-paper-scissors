import Foundation

class RockPaperScissorsGame {
    var userNumber: String = ""
    var computerNumber: String = ""
    var gameResult: String = ""

    let endGame: String = GameCondition.end.functionSelection

    let draw: String = GameResult.draw.result
    let win: String = GameResult.win.result
    let lose: String = GameResult.lose.result

    private var rock: String = RockPaperScissors.rock.hand
    private var paper: String = RockPaperScissors.paper.hand
    private var scissors: String = RockPaperScissors.scissors.hand
    
    func startGame() {
        while gameResult != win && gameResult != lose {
            print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
            inputUserNumber()
            selectRockPaperScissors()
            setRockPaperScissorsRule(userNumber, with: computerNumber)
            
            if userNumber == endGame {
                break
            }
            
            if isFitNumber(from: userNumber) {
                print("잘못된 입력입니다. 다시 시도해 주세요.")
                continue
            }
            
            print(gameResult)
        }
    }
    
    func inputUserNumber() {
        guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces) else { return }
        self.userNumber = userInput
    }
    
    func selectRockPaperScissors() {
        let numberOfCase: [String] = ["1", "2", "3"]
        
        guard let choiceCase = numberOfCase.randomElement() else { return }
        self.computerNumber = choiceCase
    }
    
    func setRockPaperScissorsRule(_ userInput: String, with randomNumber: String) {
        if userInput == randomNumber {
            gameResult = draw
            return
        }
        
        switch userInput {
        case scissors:
            if randomNumber == rock {
                gameResult = lose
            } else if randomNumber == paper {
                gameResult = win
            }
        case rock:
            if randomNumber == paper {
                gameResult = lose
            } else if randomNumber == scissors {
                gameResult = win
            }
        case paper:
            if randomNumber == scissors {
                gameResult = lose
            } else if randomNumber == rock {
                gameResult = win
            }
        default:
            break
        }
    }
    
    func isFitNumber(from inputData: String) -> Bool {
        let fitNumber: [String] = ["1", "2", "3", "0"]
        
        if fitNumber.contains(inputData) {
            return false
        } else {
            return true
        }
    }
}
