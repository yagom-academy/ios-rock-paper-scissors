class RockPaperScissorsGame {
    enum Hand: String, CaseIterable, Comparable {
        static func < (lhs: RockPaperScissorsGame.Hand, rhs: RockPaperScissorsGame.Hand) -> Bool {
            if (lhs == .scissors && rhs == .rock)
                || (lhs == .paper && rhs == .scissors)
                || (lhs == .rock && rhs == .paper) {
                    return true
            } else {
                return false
            }
        }
        
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }
    
    enum GameError: Error {
        case invalidInput
    }
    
    enum GameResult {
        case win
        case draw
        case lose
    }

    func gameStart() {
        repeat {
            guard let computersHand = Hand.allCases.randomElement() else {
                continue
            }
            
            var userHand: Hand
            do {
                if let notNilUserHand = try getHandByUser() {
                    userHand = notNilUserHand
                } else {
                    print("게임종료")
                    break
                }
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                continue
            }

            let gameResult = getGameResult(userHand, vs: computersHand)

            switch gameResult {
            case .win :
                print("이겼습니다.")
                return
            case .lose :
                print("졌습니다.")
                return
            default :
                print("비겼습니다.")
            }
        } while true
    }
    
    func getGameResult(_ usersHand: Hand, vs computersHand: Hand) -> GameResult {
        if usersHand == computersHand {
            return .draw
        } else if (usersHand == .rock && computersHand == .scissors)
            || (usersHand == .scissors && computersHand == .paper)
            || (usersHand == .paper && computersHand == .rock) {
            return .win
        } else {
            return .lose
        }
    }
        
    func getHandByUser() throws -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userInput = readLine() else {
            throw GameError.invalidInput
        }
        
        if userInput == "0" {
            return nil
        }
        
        guard let userHand = Hand(rawValue: userInput) else {
            throw GameError.invalidInput
        }

        return userHand
    }
}

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.gameStart()
