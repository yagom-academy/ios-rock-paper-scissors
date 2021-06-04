import Foundation

var mookJjiBbaMode: Bool = false
var userTurn: Bool = false
var computerTurn: Bool = false

func startGame() {
    printWhichModeSetting()
    let userNumber = userInput()
    isMookJjiBba(userNumber: userNumber)
}

func printWhichModeSetting() {
    
    if mookJjiBbaMode == true {
        print("묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator:" ")
    }
    else {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator:" ")
    }
}

func userInput() -> Int {
    
    guard let stringInput = readLine(),
          let intInput = Int(stringInput),
          (intInput >= 0 && intInput <= 3) else {
        wrongInputAction()
        
        return userInput()
    }
    
    return intInput
}

func wrongInputAction() {
    
    if mookJjiBbaMode == false {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator:" ")
    } else if mookJjiBbaMode == true {
        print("[컴퓨터 턴]", terminator:" ")
        userTurn = false
        computerTurn = true
        startGame()
    }
}

func isMookJjiBba(userNumber: Int) {
    
    if mookJjiBbaMode == false {
        rockScissorsPaperProcessSeparator(userNumber: userNumber)
    } else if mookJjiBbaMode == true {
        mookJjiBbaProcessSeparator(userNumber: userNumber)
    }
}

func mookJjiBbaProcessSeparator(userNumber: Int) {
    let exitNumber = 0
    
    switch userNumber {
    case exitNumber:
        print("게임종료")
    case 1, 2, 3:
        judgeMookJjiBbaResult(userNumber: userNumber)
    default:

        return
    }
}

func rockScissorsPaperProcessSeparator(userNumber: Int) {
    let exitNumber = 0
    
    switch userNumber {
    case exitNumber:
        print("게임종료")
    case 1, 2, 3:
        judgeRockScissorsPaperResult(userNumber: userNumber)
    default:

        return
    }
}

func generateComputernumber() -> Int {
    return Int.random(in: 1...3)
}

func judgeRockScissorsPaperResult(userNumber: Int) {
    let randomComputernumber = generateComputernumber()
    let judgingIndicator = userNumber - randomComputernumber
    
    if judgingIndicator == 0 {
        print("비겼습니다.")
        
        return startGame()
    } else if judgingIndicator == -1 || judgingIndicator == 2 {
        print("졌습니다!")
        print("[컴퓨터 턴] ", terminator:" ")
        mookJjiBbaMode = true
        computerTurn = true
        
        return startGame()
    } else {
        print("이겼습니다!")
        print("[사용자 턴] ", terminator:" ")
        mookJjiBbaMode = true
        userTurn = true
        
        return startGame()
    }
}

func judgeMookJjiBbaResult(userNumber: Int) {
    let randomComputernumber = generateComputernumber()
    let judgingIndicator = userNumber - randomComputernumber

    if judgingIndicator == -1 || judgingIndicator == 2 {
        print("사용자 턴입니다.")
        print("[사용자 턴] ", terminator:" ")
        userTurn = true
        computerTurn = false
        
        return startGame()

    } else if judgingIndicator == 1 || judgingIndicator == -2 {
        print("컴퓨터 턴입니다.")
        print("[컴퓨터 턴] ", terminator:" ")
        userTurn = false
        computerTurn = true
        
        return startGame()

    } else if judgingIndicator == 0 && userTurn == true  {
        print("사용자의 승리!")
        userTurn = false
        mookJjiBbaMode = false
        
        return startGame()

    } else if judgingIndicator == 0 && computerTurn == true  {
        print("컴퓨터의 승리!")
        userTurn = false
        mookJjiBbaMode = false
        
        return startGame()
    }
}

startGame()
