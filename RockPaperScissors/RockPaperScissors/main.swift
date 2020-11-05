
import Foundation

enum GameResult {
    case win
    case draw
    case lose
}

enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

/// 가위바위보 결과 판별
func scissorsRockPaperResult(myHand: Hand, otherHand: Hand) -> GameResult {
    guard myHand != otherHand else {
        return GameResult.draw
    }
    
    var gameResult: GameResult
    
    switch myHand {
    case .scissors:
        gameResult = (otherHand == .paper) ? .win : .lose
    case .rock:
        gameResult = (otherHand == .scissors) ? .win : .lose
    case .paper:
        gameResult = (otherHand == .rock) ? .win : .lose
    }
    
    return gameResult
}

func printResultMessage(gameResult: GameResult) {
    switch gameResult {
    case .win:
        print("이겼습니다!")
    case .draw:
        print("비겼습니다!")
    case .lose:
        print("졌습니다!")
    }
}

func scissorsRockPaper() {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        // 사용자 입력 받기
        guard let input = readLine(), let inputNumber = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        guard inputNumber != 0 else {
            print("게임 종료")
            break
        }
        
        guard let myHand = Hand(rawValue: inputNumber),
            let computerHand = Hand(rawValue: Int.random(in: 1...3)) else {
            break
        }
        
        let gameResult = scissorsRockPaperResult(myHand: myHand, otherHand: computerHand)
        
        print("\(myHand)(나) vs \(computerHand)(컴) : " , terminator: "")
        printResultMessage(gameResult: gameResult)
        
        if gameResult != GameResult.draw {
            break
        }
    }

}

scissorsRockPaper()
