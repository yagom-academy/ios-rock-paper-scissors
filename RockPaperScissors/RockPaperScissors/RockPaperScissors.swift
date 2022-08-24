//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by woong, mene on 22/8/2022.
//

import Foundation

func compareHand(with computer: Hand, and user: Hand) -> Result {
    switch (computer, user) {
    case (.rock, .paper), (.paper, .scissor), (.scissor, .rock):
        return .win
    case (.rock, .scissor), (.paper, .rock), (.scissor, .paper):
        return .lose
    default:
        return .draw
    }
}

func display(of result: Result) {
    print(result.rawValue)
}

func compareMukJjiPpa(with computer: MukJjiPpa, and user: MukJjiPpa) -> MukJjiPpaResult {
    
}

func playMukJjiPpaGame() {
    let randomComputerMukJjiPpa: MukJjiPpa = MukJjiPpa(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
    
    print("[*** 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = MukJjiPpa(rawValue: inputNumber) else {
        
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return // 턴을바꾼다.
    
}
    let mukJjiPpaResult: MukJjiPpaResult = compareMukJjiPpa(with: randomComputerMukJjiPpa, and: result)
    
    
    
//[*** 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :
//[*** 턴] 위치에는 현재 누구의 턴인지 표시합니다.
//가위, 바위, 보 게임 혹은 지난 턴에서 이긴 사람이 턴을 쥡니다.
//잘못된 입력을 한 경우 컴퓨터에게 턴을 넘깁니다.
//사용자에게 0, 1, 2, 3 중 한 가지를 입력받아 결과를 출력합니다.
//사용자의 패와 컴퓨터의 패가 동일한 경우 : 턴을 쥐고 있는 쪽이 승리합니다.
//“***의 승리!” 출력 후 게임 종료
//사용자의 패와 컴퓨터의 패가 다른 경우 : 이긴 쪽이 턴을 쥡니다.
//“***의 턴입니다” 출력 후 묵, 찌, 빠 계속 실행
//0을 입력받은 경우 : 게임 종료

func startGame() {
    let randomComputerHand: Hand = Hand(rawValue: Int.random(in: 1...3)).unsafelyUnwrapped
    
    print("computerHand : \(randomComputerHand)")
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let inputNumberString = readLine(),
          let inputNumber = Int(inputNumberString),
          let result = Hand(rawValue: inputNumber) else {
        
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame()
    }
    
    switch result {
    case .none:
        print("게임종료")
    case .rock, .scissor, .paper:
        let gameResult: Result = compareHand(with: randomComputerHand, and: result)
        display(of: gameResult)
        
        if gameResult == Result.draw {
            startGame()
        } else {
            playMukJjiPpaGame()
        }
    }
}

//Step 2 : 묵찌빠 게임 구현
//Step 1의 게임 중 가위, 바위, 보 후에 결과에 따라 게임을 이어갑니다.
//가위, 바위, 보를 비긴 경우 : 다시 가위, 바위, 보 게임 진행
//가위, 바위, 보 게임에서 승패가 갈린 경우 : 묵찌빠로 이어서 게임 진행
//묵, 찌, 빠 실행 시 출력
//[*** 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :
//[*** 턴] 위치에는 현재 누구의 턴인지 표시합니다.
//가위, 바위, 보 게임 혹은 지난 턴에서 이긴 사람이 턴을 쥡니다.
//잘못된 입력을 한 경우 컴퓨터에게 턴을 넘깁니다.
//사용자에게 0, 1, 2, 3 중 한 가지를 입력받아 결과를 출력합니다.
//사용자의 패와 컴퓨터의 패가 동일한 경우 : 턴을 쥐고 있는 쪽이 승리합니다.
//“***의 승리!” 출력 후 게임 종료
//사용자의 패와 컴퓨터의 패가 다른 경우 : 이긴 쪽이 턴을 쥡니다.
//“***의 턴입니다” 출력 후 묵, 찌, 빠 계속 실행
//0을 입력받은 경우 : 게임 종료
