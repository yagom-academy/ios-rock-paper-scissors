//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//게임의 승자를 알려주는 열거형 선언
enum GameWinner: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

//가위바위보 게임결과를 알려주는 열거형 선언
enum RockPaperScissorGameResult: String {
    case win = "이겼습니다."
    case lose = "졌습니다."
    case draw = "비겼습니다."
}

//가위바위보 게임결과 프린트하는 함수
func printRockPaperScissorGameResult(_ gameResult: RockPaperScissorGameResult) {
    switch gameResult {
    case .win:
        print(gameResult.rawValue)
    case .lose:
        print(gameResult.rawValue)
    default:
        print(gameResult.rawValue)
    }
}

//묵찌빠 게임결과를 알려주는 열거형 선언
enum MukChiPaGameResult: String {
    case win = "이겼습니다."
    case lose = "졌습니다."
    case gameover = "승리."
}

//묵찌빠 게임결과 프린트하는 함수
func printMukChiPaGameResult(_ gameResult: MukChiPaGameResult) {
    switch gameResult {
    case .win:
        print(gameResult.rawValue)
    case .lose:
        print(gameResult.rawValue)
    default:
        print(gameResult.rawValue)
    }
}

//userPick을 이용해 사용자의 가위,바위,보 호출
func printUserPick(_ userPick: Int) {
    switch userPick {
    case 1:
        print("사용자 : 가위")
    case 2:
        print("사용자 : 바위")
    default:
        print("사용자 : 보")
    }
}

//랜덤변수 computerPick을 이용해 컴퓨터의 가위,바위,보 호출
func printComputerPick(_ computerPick: Int) {
    switch computerPick {
    case 1:
        print("컴퓨터 : 가위")
    case 2:
        print("컴퓨터 : 바위")
    default:
        print("컴퓨터 : 보")
    }
}

//패 비교만 하는걸로 정리
//의도는 야곰의 피드백처럼 패를 비교하는것과 결과출력을 분리하였는데
//함수 안에 결과를 프린팅하는 함수를 호출하는 코드가 있어서 의도에 맞게 코드르 수정한건지 의문이 든다..
func comparePickForRockPaperScissor(_ usersPick: Int, _ computerPick: Int) {
    var rockPaperScissorWinner: GameWinner
    var rockPaperScissorGameResult: RockPaperScissorGameResult
    
    if usersPick == computerPick{
        rockPaperScissorGameResult = .draw
        printRockPaperScissorGameResult(rockPaperScissorGameResult)
        rockPaperScissors()
    } else if usersPick == 1 {
        switch computerPick {
        case 2:
            rockPaperScissorGameResult = .lose
            printRockPaperScissorGameResult(rockPaperScissorGameResult)
            rockPaperScissorWinner = .computer
            mukChiPa(rockPaperScissorWinner)
        default:
            rockPaperScissorGameResult = .win
            printRockPaperScissorGameResult(rockPaperScissorGameResult)
            rockPaperScissorWinner = .user
            mukChiPa(rockPaperScissorWinner)
        }
    } else if usersPick == 2 {
        switch computerPick {
        case 1:
            rockPaperScissorGameResult = .win
            printRockPaperScissorGameResult(rockPaperScissorGameResult)
            rockPaperScissorWinner = .user
            mukChiPa(rockPaperScissorWinner)
        default:
            rockPaperScissorGameResult = .lose
            printRockPaperScissorGameResult(rockPaperScissorGameResult)
            rockPaperScissorWinner = .computer
            mukChiPa(rockPaperScissorWinner)
        }
    } else  {
        switch computerPick {
        case 1:
            rockPaperScissorGameResult = .lose
            printRockPaperScissorGameResult(rockPaperScissorGameResult)
            rockPaperScissorWinner = .computer
            mukChiPa(rockPaperScissorWinner)
        default:
            rockPaperScissorGameResult = .win
            printRockPaperScissorGameResult(rockPaperScissorGameResult)
            rockPaperScissorWinner = .user
            mukChiPa(rockPaperScissorWinner)
        }
    }
}

