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
    
    enum GameResult {
        case win
        case draw
        case lose
    }

    func gameStart() {}
    
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
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
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
}
