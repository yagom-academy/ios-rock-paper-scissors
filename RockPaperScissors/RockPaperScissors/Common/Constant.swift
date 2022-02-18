//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
//

enum Setting {
    static let exitCode = 0
}

enum GameDisplayMessage {
    static let menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    static let playerTurnMukzzippaMenu = "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let computerTurnMukzzippaMenu = "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let isPlayerTurn = "사용자의 턴입니다"
    static let isComputerTurn = "컴퓨터의 턴입니다"
    static let gameDidEnd = "게임 종료"
    static let playerDidWin = "이겼습니다!"
    static let playerDidLose = "졌습니다!"
    static let playerDidDraw = "비겼습니다!"
    static let mukzzippaPlayerDidWin = "사용자의 승리!"
    static let mukzzippaPlayerDidLose = "컴퓨터의 승리!"
    static let invalidPlayerInput = "잘못된 입력입니다. 다시 시도해주세요."
    static let error = "에러가 발생했습니다. 게임을 다시 실행시켜 주세요."
}

enum GameResult {
    case playerWin
    case playerLose
    case playerDraw
}
