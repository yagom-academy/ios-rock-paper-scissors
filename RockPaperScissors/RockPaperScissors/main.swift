//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum ExceptionalInput {
    case wrongInput
    case closeInput
    
    var correspondingNumber: Int {
        switch self {
        case .wrongInput:
            return -1
        case .closeInput:
            return 0
        }
    }
}

enum RockPaperScissor: CaseIterable {
    case scissor
    case rock
    case paper
    
    var correspondingNumber: Int {
        switch self {
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
    
    var correspodingMuckJjiPpaNumber: Int {
        switch self {
        case .rock:
            return 1
        case .scissor:
            return 2
        case .paper:
            return 3
        }
    }
}

enum winnigCases {
    case RockPaperScissorCase
    case MuckJjiPpaCase
    
    var numberCases: Array<(Int,Int)> {
        switch self {
        case .RockPaperScissorCase:
            return [(RockPaperScissor.scissor.correspondingNumber, RockPaperScissor.paper.correspondingNumber),
                    (RockPaperScissor.rock.correspondingNumber, RockPaperScissor.scissor.correspondingNumber),
                    (RockPaperScissor.paper.correspondingNumber, RockPaperScissor.rock.correspondingNumber)]
        case .MuckJjiPpaCase:
            return [(RockPaperScissor.rock.correspodingMuckJjiPpaNumber, RockPaperScissor.scissor.correspodingMuckJjiPpaNumber),
                    (RockPaperScissor.scissor.correspodingMuckJjiPpaNumber, RockPaperScissor.paper.correspodingMuckJjiPpaNumber),
                    (RockPaperScissor.paper.correspodingMuckJjiPpaNumber, RockPaperScissor.rock.correspodingMuckJjiPpaNumber)]
        }
    }
}

enum GameResult: String {
    case draw
    case win
    case lose
    
    var result: String {
        switch self {
        case .draw:
            return "비겼습니다!"
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        }
    }
}

struct Player {
    private var playerName: String
    private var MuckJjiPpaTurn = false
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    mutating func MuckJjiPpaTurnChange() {
        if self.MuckJjiPpaTurn {
            self.MuckJjiPpaTurn = false
        } else {
            self.MuckJjiPpaTurn = true
        }
    }
    
    func retrieveMuckJjiPpaTurn() -> Bool {
        return self.MuckJjiPpaTurn
    }
    
    func retrievePlayerName() -> String {
        return self.playerName
    }
}

var user = Player(playerName: "사용자")
var computer = Player(playerName: "컴퓨터")

func doTurnChange() {
    computer.MuckJjiPpaTurnChange()
    user.MuckJjiPpaTurnChange()
}

func printRockPaperScissorOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func printMuckJjiPpaOption(player: Player) {
    print("[\(player.retrievePlayerName()) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func makeComputerRandomNumber() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func inputUserNumber() -> Int {
    var userInput: Int
    let inputNumber = readLine() ?? ""
    userInput = checkUserInputNumber(userInput: inputNumber)
    return userInput
}

func checkUserInputNumber(userInput: String) -> Int {
    var selectedNumber = ExceptionalInput.wrongInput.correspondingNumber
    let rockPaperScissorCases = RockPaperScissor.allCases.map( {$0.correspondingNumber} )
    let closeInputCase = [ExceptionalInput.closeInput.correspondingNumber]
    let verifiedInputCases = rockPaperScissorCases + closeInputCase
    if let verifiedUserInput = Int(userInput) {
        switch verifiedUserInput {
        case _ where verifiedInputCases.contains(verifiedUserInput):
            selectedNumber = verifiedUserInput
        default:
            selectedNumber = ExceptionalInput.wrongInput.correspondingNumber
        }
    }
    return selectedNumber
}

func compareTwoNumbers (userInput: Int, computerInput: Int, winningNumberCase: Array<(Int, Int)>) -> String {
    let selectedNumberCase = winningNumberCase
    var matchResult = GameResult.draw.result
    let comparisonGroup = (userInput, computerInput)
    if userInput == computerInput {
        matchResult = GameResult.draw.result
    } else if selectedNumberCase.contains(where: { $0 == comparisonGroup }) {
        matchResult = GameResult.win.result
    } else {
        matchResult = GameResult.lose.result
    }
    return matchResult
}

func startRockPaperScissorGame() {
    let computerRockPaperScissorInput = makeComputerRandomNumber()
    while true {
        printRockPaperScissorOption()
        let userRockPaperScissorInput = inputUserNumber()
        if userRockPaperScissorInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            continue
        }
        if userRockPaperScissorInput == ExceptionalInput.closeInput.correspondingNumber{
            print("게임 종료")
            break
        }
        let comparedResult = compareTwoNumbers(userInput: userRockPaperScissorInput, computerInput: computerRockPaperScissorInput, winningNumberCase: winnigCases.RockPaperScissorCase.numberCases)
        print(comparedResult)
        if comparedResult == GameResult.draw.result {
            continue
        }
        comparedResult == GameResult.win.result ? user.MuckJjiPpaTurnChange() : computer.MuckJjiPpaTurnChange()
        startMuckJjiPpaGame()
        break
    }
}

func startMuckJjiPpaGame() {
    while true {
        let currentWinner = user.retrieveMuckJjiPpaTurn() ? user : computer
        printMuckJjiPpaOption(player: currentWinner)
        let computerMuckJjiPpaInput = makeComputerRandomNumber()
        let userMuckJjiPpaInput = inputUserNumber()
        if userMuckJjiPpaInput == ExceptionalInput.closeInput.correspondingNumber{
            print("게임 종료")
            break
        }
        if currentWinner.retrievePlayerName() == user.retrievePlayerName() && userMuckJjiPpaInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            doTurnChange()
            continue
        } else if currentWinner.retrievePlayerName() == computer.retrievePlayerName() && userMuckJjiPpaInput == ExceptionalInput.wrongInput.correspondingNumber {
            printErrorMessage()
            continue
        }
        let matchResult = compareTwoNumbers(userInput: userMuckJjiPpaInput, computerInput: computerMuckJjiPpaInput, winningNumberCase: winnigCases.MuckJjiPpaCase.numberCases)
        if matchResult == GameResult.draw.result {
            print("\(currentWinner.retrievePlayerName())의 승리!")
            print("게임 종료")
            break
        } else if currentWinner.retrievePlayerName() == user.retrievePlayerName() && matchResult == GameResult.lose.result {
            doTurnChange()
            print("컴퓨터의 턴입니다")
        } else if currentWinner.retrievePlayerName() == computer.retrievePlayerName() && matchResult == GameResult.win.result {
            doTurnChange()
            print("사용자의 턴입니다")
        }
    }
}

startRockPaperScissorGame()
