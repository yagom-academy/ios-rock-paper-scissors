


while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { break }

    var userPick = 0
    let comPick = Int.random(in: 1...3)
    
    switch input {
    case "0","1","2","3" :
        userPick = Int(input)!
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
    }

    switch userPick {
    case 0:
        break
    case comPick :
        print("비겼습니다!")
    case comPick + 1, comPick - 2 :
        print("이겼습니다!")
        break
    default:
        print("졌습니다!")
        break
    }
}

