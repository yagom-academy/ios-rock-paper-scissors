import Foundation


enum Message: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
    case exit = "게임 종료"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

func selectOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    guard let option = readLine() else {
        print(Message.wrongInput.rawValue)
        return
    }
    checkValidInput(option: option)
}

func checkValidInput(option: String) {
    if option == "1" || option == "2" || option == "3" {
        startGame(option: option)
    } else if option == "0" {
        print(Message.exit.rawValue)
    } else {
        print(Message.wrongInput.rawValue)
        selectOption()
    }
}

func startGame(option: String) {
    
}

selectOption()
