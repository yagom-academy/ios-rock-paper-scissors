//  RockPaperScissors - MookZziBba.swift
//  Created by vetto, songjun on 2022.12.28

func printTurnAndMenu(turn: Winner) {
    print("[\(turn.rawValue)턴] 묵(1), 찌(2), 빠(3)! <종료: 0> :", terminator: " ")
}

func convertNumberToMookZziBba(number: Int) -> MookZziBba {
    guard let hand = MookZziBba(rawValue: number) else {
        return MookZziBba.wrongHand
    }
    return hand
}

func decideMookZziBbaWinner(turn: Winner,
                     _ userHand: MookZziBba,
                     _ computerHand: MookZziBba) -> (Winner, Turn) {
    switch (turn, userHand, computerHand) {
    case (.user, .mook, .mook), (.user, .zzi, .zzi), (.user, .bba, .bba):
        return (.user, .userTurn)
    case (.computer, .mook, .mook), (.computer, .zzi, .zzi), (.computer, .bba, .bba):
        return (.computer, .computerTurn)
    case (.user, .mook, .zzi), (.user, .zzi, .bba), (.user, .bba, .mook):
        return (.draw, .userTurn)
    case (.computer, .mook, .zzi), (.computer, .zzi, .bba), (.computer, .bba, .mook):
        return (.draw, .computerTurn)
    case (.user, .zzi, .mook), (.user, .bba, .zzi), (.user, .mook, .bba):
        return (.draw, .computerTurn)
    default:
        return (.draw, .userTurn)
    }
}

func startMookZziBbaGame(turn: Winner) {
    do {
        printTurnAndMenu(turn: turn)
        
        let inputtedNumber = try inputUserNumber()
        
        switch inputtedNumber {
        case 0:
            print("게임종료")
        case 1, 2, 3:
            let userHand = convertNumberToMookZziBba(number: inputtedNumber)
            let computerHand = convertNumberToMookZziBba(number: makeRandomComputerNumber())
            let resultAndTurn = decideMookZziBbaWinner(turn: turn, userHand, computerHand)
            let result = resultAndTurn.0
            let turn = resultAndTurn.1
            
            switch (result, turn) {
            case (.user, .userTurn):
                print("\(turn.rawValue)의 승리!")
            case (.computer, .computerTurn):
                print("\(turn.rawValue)의 승리!")
            case (.draw, .userTurn):
                print("\(turn.rawValue)의 턴입니다.")
                startMookZziBbaGame(turn: .user)
            default:
                print("\(turn.rawValue)의 턴입니다.")
                startMookZziBbaGame(turn: .computer)
            }
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startMookZziBbaGame(turn: .computer)
        }
    } catch InputError.invalidInput {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startMookZziBbaGame(turn: .computer)
    } catch {
        print(error)
    }
}
