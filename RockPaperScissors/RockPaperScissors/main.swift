import Foundation

func startGame() {
    showMenuMessage()
    
    if let userInput = readLine() {
        switch userInput {
        case "0":
            print("게임종료")
        case "1": ""
        case "2": ""
        case "3": ""
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }
}

func showMenuMessage() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        
    print(menuMessage, terminator: " ")
}

startGame()
