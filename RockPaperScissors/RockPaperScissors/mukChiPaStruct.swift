//
//  mukChiPaStruct.swift
//  RockPaperScissors
//
//  Created by Morgan, Kiseok. on 2023/09/07.
//


struct MukChiPa {
    var turn: Player
    
    init() {
        turn = .nobody
    }
    
    mutating func playMukChiPa() {
        printMukChiPaMenu(winner: turn)
        generateUserHand()
        generateComputerHand()
        generateResult()
    }
    
    mutating func generateUserHand() {
        do {
            let userInput = try readUserInput()
            try convertToUserHand(user: userInput)
        } catch {
            print("잘못된 입력입니다. 다시 시도해주세요")
            printTurn(player: Player.computer)
            printMukChiPaMenu(winner: turn)
            generateUserHand()
        }
    }
    
    func readUserInput() throws -> Int {
        guard let userInput = readLine() else {
            throw InputError.nothingInputError
        }
        guard let user = Int(userInput) else {
            throw InputError.notNumberError
        }
        
        guard 0...3 ~= user else {
            throw InputError.outOfRangeError
        }
        
        return user
    }
    
    func convertToUserHand(user: Int) throws {
        switch user {
        case 0:
            userHand = .exit
        case 1:
            userHand = .rock
        case 2:
            userHand = .scissors
        case 3:
            userHand = .paper
        default:
            throw InputError.wrongInput
        }
    }
    
    func generateComputerHand() {
        let randomComputerHand = Int.random(in: randomNumberRange)
        
        switch randomComputerHand {
        case 1:
            computerHand = .rock
        case 2:
            computerHand = .scissors
        case 3:
            computerHand = .paper
        default:
            break
        }
    }
    
    mutating func generateResult() {
        if computerHand == userHand {
            print("\(turn.playerDescription)의 승리!")
            return
        } else if (computerHand == .rock && userHand == .paper) || (computerHand == .scissors && userHand == .rock) || (computerHand == .paper && userHand == .scissors) {
            printTurn(player: Player.user)
            playMukChiPa()
        } else if userHand == .exit {
            rockPaperScissorsResult = .exit
            print(rockPaperScissorsResult.resultDescription)
        } else {
            printTurn(player: Player.computer)
            playMukChiPa()
        }
    }
    
    mutating func printTurn(player: Player) {
        var playerTurn: Player
        
        switch player {
        case .user:
            playerTurn = .user
        case .computer:
            playerTurn = .computer
        case .nobody:
            return
        }
        
        print("\(playerTurn.playerDescription)의 턴입니다.")
        turn = playerTurn
    }
    
    func printMukChiPaMenu(winner: Player) {
        print("[\(winner.playerDescription) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
    }
}
