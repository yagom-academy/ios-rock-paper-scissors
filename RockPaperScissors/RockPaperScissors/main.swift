



class RockPaperScissorsGame {
    enum Hand {
        case scissors
        case rock
        case paper
        case none
    }
    
    enum GameError: Error {
        case invalidInput
    }

    enum GameResult: String {
        case win = "사용자"
        case draw
        case lose = "컴퓨터"
    }
    
    enum Winner {
        case user
        case computer
    }

    func gameStart() {
        repeat {
            let computersHand = makeRandomHand()
            var userHand: Hand = Hand.none
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            
            do {
                userHand = try getHandByUser()
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                continue
            }
            
            if userHand == .none {
                print("게임종료")
                break
            }

            let gameResult = getGameResult(userHand, vs: computersHand)

            switch gameResult {
            case .win :
                print("이겼습니다.")
                mukchibaGameStart(deliverWinner: GameResult.win.rawValue)
                return
            case .lose :
                print("졌습니다.")
                mukchibaGameStart(deliverWinner: GameResult.lose.rawValue)
                return
            default :
                print("비겼습니다.")
            }
        } while true
    }

    func makeRandomHand() -> Hand {
        let random = Int.random(in: 1...3)
        
        switch random {
        case 1:
            return Hand.scissors
        case 2:
            return Hand.rock
        case 3:
            return Hand.paper
        default:
            return Hand.none
        }
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
        
    func getHandByUser() throws -> Hand {
//        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userInput = readLine() else {
            throw GameError.invalidInput
        }
        
        switch userInput {
        case "0":
            return Hand.none
        case "1":
            return Hand.scissors
        case "2":
            return Hand.rock
        case "3":
            return Hand.paper
        default:
            throw GameError.invalidInput
        }
    }
    
    
    func mukchibaGameStart(deliverWinner: String) {
        var winnerIsUser = true
        var winner = "사용자"
        
        while true {
            var computersHand = makeRandomHand()
            var userHand: Hand = Hand.none
            
            if deliverWinner == "사용자" {
                winnerIsUser = true
                winner = "사용자"
            } else if deliverWinner == "컴퓨터" {
                winnerIsUser = false
                winner = "컴퓨터"
            }
            
            print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            do {
                userHand = try getHandByUser()
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                // 턴 바꾸기
                continue
            }
            
            if userHand == .none {
                print("게임종료")
                break
            }
            
            // 묵찌빠판별()
            let gameResult = getMukchibaGameResult(userHand, vs: computersHand)
            
            switch gameResult {
            case .win:
                print("사용자의 승리!")
            case .draw:
                print("컴퓨터의 승리! ")
            default:
                <#code#>
            }
        }
    }
    
    func mukchiPaGameResult(_ userHand: Hand, vs computersHand: Hand) -> GameResult {
        
        if usersHand == computersHand {
            return .win
        } else if (usersHand == .rock && computersHand == .scissors)
        || (usersHand == .scissors && computersHand == .paper)
        || (usersHand == .paper && computersHand == .rock) {
            return .lose
        } else {
            return .lose
        }
    }
}

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.gameStart()

