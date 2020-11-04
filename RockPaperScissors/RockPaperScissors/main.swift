


while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine() else { break }
    guard var userPick: Int = Int(input) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        break
    }
    var comPick = Int.random(in: 1...3)
    
    
    
}

