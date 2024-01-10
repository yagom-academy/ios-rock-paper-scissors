//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//
struct errorCode {
    static let wrongInput = -1
}

enum Gesture: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum MookZziPpaGesture: Int {
    case mook = 1
    case zzi = 2
    case ppa = 3
}
enum Player: String {
    case computer = "컴퓨터"
    case user = "유저"
}
func computerPlay() -> Int {
    let computerSelect = Int.random(in: 1...3)
    
    return computerSelect
}

func userInput() -> Int {
    let inputList: Array<Int> = [0, 1, 2, 3]
    
    guard let input = readLine(), !input.isEmpty else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return errorCode.wrongInput
    }
    guard let inputInt = Int(input), inputList.contains(inputInt) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return errorCode.wrongInput
    }
    
    return inputInt
}

func rockScissorsPaper() {
    var repeatFlag: Bool = false
    
    repeat {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let computerNumber = computerPlay()
        let userInput = userInput()

        guard executeGame(userInput: userInput) else {
            repeatFlag = false
            return
        }
        
        if userInput == errorCode.wrongInput {
            print("공백 들어오는지 체크")
            repeatFlag = true
            continue
        }
        
        guard let gesture = Gesture(rawValue: computerNumber) else {
            return
        }
        switch gesture {
        case .scissors:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.scissors, .paper])
        case .rock:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.paper, .scissors])
        case .paper:
            repeatFlag = gameResult(userInput: userInput, gameCase: [.scissors, .rock])
        }
    } while repeatFlag
}

func executeGame(userInput: Int) -> Bool {
    if userInput == 0 {
        print("게임 종료")
        return false
    }
    return true
}

var turnHolder = Player.user

func gameResult(userInput: Int, gameCase: [Gesture]) -> Bool {
    let userGesture = Gesture(rawValue: userInput)
    let userWin = gameCase[0] == userGesture
    let userLose = gameCase[1] == userGesture
    
    if userWin {
        print("이겼습니다!")
        playMookZziPpa(turnHolder: turnHolder)
        return false
    } else if userLose {
        print("졌습니다!")
        turnHolder = Player.computer
        playMookZziPpa(turnHolder: turnHolder)
        return false
    } else {
        print("비겼습니다!")
        return true
    }
}

rockScissorsPaper()

func playMookZziPpa(turnHolder: Player) {
    var turn = turnHolder

    print("[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0>:")
    
    //묵찌빠

    let computerNumber = computerPlay()
    print("[컴퓨터가 고른 수: \(computerNumber) ]")
    let userInput = userInput()

    
    let gesture = [0, 1, 2, 3]
    

    //잘못된 입력을 한 경우 컴퓨터에게 턴을 넘긴다.
    guard gesture.contains(0), gesture.contains(1), gesture.contains(2), gesture.contains(3) else {
        turn = Player.computer
        print("잘못된 입력으로 컴퓨터에게 턴을 넘깁니다.")
        return
    }
    
    //턴잡이가 이겼을때
    if userInput == MookZziPpaGesture.zzi.rawValue && computerNumber == MookZziPpaGesture.ppa.rawValue {
        turn = Player.user
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 턴입니다.")
        playMookZziPpa(turnHolder: turn)
    }
    if userInput == MookZziPpaGesture.mook.rawValue && computerNumber == MookZziPpaGesture.zzi.rawValue {
        turn = Player.user
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 턴입니다.")
        playMookZziPpa(turnHolder: turn)
    }
    if userInput == MookZziPpaGesture.ppa.rawValue && computerNumber == MookZziPpaGesture.mook.rawValue {
        turn = Player.user
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 턴입니다.")
        playMookZziPpa(turnHolder: turn)
    }
    
    //턴잡이가 졌을때
    if userInput == MookZziPpaGesture.zzi.rawValue && computerNumber == MookZziPpaGesture.mook.rawValue {
        turn = Player.computer
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 턴입니다.")
        playMookZziPpa(turnHolder: turn)
    }
    if userInput == MookZziPpaGesture.mook.rawValue && computerNumber == MookZziPpaGesture.ppa.rawValue {
        turn = Player.computer
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 턴입니다.")
        playMookZziPpa(turnHolder: turn)
    }
    if userInput == MookZziPpaGesture.ppa.rawValue && computerNumber == MookZziPpaGesture.zzi.rawValue {
        turn = Player.computer
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 턴입니다.")
        playMookZziPpa(turnHolder: turn)
    }
    
    // 비겼을때 턴을 가진 사람의 승리 판정 후 게임 종료.
    if userInput == MookZziPpaGesture.zzi.rawValue && computerNumber == MookZziPpaGesture.zzi.rawValue {
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 승리!")
    }
    if userInput == MookZziPpaGesture.mook.rawValue && computerNumber == MookZziPpaGesture.mook.rawValue {
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 승리!")
    }
    if userInput == MookZziPpaGesture.ppa.rawValue && computerNumber == MookZziPpaGesture.ppa.rawValue {
        print("유저입력: \(userInput), 컴퓨터입력: \(computerNumber)")
        print("\(turn.rawValue)의 승리!")
    }
}
