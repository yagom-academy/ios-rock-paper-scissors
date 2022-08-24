import Foundation

enum InputError: Error {
    case numberError(message: String)
    case rangeError(message: String)
}

enum InputOption: Int, CaseIterable {
    case gameExit = 0
    case scissors = 1
    case rock = 2
    case paper = 3
}

func generateComputerInput() -> InputOption? {
    let computerInput = InputOption.allCases.filter { $0 != .gameExit }.randomElement()
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

func castingUserInput(input: String?) -> InputOption {
    guard let input = Int(input ?? "") else { return .gameExit }

    switch input {
    case InputOption.gameExit.rawValue:
        return .gameExit
    case InputOption.scissors.rawValue:
        return .scissors
    case InputOption.rock.rawValue:
        return .rock
    case InputOption.paper.rawValue:
        return .paper
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return .gameExit
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

func playRPS() {
    var isGaming = true

    while (isGaming) {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")

        let userInput: String? = bringUserInput()
        var userHands: InputOption

        if handlingInputError(input: userInput) == false {
            continue
        } else {
            userHands = castingUserInput(input: userInput)
        }

        if userHands == .gameExit {
            print("게임 종료")
            return
        }

        let computerHands = generateComputerInput()
        isGaming = decideWinLose(userHands, computerHands)
    }
}

func decideWinLose(_ userHands: InputOption, _ computerHands: InputOption?) -> Bool {
    let winNumbers = [1, -2]
    let drawNumber = 0

    guard let computerHands = computerHands else { return false }

    let checkNumber = userHands.rawValue - computerHands.rawValue

    if checkNumber == drawNumber {
        print("비겼습니다!")
        return true
    } else if winNumbers.contains(checkNumber) {
        print("이겼습니다!")
        return false
    } else {
        print("졌습니다!")
        return false
    }
}

playRPS()
