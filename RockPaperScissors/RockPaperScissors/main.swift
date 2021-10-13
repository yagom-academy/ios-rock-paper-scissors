enum Card: CaseIterable {
    case scissors
    case rock
    case paper
    
    func checkPlayerWinCase() -> Card {
        switch self {
        case .scissors:
            return .paper
        case .paper:
            return .rock
        case .rock:
            return .scissors
        }
    }
    
    static func changeNumberToCard(number: Int) -> Card? {
        switch number {
        case 1:
            return Card.scissors
        case 2:
            return Card.rock
        case 3:
            return Card.paper
        default:
            return nil
        }
    }
}

/// 에러를 방지하기 위해 특정 값으로 초기화
var playerCard: Card = Card.scissors

func receiveValidPlayerInput() {
    let programTerminator = "0"
    print("가위(1), 바위(2), 보(3)! <종료 : \(programTerminator)> : ", terminator: "")
    
    guard let playerInputString: String = readLine(), playerInputString != programTerminator else {
        print("게임 종료")
        return
    }
    
    assignPlayerCard(with: playerInputString)
}

func assignPlayerCard(with playerInputString: String) {
    guard let playerInputNumber = Int(playerInputString),
          let cardFromInputNumber = Card.changeNumberToCard(number: playerInputNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        receiveValidPlayerInput()
        return
    }
    
    playerCard = cardFromInputNumber
    startGame()
}

func startGame() {
    guard let computerCard: Card = createRandomCard() else {
        print("오류 - 컴퓨터 패 생성 실패")
        return
    }

    print(computerCard)
    compareCards(with: computerCard)
}

func createRandomCard() -> Card? {
    if let randomChoice = Card.allCases.randomElement() {
        return randomChoice
    }
    return nil
}

func compareCards(with computerCard: Card) {
    let playerWinCaseCard = playerCard.checkPlayerWinCase()
    
    if playerCard == computerCard {
        print("비겼습니다!")
        receiveValidPlayerInput()
        return
    } else if playerWinCaseCard == computerCard {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

receiveValidPlayerInput()
