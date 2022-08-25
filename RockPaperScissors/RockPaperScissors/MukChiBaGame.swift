//
//  MukChiBaGame.swift
//  RockPaperScissors
//
//  Created by LJ, 준호.
//

struct MukChiBaGame {
    private var turnOwner: Participant?
    
    mutating func startGame() {
        var rockPaperScissorsGame: RockPaperScissorsGame = RockPaperScissorsGame()
        rockPaperScissorsGame.startGame()
        guard let turnOwner: Participant = rockPaperScissorsGame.winner else {
            return
        }
        self.turnOwner = turnOwner
        
        doMukChiBaGameRoutine()
    }
    
    mutating private func doMukChiBaGameRoutine() {
        var isTurnOwnerWin: Bool
        repeat {
            let selectedUserMenu: Int = getSelectedUserMenu()
            guard let userHand: MukChiBa = MukChiBa.init(rawValue: selectedUserMenu) else {
                return
            }
            guard let gameResult: GameResult = compareComputerHand(with: userHand) else {
                return
            }
            isTurnOwnerWin = isTurnOwnerMukChiBaGameWin(gameResult: gameResult)
            printMukChiBaGameResult(isTurnOwnerWin)
        } while !isTurnOwnerWin
    }
    
    mutating private func getSelectedUserMenu() -> Int {
        printUserMenu()
        guard let selectedUserMenu: Int = userInput() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            turnOwner = .computer
            return getSelectedUserMenu()
        }
        
        if isCorrectUserMenu(selectedUserMenu) {
            return selectedUserMenu
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            turnOwner = .computer
            return getSelectedUserMenu()
        }
    }
    
    private func printUserMenu() {
        guard let turnOwnerName = turnOwner?.name else {
            return
        }
        print("[\(turnOwnerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func userInput() -> Int? {
        let userInput: Int? = Int(readLine() ?? "")
        return userInput
    }
    
    private func isCorrectUserMenu(_ userMenu: Int) -> Bool {
        switch userMenu {
        case 0...3:
            return true
        default:
            return false
        }
    }
    
    private func compareComputerHand(with userHand: MukChiBa) -> GameResult? {
        guard let computerHand: MukChiBa = getComputerHand() else {
            return nil
        }
        guard userHand != computerHand else {
            return .draw
        }
        
        switch userHand {
        case .muk:
            if computerHand == .chi {
                return .win
            } else {
                return .lose
            }
        case .chi:
            if computerHand == .ba {
                return .win
            } else {
                return .lose
            }
        case .ba:
            if computerHand == .muk {
                return .win
            } else {
                return .lose
            }
        }
    }
    
    private func getComputerHand() -> MukChiBa? {
        return MukChiBa.allCases.randomElement()
    }
    
    mutating private func isTurnOwnerMukChiBaGameWin(gameResult: GameResult) -> Bool {
        switch gameResult {
        case .draw:
            return true
        case .win:
            return false
        case .lose:
            toggleTurnOwner()
            return false
        }
    }
    
    mutating private func toggleTurnOwner() {
        if turnOwner == .user {
            turnOwner = .computer
        } else {
            turnOwner = .user
        }
    }
    
    private func printMukChiBaGameResult(_ isTurnOwnerWin: Bool) {
        guard let turnOwnerName = turnOwner?.name else {
            return
        }
        switch isTurnOwnerWin {
        case true:
            print("\(turnOwnerName)의 승리!")
        case false:
            print("\(turnOwnerName)의 턴입니다.")
        }
    }
}
