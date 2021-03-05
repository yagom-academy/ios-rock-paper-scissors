//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//


class RockPaperScissorsGame {
    
    enum Hand: String, CaseIterable, Comparable {
        static func < (lhs: RockPaperScissorsGame.Hand, rhs: RockPaperScissorsGame.Hand) -> Bool {
            if (lhs == .scissors && rhs == .rock)
            || (lhs == .paper && rhs == .scissors)
            || (lhs == .rock && rhs == .paper) {
                return true
            } else {
                return false
            }
        }
        
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }
    
    enum winner: String {
        case win = "사용자"
        case lose = "컴퓨터"
    }
    
    enum mukChiPaShape: String, CaseIterable {
        case muk = "1"
        case chi = "2"
        case pa = "3"
    }
    
    enum GameError: Error {
        case invalidInput
    }

    func startGame() {
        var isRepeat = false
        
        repeat {
            guard let computersHand = Hand.allCases.randomElement() else {
                continue
            }
            
            var userHand: Hand
            do {
                if let notNilUserHand = try getHandByUser() {
                    userHand = notNilUserHand
                } else {
                    print("게임종료")
                    break
                }
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                isRepeat = true
                continue
            }
            
            isRepeat = gameResult(userHand, vs: computersHand)
        } while isRepeat
    }
    
    func gameResult(_ usersHand: Hand, vs computersHand: Hand) -> Bool {
        if usersHand == computersHand {
            print("비겼습니다.")
            return true
        } else if usersHand > computersHand {
            print("이겼습니다.")
            mukChiPaGameStart(deliverWinner: winner.win.rawValue)
            return false
        } else {
            print("졌습니다.")
            mukChiPaGameStart(deliverWinner: winner.lose.rawValue)
            return false
        }
    }
        
    func getHandByUser() throws -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userInput = readLine() else {
            throw GameError.invalidInput
        }
    
        if userInput == "0" {
            return nil
        }
    
        guard let userHand = Hand(rawValue: userInput) else {
            throw GameError.invalidInput
        }

        return userHand
    }
    
    func mukChiPaGameStart(deliverWinner: String) {
        var turn = deliverWinner
        
        while true {
            print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            guard let computersHand = mukChiPaShape.allCases.randomElement() else {
                continue
            }
            
            var userHand: mukChiPaShape
            do {
                if let notNilUserHand = try getMukChiPaByUser() {
                    userHand = notNilUserHand
                } else {
                    print("게임종료")
                    break
                }
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                continue
            }
            
            print("사용자: \(userHand)")
            print("컴퓨터: \(computersHand)")
            
            if userHand == computersHand {
                print("\(turn)의 승리!")
                return
            } else if userHand != computersHand {
                if userHand == .muk && computersHand == .chi ||
                    userHand == .chi && computersHand == .pa ||
                    userHand == .pa && computersHand == .muk {
                    turn = "사용자"
                    print("\(turn)의 턴입니다")
                    continue
                } else if computersHand == .muk && userHand == .chi ||
                        computersHand == .chi && userHand == .pa ||
                        computersHand == .pa && userHand == .muk {
                        turn = "컴퓨터"
                        print("\(turn)의 턴입니다")
                        continue
                }
            }
        }
    }
    
    func getMukChiPaByUser() throws -> mukChiPaShape? {
       
        guard let userInput = readLine() else {
            throw GameError.invalidInput
        }
        
        if userInput == "0" {
            return nil
        }
        
        guard let userHand = mukChiPaShape(rawValue: userInput) else {
            throw GameError.invalidInput
        }
        
        return userHand
    }
}

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startGame()

