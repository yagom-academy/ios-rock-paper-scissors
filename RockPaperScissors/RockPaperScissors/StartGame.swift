//  RockPaperScissors - StartGame.swift
//  Created by vetto, songjun on 2022.12.29.

func runGame() {
    guard let winner = startRockPaperScissorsGame() else {
        print("게임 종료")
        return
    }
    startMookZziBbaGame(turn: winner)
}
