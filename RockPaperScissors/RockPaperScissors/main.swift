
func rockPaperScissors() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { return }

    var userPick = 0
    let computerPick = Int.random(in: 1...3)
    
    switch input {
    case "0","1","2","3" :
        userPick = Int(input)!
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        rockPaperScissors()
    }

    switch userPick {
    case 0:
        break
    case computerPick :
        print("비겼습니다!")
        rockPaperScissors()
    case computerPick + 1, computerPick - 2 :
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }
}

rockPaperScissors()
