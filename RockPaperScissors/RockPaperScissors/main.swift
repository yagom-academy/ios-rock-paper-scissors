//  2020.11.04 Green written

import Foundation

//가위바위보 함수
func scissorsRockPaper () {
    print("가위(1), 바위(2), 보(3)!<종료 : 0> : ", terminator: " ")

    guard let users: String = readLine() else {return}
    let computer = Int.random(in: 1...3)
    var result: String? //옵셔널을 통해 초기값이 nil이더라도 오류나지 않도록 처리

    if ((users=="1" && computer==1) || (users=="2" && computer==2) || (users=="3" && computer==3)) {
        result = "draw"
    } else if ((users=="1" && computer==3) || (users=="2" && computer==1) || (users=="3" && computer==2)) {
        result = "win"
    } else if ((users=="1" && computer==2) || (users=="2" && computer==3) || (users=="3" && computer==1)) {
        result = "lose"
    } else if (users=="0") {
        return
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        scissorsRockPaper()
    }

    switch result {
    case "win":
        print("이겼습니다!")
        rockScissorsPaper(result: "win")
    case "lose":
        print("졌습니다!")
        rockScissorsPaper(result: "lose")
    case "draw":
        print("비겼습니다!")
        scissorsRockPaper()
    default:
        break //스위치문 안 케이스 조건 루프임으로 루프를 탈출시키려하여 break
    }
}

//묵찌빠 함수
func rockScissorsPaper(result: String) {
    switch result {
    case "lose":
        print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> : ",terminator: " ")
        guard let users: String = readLine() else{return}
        let computer = Int.random(in: 1...3)

        if ((users=="1" && computer==2) || (users=="2" && computer==3) || (users=="3" && computer==1)) {
            print("사용자의 턴입니다")
            rockScissorsPaper(result: "win")
        } else if ((users=="1" && computer==3) || (users=="2" && computer==1) || (users=="3" && computer==2)) {
            print("컴퓨터의 턴입니다")
            rockScissorsPaper(result: "lose")
        } else if ((users=="1" && computer==1) || (users=="2" && computer==2) || (users=="3" && computer==3)) {
            print("컴퓨터의 승리!")
            break
        } else if (users=="0") {
            print("게임 종료")
            break
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            rockScissorsPaper(result: "lose")
        }
    case "win":
        print("[사용자 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> : ",terminator: " ")
        guard let users: String = readLine() else{return}
        let computer = arc4random_uniform(3) + 1

        if ((users=="1" && computer==2) || (users=="2" && computer==3) || (users=="3" && computer==1)) {
            print("사용자의 턴입니다")
            rockScissorsPaper(result: "win")
        } else if ((users=="1" && computer==3) || (users=="2" && computer==1) || (users=="3" && computer==2)) {
            print("컴퓨터의 턴입니다")
            rockScissorsPaper(result: "lose")
        } else if ((users=="1" && computer==1) || (users=="2" && computer==2) || (users=="3" && computer==3)) {
            print("사용자의 승리!")
            break
        } else if (users=="0") {
            print("게임 종료")
            break
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            rockScissorsPaper(result: "lose")
        }
        default:
            break
    }
}

//게임 호출
scissorsRockPaper()









