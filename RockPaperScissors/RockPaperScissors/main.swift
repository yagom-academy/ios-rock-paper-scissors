import Foundation

func generateComputerInput() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func bringUserInput() -> String? {
    let input = readLine()
    return input
}

func checkUserInput(input: String?) throws -> Bool {
    let errorSentence: String = "잘못된 입력입니다. 다시 시도해주세요."

    guard let input = Int(input ?? "") else { throw InputError.numberError(message: errorSentence) }

    if 0...3 ~= input {
        return true
    } else {
        throw InputError.rangeError(message: errorSentence)
    }
}

func castingUserInput(input: String?) -> Int {
    guard let input = Int(input ?? "") else { return 0 }

    switch input {
    case 0...3:
        return input
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return 0
    }
}

func handlingInputError(input: String?) -> Bool {
    do {
        let isCheck = try checkUserInput(input: input)
        return isCheck
    } catch InputError.numberError(let message) {
        print(message)
        return false
    } catch InputError.rangeError(let message) {
        print(message)
        return false
    } catch {
        return false
    }
}

func playRPS() -> String {
    let gameName = "RPS"
    var turn: String = ""
    while (true) {
        print("가위(1), 바위(2), 보(3)!<종료: 0>: ", terminator: "")
        
        let userInput: String? = bringUserInput()
        var userHands: RockScissorsPaper?
        let computerHands = RockScissorsPaper(rawValue: generateComputerInput())
        
        if handlingInputError(input: userInput) == false {
            continue
        } else {
            userHands = RockScissorsPaper(rawValue: castingUserInput(input: userInput))
        }
        
        if userHands == RockScissorsPaper.none {
            print("게임 종료")
            turn = ""
            return ""
        }
        
        if decideDraw(userHands?.rawValue, computerHands?.rawValue) {
            print("비겼습니다!")
            continue
        }
        
        if decideWinLose(gameName, userHands?.rawValue, computerHands?.rawValue) {
            print("이겼습니다!")
            turn = "사용자"
            return turn
        } else {
            print("졌습니다!")
            turn = "컴퓨터"
            return turn
        }
    }
}

func playMZB() {
    var turn = playRPS()
    let gameName = "MZB"
    if turn == "" {
        return
    }
    
    while (true) {
        print("[\(turn)턴] 묵(1), 찌(2), 빠(3)!<종료: 0>: ", terminator: "")
        let userInput: String? = bringUserInput()
        var userHands: MukZiBa?
        let computerHands = MukZiBa(rawValue: generateComputerInput())
        
        if handlingInputError(input: userInput) == false {
            continue
        } else {
            userHands = MukZiBa(rawValue: castingUserInput(input: userInput))
        }

        if userHands == MukZiBa.none {
            print("게임 종료")
            turn = ""
            return
        }
        
        if decideDraw(userHands?.rawValue, computerHands?.rawValue) {
            print("\(turn)의 승리!")
            break
        }
        
        if decideWinLose(gameName, userHands?.rawValue, computerHands?.rawValue) {
            turn = "사용자"
        } else {
            turn = "컴퓨터"
        }
        print("\(turn)의 턴입니다")
    }
}

func decideDraw(_ userHands: Int?, _ computerHands: Int?) -> Bool {
    let drawNumber = 0
    guard let userHands = userHands, let computerHands = computerHands else { return false }
    let checkNumber = userHands - computerHands

    return checkNumber == drawNumber ? true : false
}

func decideWinLose(_ gameName: String, _ userHands: Int?, _ computerHands: Int?) -> Bool {
    
    var winNumbers: [Int]
    
    switch gameName {
    case "RPS":
        winNumbers = [1, -2]
    case "MZB":
        winNumbers = [-1, 2]
    default:
        winNumbers = []
    }
    
    guard let userHands = userHands, let computerHands = computerHands else { return false }
    let checkNumber = userHands - computerHands
    return winNumbers.contains(checkNumber) ? true : false
}


playMZB()

