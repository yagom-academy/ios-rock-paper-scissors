import Darwin
class MukjjibbaGame: RockPaperScissorsGame {
    private let user: String = Player.user.selection
    private let computer: String = Player.computer.selection
    
    private var muk: String = Mukjjibba.muk.hand
    private var jji: String = Mukjjibba.jji.hand
    private var bba: String = Mukjjibba.bba.hand
    
    var currentTurn: String? {
        switch gameResult {
        case win:
            return user
        case lose:
            return computer
        default:
            return nil
        }
    }
    
    override func startGame() {
        super.startGame()

        while userNumber != endGame {
            print("[\(unwrapOptional(currentTurn)) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
            inputUserNumber()
            selectRockPaperScissors()
            
            if userNumber == endGame {
                break
            }

            if isFitNumber(from: userNumber) {
                print("잘못된 입력입니다. 다시 시도해 주세요.")
                gameResult = lose
                continue
            }
            
            let mukjjibbaResult = isMukjjibbaResult(userInput: userNumber, randomNumber: computerNumber)
            
            if mukjjibbaResult {
                print("\(unwrapOptional(currentTurn))의 승리!")
                print("게임 종료")
                break
            } else {
                print("\(unwrapOptional(currentTurn))의 턴입니다.")
            }
        }
    }
    
    func isMukjjibbaResult(userInput: String, randomNumber: String) -> Bool {
        if userInput == randomNumber {
           return true
        } else {
            setMukjjibbaRule(userInput, with: randomNumber)
            return false
        }
    }
    
    func setMukjjibbaRule(_ userInput: String, with randomNumber: String) {
        switch userInput {
        case jji:
            if randomNumber == muk {
                gameResult = lose
            } else if randomNumber == bba {
                gameResult = win
            }
        case muk:
            if randomNumber == bba {
                gameResult = lose
            } else if randomNumber == jji {
                gameResult = win
            }
        case bba:
            if randomNumber == jji {
                gameResult = lose
            } else if randomNumber == muk {
                gameResult = win
            }
        default:
            break
        }
    }
    
    func unwrapOptional(_ inputString: String?) -> String {
        var outputString: String = ""
        
        if let str = inputString {
            outputString = str
        }
        return outputString
    }
}
