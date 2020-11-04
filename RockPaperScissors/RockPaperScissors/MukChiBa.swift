func mukChiBa(winner: state) {
    var result: state = winner
    
    while true {
        var winnerName: String = ""
        
        if result == .win {
            winnerName = "사용자"
        } else if result == .lose {
            winnerName = "컴퓨터"
        }
        
        print("[\(winnerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        if let input: String = readLine() {
            if let userRPSValue: Int = Int(input) {
                let computerRPSValue: Int = Int.random(in: 1...3)
                print("컴퓨터 값: \(computerRPSValue)")
                switch userRPSValue {
                case 0:
                    print("게임 종료")
                    return
                case 1:
                    if computerRPSValue == 1 {
                        if result == .win {
                            print("사용자의 승리")
                        } else if result == .lose {
                            print("컴퓨터의 승리")
                        }
                        return
                    } else if computerRPSValue == 2 {
                        result = .win
                        print("사용자의 턴입니다.")
                    } else if computerRPSValue == 3 {
                        result = .lose
                        print("컴퓨터의 턴입니다.")
                    }
                case 2:
                    if computerRPSValue == 1 {
                        result = .win
                        print("컴퓨터의 턴입니다.")
                    } else if computerRPSValue == 2 {
                        if result == .win {
                            print("사용자의 승리")
                        } else if result == .lose {
                            print("컴퓨터의 승리")
                        }
                        return
                    } else if computerRPSValue == 3{
                        result = .win
                        print("사용자의 턴입니다.")
                    }
                case 3:
                    if computerRPSValue == 1 {
                        result = .win
                        print("사용자의 턴입니다.")
                    } else if computerRPSValue == 2{
                        result = .lose
                        print("컴퓨터의 턴입니다.")
                    } else {
                        if result == .win {
                            print("사용자의 승리")
                        } else if result == .lose {
                            print("컴퓨터의 승리")
                        }
                        return
                    }
                default:
                    print("잘못된 입력입니다. 다시 시도해주세요.")
                }
            }
        }
    }
}

