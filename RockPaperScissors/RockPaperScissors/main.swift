
func matchResult(_ user: Int, _ computer: Int) {
    switch user {
    case 0:
        "exit"
        case us
    default:
        <#code#>
    }
}

func rockPaperScissors() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else {
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        rockPaperScissors()
        return
    }

    var userPick = 0
    let computerPick = Int.random(in: 1...3)
    
    switch input {
    case "0", "1", "2", "3" :
        userPick = Int(input)!
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        rockPaperScissors()
    }

    switch userPick {
    case 0:
        break
    case computerPick:
        print("비겼습니다!")
        rockPaperScissors()
    case computerPick + 1, computerPick - 2:
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }
}


func mukzzipa(_ userPicked: Int, _ computerPicked: Int) {
    switch userPicked {
    case computerPicked + 1, computerPicked - 2 :
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    default :
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    // 가위바위보 결과, 이기고 진 경우에만 들어갈 함수이기 때문에 2가지 case만 필요
    }
    
    guard let mukzzipaInput = readLine() else {
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        mukzzipa(computerPicked, userPicked)
        // 승패가 바뀌는 것과 같으니 입력값을 서로 바꿔준다.
        return
    }

    var mukzzipaUserPick = 0
    let mukzzipaComputerPick = Int.random(in: 1...3)
    
    switch mukzzipaInput {
    case "0", "1", "2", "3" :
        mukzzipaUserPick = Int(mukzzipaInput)!
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        mukzzipa(computerPicked, userPicked)
        // 승패가 바뀌는 것과 같으니 입력값을 서로 바꿔준다.
    }
    
}

