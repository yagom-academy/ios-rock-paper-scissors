import Foundation

enum RPS: Int {
    case Rock = 1, Paper, Scissors
}

func gameStart() {
    while true {
        let computerNumber = Int.random(in: 1...3)
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: "")
        guard let userInput = readLine(), let userNumber = Int(userInput), 0...3 ~= userNumber else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        if userNumber == 0 {
            break
        }
        
        let result = computerNumber - userNumber
        
        if result == -2 || result == 1 {
            print("이겼습니다!")
        } else if result == -1 || result == 2 {
            print("졌습니다")
        } else {
            print("비겼습니다!")
        }
    }
}

gameStart()
