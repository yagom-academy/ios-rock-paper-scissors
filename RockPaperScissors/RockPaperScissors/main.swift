//
//  RockPaperScissors - main.swift
//  Created by Wonbi, mini.
//

private var isGameDraw: Bool = false

enum InputError: Error {
    case invalidNumber
}

func generateComputerCard() -> CardType? {
    let randomNumber = Int.random(in: 1...3)
    return CardType(rawValue: randomNumber)
}

func fetchUserInput() -> Result<Int, InputError> {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let inputedValue = readLine(),
          let inputedNumber = Int(inputedValue),
          0...3 ~= inputedNumber else { return .failure(.invalidNumber) }
    return .success(inputedNumber)
}

//TODO: - 함수명 고민해보기
//TODO: - 실질적으로 하는 함수의 역할이 검증하고, 게임을 한다. -> 역할을 분리
func validate(at userInputedResult: Result<Int,InputError>) {
    switch userInputedResult {
    case .success(let userInput):
        playGame(userNumber: userInput)
    case .failure:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        isGameDraw = true
    }
}

func playGame(userNumber: Int) {
    guard let computerCard = generateComputerCard(),
          userNumber != 0,
          let userCard = CardType(rawValue: userNumber) else {
        print("게임 종료")
        return
    }
    
    //TODO: - 유저와 컴퓨터의 숫자를 가위 바위 보로 변경
    //TODO: - 로직 정리 방법이 떠오르면 변경하기  X -> PR 고민한 사항
    //TODO: - rawValue사용이 코드의 가독성을 해치는가?
    
    switch userCard.compare(to: computerCard) {
    case .draw:
        print("비겼습니다!")
        isGameDraw = true
    case .win:
        print("이겼습니다!")
    case .lose:
        print("졌습니다!")
    }
}

func runRockPapaerScissor() {
    repeat {
        isGameDraw = false
        let userCard = fetchUserInput()
        validate(at: userCard)
    } while isGameDraw
}

runRockPapaerScissor()
