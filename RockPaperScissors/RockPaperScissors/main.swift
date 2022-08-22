func gameStart() {
    var isGame = true
    while isGame {
        let computerNumber = Int.random(in: 1...3)
        
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let userNumber = fetchUserInput(), 0...3 ~= userNumber else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            continue
        }
        
        if userNumber == 0 {
            print("게임 종료")
            break
        }
        
        switch computerNumber - userNumber {
        case -2, 1:
            print("이겼습니다!")
            isGame = false
        case -1, 2:
            print("졌습니다!")
            isGame = false
        default:
            print("비겼습니다!")
        }
//        compare(computerNumber: computerNumber, userNumber: userNumber)
        
    }
}

func fetchUserInput() -> Int? {
    guard let userInput = readLine(), let userNumber = Int(userInput) else { return nil }
    return userNumber
}



//func compare(computerNumber: Int, userNumber: Int) {
//    switch computerNumber - userNumber {
//    case 1...3:
//        showResult()
//    case 0:
//        print("게임 종료")
//        return
//    default:
//        print("잘못된 입력입니다. 다시 시도해주세요.")
//    }
//}
//
//func showResult(computerNumber: Int) {
//    if result == -2 || result == 1 {
//        print("이겼습니다!")
//    } else if result == -1 || result == 2 {
//        print("졌습니다")
//    } else {
//        print("비겼습니다!")
//    }
//}
gameStart()
