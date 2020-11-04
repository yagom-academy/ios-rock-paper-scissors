


while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { break }

    var userPick = 0
    let comPick = Int.random(in: 1...3)
    
    switch input {
    case "0"..."4" :
        userPick = Int(input)!
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
    }

}

