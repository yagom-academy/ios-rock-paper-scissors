//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum gamePlayer: String {
    case player = "플레이어"
    case computer = "컴퓨터"
}

class RockPaperScissorsGame {
    enum Hand: String, CaseIterable, Comparable {
        static func < (lhs: Hand, rhs: Hand) -> Bool {
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
    
    enum GameError: Error {
        case invalidInput
    }
    
    func startGame() {
        var isRepeat = false
        
        repeat {
            guard let computersHand = Hand.allCases.randomElement() else {
                continue
            }
            
            var playerHand: Hand
            do {
                if let notNilplayerHand = try getHandByplayer() {
                    playerHand = notNilplayerHand
                } else {
                    print("게임종료")
                    break
                }
            } catch {
                print("잘못된 입력입니다. 다시 입력해주세요")
                isRepeat = true
                continue
            }
            
            // test print
            print("플레이어 : \(playerHand)")
            print("컴퓨터 : \(computersHand)")

            isRepeat = gameResult(playerHand, vs: computersHand)
        } while isRepeat
    }
    
    func gameResult(_ playersHand: Hand, vs computersHand: Hand) -> Bool {
        if playersHand == computersHand {
            print("비겼습니다.")
            return true
        } else if playersHand > computersHand {
            print("이겼습니다.")
            MukjjibbaGame(winner: .player).startGame()
            return false
        } else {
            print("졌습니다.")
            MukjjibbaGame(winner: .computer).startGame()
            return false
        }
    }
        
    func getHandByplayer() throws -> Hand? {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let playerInput = readLine() else {
            throw GameError.invalidInput
        }
        
        if playerInput == "0" {
            return nil
        }
        
        guard let playerHand = Hand(rawValue: playerInput) else {
            throw GameError.invalidInput
        }

        return playerHand
    }
}

class MukjjibbaGame: RockPaperScissorsGame {
    var winner: String
    
    init(winner: gamePlayer) {
        self.winner = winner.rawValue
    }
    
    override func gameResult(_ playersHand: Hand, vs computersHand: Hand) -> Bool {
        if playersHand == computersHand {
            print("\(winner)의 승리!")
            return false
        } else if playersHand > computersHand {
            winner = "플레이어"
            print("\(winner)의 턴입니다")
            return true
        } else {
            winner = "컴퓨터"
            print("\(winner)의 턴입니다")
            return true
        }
    }
        
    override func getHandByplayer() throws -> Hand? {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        
        guard var playerInput = readLine() else {
            throw GameError.invalidInput
        }
        
        switch(playerInput) {
        case "0":
            return nil
        case "1":
            playerInput = Hand.rock.rawValue
        case "2":
            playerInput = Hand.scissors.rawValue
        case "3":
            playerInput = Hand.paper.rawValue
        default:
            throw GameError.invalidInput
        }
        
        guard let playerHand = Hand(rawValue: playerInput) else {
            throw GameError.invalidInput
        }

        return playerHand
    }
}

let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startGame()