//묵찌빠에서 패비교
func comparePickForMukChiPa(_ usersPick: Int, _ computerPick: Int, _ Winner: GameWinner) {
    var mukChiPaWinner: GameWinner
    var mukChiPaGameResult: MukChiPaGameResult
    
    if usersPick == computerPick{
        mukChiPaGameResult = .gameover
        mukChiPaWinner = Winner
        print(Winner.rawValue, terminator: "의 ")
        printMukChiPaGameResult(mukChiPaGameResult)
    } else if usersPick == 1 {
        switch computerPick {
        case 2:
            mukChiPaGameResult = .lose
            printMukChiPaGameResult(mukChiPaGameResult)
            mukChiPaWinner = .computer
            mukChiPa(mukChiPaWinner)
        default:
            mukChiPaGameResult = .win
            printMukChiPaGameResult(mukChiPaGameResult)
            mukChiPaWinner = .user
            mukChiPa(mukChiPaWinner)
        }
    } else if usersPick == 2 {
        switch computerPick {
        case 1:
            mukChiPaGameResult = .win
            printMukChiPaGameResult(mukChiPaGameResult)
            mukChiPaWinner = .user
            mukChiPa(mukChiPaWinner)
        default:
            mukChiPaGameResult = .lose
            printMukChiPaGameResult(mukChiPaGameResult)
            mukChiPaWinner = .computer
            mukChiPa(mukChiPaWinner)
        }
    } else  {
        switch computerPick {
        case 1:
            mukChiPaGameResult = .lose
            printMukChiPaGameResult(mukChiPaGameResult)
            mukChiPaWinner = .computer
            mukChiPa(mukChiPaWinner)
        default:
            mukChiPaGameResult = .win
            printMukChiPaGameResult(mukChiPaGameResult)
            mukChiPaWinner = .user
            mukChiPa(mukChiPaWinner)
        }
    }
}

//rockPaperScissors()에서 승패가 갈린경우 mukChiPa()호출!
func mukChiPa(_ Winner: GameWinner) {
    print("[\(Winner.rawValue) 턴] 묵(1),찌(2),빠(3)! <종료 : 0> : ", terminator : "")
    guard let pick = readLine() else { return }
    guard let userPick = Int(pick) else { return }
    let computerPick = Int.random(in: 1...3)

    switch userPick {
    case 0 :
        print("묵찌빠 프로그램이 종료됩니다.")
        break
    case 1 :
        printUserPick(userPick)
        printComputerPick(computerPick)
        comparePickForMukChiPa(userPick, computerPick, Winner)
    case 2 :
        printUserPick(userPick)
        printComputerPick(computerPick)
        comparePickForMukChiPa(userPick, computerPick, Winner)
    case 3 :
        printUserPick(userPick)
        printComputerPick(computerPick)
        comparePickForMukChiPa(userPick, computerPick, Winner)
// 잘못된 입력을 한 경우 컴퓨터에게 턴을 넘깁니다
    default:
        print("잘못된 입력입니다. 컴퓨터에게 턴을 넘깁니다.")
        mukChiPa(.computer)
    }
}

func rockPaperScissors() {
    print("가위(1),바위(2),보(3)! <종료 : 0> : ", terminator : "")
    guard let pick = readLine() else { return }
    guard let userPick = Int(pick) else { return }
    let computerPick = Int.random(in: 1...3)

    switch userPick {
    case 0 :
        print("가위바위보 프로그램이 종료됩니다.")
        break
    case 1 :
        printUserPick(userPick)
        printComputerPick(computerPick)
        comparePickForRockPaperScissor(userPick, computerPick)
    case 2 :
        printUserPick(userPick)
        printComputerPick(computerPick)
        comparePickForRockPaperScissor(userPick, computerPick)
    case 3 :
        printUserPick(userPick)
        printComputerPick(computerPick)
        comparePickForRockPaperScissor(userPick, computerPick)
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.")
//한줄안띄워주면 눈이 너무 아파서 한줄개행
//        print()
//왜 여기만 눈이 아픈지 생각해보기, 그냥 기분탓이였던거 같다.. 개행을할꺼면 통일성있게 모든 입력을 받는경우 그 후 개행을 해주거나 그렇지않거나 하는게 좋을것같다
        rockPaperScissors()
    }
}

rockPaperScissors()
