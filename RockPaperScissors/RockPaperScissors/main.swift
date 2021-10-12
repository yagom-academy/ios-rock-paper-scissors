enum Card: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    func checkPlayerWinCase() -> Card {
        switch self {
        case .scissors:
            return Card.paper
        case .paper:
            return Card.rock
        case .rock:
            return Card.scissors
        }
    }
}

var playerCard: Card = Card.scissors

func startReceiveInput() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input: String = readLine(), input != "0" else {
        print("게임 종료")
        return
    }
    
    varifyInputValue(input: input)
}

func varifyInputValue(input: String) {
    guard let inputNumber = Int(input), inputNumber > 0, inputNumber < 4 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startReceiveInput()
        return
    }
    
    playerCard = changeNumberToCard(number: inputNumber)
    startGame()
}

func changeNumberToCard(number: Int) -> Card {
    switch number {
    case 1:
        return Card.scissors
    case 2:
        return Card.rock
    default:
        return Card.paper
    }
}

func startGame() {
    var computerCard: Card = Card.scissors
    
    if let randomChoice = Card.allCases.randomElement() {
        computerCard = randomChoice
        print(computerCard)
    }
    
    compareCards(with: computerCard)
}

func compareCards(with computerCard: Card) {
    let playerWinCaseCard = playerCard.checkPlayerWinCase()
    
    if playerCard == computerCard {
        print("비겼습니다!")
        startReceiveInput()
        return
    } else if playerWinCaseCard == computerCard {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

startReceiveInput()
