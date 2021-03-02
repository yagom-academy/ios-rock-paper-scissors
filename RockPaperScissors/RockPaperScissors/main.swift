enum GameError: Error {
    case invalidInput
    case unknownError
}
enum GameResult {
    case win
    case lose
    case draw
}

class RockScissorPaper {
    var handOfComputer = 0
    var handOfUser = 0
    
    func initialize() {
        handOfUser = 0
        handOfComputer = Int.random(in: 1...3)
    }
    func startGame() {
        var userInput = 0
        outer: while true{
            initialize()
            showMenu()
            do {
                userInput = try getUserInput()
                if userInput == 0 {
                    print("게임 종료")
                    break outer
                }
            } catch {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue outer
            }
            handOfUser = userInput
            let winner = compareHands(handOfUser, with: handOfComputer)
            showResult(winner)
        }
    }

    func compareHands(_ user: Int, with computer: Int) -> GameResult {
        switch (user, computer) {
        case (1, 1), (2, 2), (3, 3):
            return .draw
        case (1, 3), (2, 1), (3, 2):
            return .win
        case (1, 2), (2, 3), (3, 1):
            return .lose
        default:
            print("알 수 없는 오류입니다.")
            return GameResult.lose
        }
    }
    
    func showMenu() {
        print("가위(1). 바위(2). 보(3)! <종료 : 0>", terminator: " : ")
    }
    
    func getUserInput() throws -> Int {
        return 0
    }
    
    func showResult(_ input: GameResult) {
        
    }
}

RockScissorPaper().startGame()
