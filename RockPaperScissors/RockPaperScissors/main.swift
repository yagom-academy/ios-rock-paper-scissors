// STEP 1. 가위바위보

var userPick: String = ""
var computerPick: String = ""
var matchResult: result = .draw
// 초기화는 뭘로 해둬야 적절하지?

func userInput() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else {
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        userInput()
        return
    }
    
    switch input {
    case "0":
        userPick = "종료"
    case "1":
        userPick = "가위"
    case "2":
        userPick = "바위"
    case "3":
        userPick = "보"
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        userInput()
    }
    
    computerChoice()
}

func computerChoice() {
    let ableToPick = ["가위", "바위", "보"]
    if let computers = ableToPick.randomElement() {
        computerPick = computers
    }else {
        print("컴퓨터가 무엇을 낼지 고르지 못하고 있습니다..")
        return
    }
}

enum result {
    case userWin
    case computerWin
    case draw
    case exit
}

func compare(users: String, computers: String) {
    if users == computers {
        matchResult = .draw
    } else if (users == "바위" && computers == "가위") || (users == "가위" && computers == "보") || (users == "보" && computers == "바위") {
        matchResult = .userWin
    } else if (users == "바위" && computers == "보") || (users == "가위" && computers == "바위") || (users == "보" && computers == "가위") {
        matchResult = .computerWin
    } else if users == "종료" {
        matchResult = .exit
    }
}

func rockScissorsPaper() {
    userInput()
    compare(users: userPick, computers: computerPick)
    
    switch matchResult {
    case .exit:
        break
    case .draw:
        print("비겼습니다!")
        rockScissorsPaper()
    case .userWin:
        print("이겼습니다!")
    case .computerWin:
        print("졌습니다!")
    }
}


// STEP 2. 묵찌빠

func inputUsersTurn() {
    print("[사용자 턴] 가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else {
        print("잘못된 입력값입니다. 턴이 넘어갑니다.")
        inputComputersTurn()
        return
    }
    
    switch input {
    case "0":
        userPick = "종료"
    case "1":
        userPick = "가위"
    case "2":
        userPick = "바위"
    case "3":
        userPick = "보"
    default :
        print("잘못된 입력값입니다. 턴이 넘어갑니다.")
        inputComputersTurn()
    }
    
    computerChoice()
}

// 컴퓨터의 턴에는 잘못 입력해도 턴이 바뀌면 안된다.
func inputComputersTurn() {
    print("[컴퓨터 턴] 가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else {
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        inputComputersTurn()
        return
    }
    
    switch input {
    case "0":
        userPick = "종료"
    case "1":
        userPick = "가위"
    case "2":
        userPick = "바위"
    case "3":
        userPick = "보"
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        inputComputersTurn()
    }
    
    computerChoice()
}

func usersTurn() {
    inputUsersTurn()
    compare(users: userPick, computers: computerPick)
    
    switch matchResult {
    case .exit:
        break
    case .draw:
        print("이겼습니다!")
    case .userWin:
        usersTurn()
    case .computerWin:
        computersTurn()
    }
}

func computersTurn() {
    inputComputersTurn()
    compare(users: userPick, computers: computerPick)
    
    switch matchResult {
    case .exit:
        break
    case .draw:
        print("졌습니다!")
    case .userWin:
        usersTurn()
    case .computerWin:
        computersTurn()
    }
}


func playMukzzipa() {
    userInput()
    compare(users: userPick, computers: computerPick)
    
    switch matchResult {
    case .exit:
        break
    case .draw:
        print("비겼습니다!")
        playMukzzipa()
    case .userWin:
        print("이겼습니다!")
        usersTurn()
    case .computerWin:
        print("졌습니다!")
        computersTurn()
    }
}

playMukzzipa()
