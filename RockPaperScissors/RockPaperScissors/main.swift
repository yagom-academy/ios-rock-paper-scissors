import Foundation

enum InputError: Error {
    case nilError(message: String)
    case numberError(message: String)
    case rangeError(message: String)
}

func bringUserInput() -> String? {
    let input = readLine()
    return input
}

func checkUserInput(input: String?) throws -> Int {
    let errorSentence: String = "잘못된 입력입니다. 다시 시도해주세요."

    guard let input = input else { throw InputError.nilError(message: errorSentence) }
    guard let userInput = Int(input) else { throw InputError.numberError(message: errorSentence) }

    if userInput == 0 {
        return 0
    }

    if !(1...3 ~= userInput) {
        throw InputError.rangeError(message: errorSentence)
    }
    return userInput
}

func handlingInputError(input: String?) -> (Bool, Int) {
    var checkNumber = -1
    do {
        checkNumber = try checkUserInput(input: input)
    } catch InputError.nilError(let message) {
        print(message)
        return (false, checkNumber)
    } catch InputError.numberError(let message) {
        print(message)
        return (false, checkNumber)
    } catch InputError.rangeError(let message) {
        print(message)
        return (false, checkNumber)
    } catch {
        return (false, checkNumber)
    }
    return (true, checkNumber)
}

func generateComputerInput() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func playRPS() {
    var isGaming = true

    while (isGaming) {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")

        let userInput: String? = bringUserInput()
        let isValidNumber: (isValid: Bool, userNumber: Int) = handlingInputError(input: userInput)

        if isValidNumber.isValid == false && isValidNumber.userNumber == 0 {
            print("게임 종료")
            return
        } else if isValidNumber.isValid == false && isValidNumber.userNumber != 0 {
            continue
        }

        let computerInput = generateComputerInput()
        isGaming = decideWinLose(isValidNumber.userNumber, computerInput)
    }
}

func decideWinLose(_ userInput: Int, _ computerInput: Int) -> Bool {
    let winNumbers = [1, -2]
    let drawNumber = 0
    let checkNumber = userInput - computerInput

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
