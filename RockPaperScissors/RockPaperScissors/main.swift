import Foundation

enum RPS {
    case rock
    case paper
    case scissors
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func fetchUserInput() -> String? {
    let userInput = readLine()

    guard let userInput = userInput else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    
    return userInput
}
