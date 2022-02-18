import Foundation

enum StartAndEndMessage {
    static let startOfFirstGame = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    static let startOfSecondGame = "묵(1), 찌(2), 빠(3)! <종료 : 0>"
    static let endOfGame = "게임 종료"
}

enum ErrorMessage {
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

enum GameResultMessage {
    static let win = "이겼습니다!"
    static let defeat = "졌습니다!"
    static let draw = "비겼습니다!"
}

enum PunctuationMarks {
    static let colon = " : "
    static let emptyString = ""
}

enum Decision {
    static let winNumber = [1, -2]
    static let defeatNumber = [2, -1]
}

enum Player {
    static let user = "사용자"
    static let computer = "컴퓨터"
}

var isTurnOfUser: Bool = false
var thisTurn: String = PunctuationMarks.emptyString

func selectFirstGameMenu() -> String {
    print(StartAndEndMessage.startOfFirstGame, terminator: PunctuationMarks.colon)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString }
    return userInput
}

func selectSecondGameMenu() -> String {
    print("[\(decideTurn()) 턴]", StartAndEndMessage.startOfSecondGame, terminator: PunctuationMarks.colon)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString }
    return userInput
}

func checkValidity(of userInput: String) -> Int? {
    let validNumbersForGame = ["0", "1", "2", "3"]
    if validNumbersForGame.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(ErrorMessage.wrongInput)
        startFirstGame(selectFirstGameMenu())
        return nil
    }
}

func checkValidity2(of userInput: String) -> Int? {
    let validNumbersForGame = ["0", "1", "2", "3"]
    if validNumbersForGame.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(ErrorMessage.wrongInput)
        isTurnOfUser = false
        startSecondGame(selectSecondGameMenu())
        return nil
    }
}

func startFirstGame(_ userInput: String) {
    let endingNumber = 0
    guard let validNumber = checkValidity(of: userInput) else { return }
    if validNumber == endingNumber {
        print(StartAndEndMessage.endOfGame)
        return
    } else {
        decideFirstWinner(validNumber)
        startSecondGame(selectSecondGameMenu())
        return
    }
}

func startSecondGame(_ userInput: String) {
    let endingNumber = 0
    guard let validNumber = checkValidity2(of: userInput) else { return }
    if validNumber == endingNumber {
        print(StartAndEndMessage.endOfGame)
        return
    } else {
        decideSecondWinner(validNumber)
    }
}

func decideFirstWinner(_ validNumber: Int) {
    let allowedNumberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: allowedNumberRange)
    let numberToDecideWinner: Int = validNumber - computerNumber
    switch numberToDecideWinner {
    case Decision.winNumber[0], Decision.winNumber[1]:
        print(GameResultMessage.win)
        isTurnOfUser = true
    case Decision.defeatNumber[0], Decision.defeatNumber[1]:
        print(GameResultMessage.defeat)
        isTurnOfUser = false
    default:
        print(GameResultMessage.draw)
        startFirstGame(selectFirstGameMenu())
    }
}

func decideSecondWinner(_ validNumber: Int) {
    thisTurn = decideTurn()
    var winner: String = PunctuationMarks.emptyString
    let allowedNumberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: allowedNumberRange)
    print("컴퓨터 : \(computerNumber), 사용자 : \(validNumber)")
    let numberToDecideWinner: Int = validNumber - computerNumber
    if validNumber == computerNumber {
        print("\(thisTurn)의 승리!")
        print(StartAndEndMessage.endOfGame)
        return
    }
    switch numberToDecideWinner {
    case Decision.winNumber[0], Decision.winNumber[1]:
        winner = Player.user
    default:
        winner = Player.computer
    }
    if winner == thisTurn {
        print("\(thisTurn)의 턴입니다")
        startSecondGame(selectSecondGameMenu())
    } else {
        isTurnOfUser = !isTurnOfUser
        print("\(decideTurn())의 턴입니다")
        startSecondGame(selectSecondGameMenu())
    }
}

func decideTurn() -> String {
    if isTurnOfUser == true {
        return Player.user
    } else {
        return Player.computer
    }
}

startFirstGame(selectFirstGameMenu())
