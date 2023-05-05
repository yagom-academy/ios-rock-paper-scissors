# 묵찌빠 게임 

> 컴퓨터와 유저가 가위바위보 게임 진행 후 승리한 플레이어의 턴으로 시작해 묵찌빠를 진행하며 승자를 결정하는 게임을 콘솔 창으로 구현해봤습니다.
>
> 진행 기간: 2023.05.01 ~ 2023.05.05

<br/>

## 목차

1. [팀원](#팀원)
2. [타임 라인](#타임라인)
3. [실행 화면](#실행-화면)
4. [트러블 슈팅](#트러블-슈팅)
5. [참고 링크](#참고-링크)
6. [팀 회고](#팀-회고)

<br/>

## 팀원

|                           myungsun                           |                            Yetti                             |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/74762699?s=400&u=44a002eb9bfd2be6f192a6f994f9552d081060b8&v=4" width="250" height="250" style="border-radius: 50%;"/> | <img src="https://avatars.githubusercontent.com/u/100982422?v=4" width="250" height="250" style="border-radius: 50%;"/> |
|      [Github Profile](https://github.com/myungsun7782)       |        [Github Profile](https://github.com/iOS-Yetti)        |

<br/>

## 타임라인 

핵심 Commit 위주로 작성했습니다.

- feat: startGame 메서드 내에서 사용자 입력 값 받는 기능 구현
- feat: getGameResult 메서드 구현 
- refactor: getGameResult 메서드 내에서 if문을 switch문으로 변경 및 반환 값을 named tuple로 적용
- refactor: startGame 메서드 내에서 사용자 입력 받는 기능 분리
- feat: startMukChiPa 메서드 구현
- feat: startMukChiPa 메서드와 실행 후 결과를 알려주는 기능 분리
- feat: GameResult 열거형 추가 및 getGameResult 승무패를 판단하는 기능 분리
- feat: startGame 메서드 추가 및 startRockPaperScissors 반환 값 추가
- feat: getMukChiPaResult 메서드로 기능 분리
- refactor: compareHandShapeWith 메서드 이름을 compare 로 변경
- refactor: 중복된 변수와 상수 프로퍼티화

<br/>

## 실행 화면

- 컴퓨터와 유저가 가위바위보 게임 진행 후 승리한 플레이어의 턴으로 시작해 묵찌빠를 진행해서 승자를 출력하고 게임이 종료 됩니다.

<img src="https://user-images.githubusercontent.com/74762699/236392261-7befec45-65ce-401c-86cd-0d0445ba345c.png" width="500" height="500"/>

<br/>

## 트러블 슈팅

- 코드를 작성할 때 어려웠던 점과 고민했던 점 중심으로 작성했습니다.

### if-else 문 => Switch문 

기존에 if-else 문을 통해서 게임 결과를 반환하는 메서드 로직을 작성했는데, 게임 결과(승, 무, 패)가 정해져 있었기에 해당 case를 명확하게 구분하기 위해서 switch문을 통해 코드를 작성했습니다.

**[if-else 문을 사용한 코드]**

```swift
private func getRockPaperScissorsResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (Bool, String) {
    if computerHandShape == userHandShape {
        return (true, "비겼습니다.")
    } else if (computerHandShape == .rock && userHandShape == .paper) ||
                (computerHandShape == .paper && userHandShape == .scissors) ||
                (computerHandShape == .scissors && userHandShape == .rock) {
        return (false, "이겼습니다!")
    } else {
        return (false, "졌습니다!")
    }
}
```

**[switch 문을 사용한 코드]**

```swift
private func getRockPaperScissorsResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (Bool, String) {
    switch (computerHandShape, userHandShape) {
    case let (computerHandShape, userHandShape) where computerHandShape == userHandShape:
        return (true, "비겼습니다.")
    case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
        return (false, "이겼습니다!")
    default:
        return (false, "졌습니다!")
    }
}
```

### 기능 분리

1. getGameResult 메서드에서 사용자의 손 모양과 컴퓨터의 손 모양을 받아서 비교를 해주는 로직과 결과를 반환하는 로직이 합쳐져 있었는데, 지금은 사용자의 손 모양과 컴퓨터의 손 모양을 받아서 비교를 해주는 메서드를 만들어서 getGameResult 메서드에서 해당 메서드를 호출하고, 호출한 결과에 따라 값을 반환해주는 것으로 기능 분리를 했습니다. 

**[기능 분리 전 코드]**

```swift
private func getRockPaperScissorsResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (isGameOn: Bool, resultMessage: String, player: PlayerType?) {
    switch (computerHandShape, userHandShape) {
    case let (computerHandShape, userHandShape) where computerHandShape == userHandShape:
        return (true, "비겼습니다.", nil)
    case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
        return (false, "이겼습니다!", .person)
    default:
        return (false, "졌습니다!", .computer)
    }
}
```

**[기능 분리 후 코드]**

```swift
private func getGameResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (isGameOn: Bool, resultMessage: String, winner: PlayerType?) {
    let gameResult: GameResult = compareHandShapeWith(computerHandShape, userHandShape)
    
    switch gameResult {
    case .draw:
        return (true, "비겼습니다.", nil)
    case .win:
        return (false, "이겼습니다!", .person)
    case .lose:
        return (false, "졌습니다!", .computer)
    }
}

private func compare(_ computerHandShape: HandShape, with userHandShape: HandShape) -> GameResult {
    switch (computerHandShape, userHandShape) {
    case let (computerHandShape, userHandShape) where computerHandShape == userHandShape:
        return .draw
    case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
        return .win
    default:
        return .lose
    }
}
```

2. 사용자에게 입력을 받는 메서드 내에서도 게임 유형에 따라서 콘솔 창에 메시지를 다르게 보여주는 기능도 분리하여 코드를 작성했습니다.

**[기능 분리 전 코드]**

```swift
private func inputGameOptionNumber(gameType: GameType, _ currentTurnOwner: PlayerType? = nil) -> Int? {
    let validOptionRange: ClosedRange<Int> = 0...3
    
    switch gameType {
    case .rockPaperScissors:
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    case .mukChiPa:
        guard let currentTurnOwner = currentTurnOwner else { return }
        print("[\(currentTurnOwner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
    
    guard let gameOption = readLine(),
          let gameOptionNumber = Int(gameOption),
          validOptionRange.contains(gameOptionNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    
    return gameOptionNumber
}
```

**[기능 분리 후 코드]**

```swift
private func inputGameOptionNumber(gameType: GameType, _ currentTurnOwner: PlayerType? = nil) -> Int? {
    let validOptionRange: ClosedRange<Int> = 0...3
    showGameMessageWith(gameType, currentTurnOwner)
    
    guard let gameOption = readLine(),
          let gameOptionNumber = Int(gameOption),
          validOptionRange.contains(gameOptionNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    
    return gameOptionNumber
}

private func showGameMessageWith(_ gameType: GameType, _ currentTurnOwner: PlayerType?) {
    switch gameType {
    case .rockPaperScissors:
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    case .mukChiPa:
        guard let currentTurnOwner = currentTurnOwner else { return }
        print("[\(currentTurnOwner.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
```



### 코드 재사용성

STEP2 묵찌빠 게임에서 구현해야 하는 기능이 가위, 바위, 보에서 게임에서 구현해야 하는 기능과 비슷한 것들이 많아서 최대한 기존에 작성한 코드를 '재사용'해서 작성하려고 고민을 많이 했습니다. 사용자에게 입력을 받아 콘솔에 메시지를 띄워주는 기능은 가위, 바위, 보에서도 필요하고, 묵찌빠 게임에서도 필요했습니다. 그런데, 묵찌빠 게임에서는 메시지를 출력하는 동시에 현재 누구의 턴 인지까지 보여줘야 했습니다. 그래서 저희는 현재 누구의 턴인지를 의미하는 파라미터의 기본 값을 nil로 설정해서 가위, 바위, 보 게임에서는 해당 파라미터 값을 받지 않도록 설정하고 기존 메서드를 그대로 재사용했습니다. 

```swift
private func inputGameOptionNumber(gameType: GameType, _ currentTurnOwner: PlayerType? = nil) -> Int? {
    let validOptionRange: ClosedRange<Int> = 0...3
    showGameMessageWith(gameType, currentTurnOwner)
    
    guard let gameOption = readLine(),
          let gameOptionNumber = Int(gameOption),
          validOptionRange.contains(gameOptionNumber) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    
    return gameOptionNumber
}
```

<br/>

## 참고 링크

- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Swift Language Guide - Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)

<br/>

## 팀 회고

### 우리팀이 잘한 점

- 네이밍의 가독성을 고려하며 작성하여 보는 사람이 더 이해하기 쉬운 코드를 작성하려고 노력한 것
- 타입별로 기능별로 적절한 분리를 하기 위해 계속 얘기해보며 리팩토링을 진행한 것
- 커밋 단위와 커밋 메시지를 고민하며 진행한 것
- 밀도있게 프로젝트를 진행한 점

### 우리팀 개선할 점

- 코드 작성에 너무 심혈을 기울여 스크럼을 하며 공유하는 시간을 많이 가지지 못한 것

### 서로에게 좋았던 점 피드백

**myungsun은**

- 제가 잘 모르는 부분을 그냥 넘기지 않고 이해할 때까지 차근차근 설명을 해주신 점이 너무 감사했습니다.

**Yetti는** 

- 모르는 부분을 그냥 넘어가려고 하지 않고 끝까지 알아가려고 하는 모습이 너무 좋았습니다. 예티 덕분에 정말 제가 알고 있던 것에 대해서 복습할 수 있어서 좋았고, 모르는 것에 대해서 알아갈 수 있어서 너무 좋았습니다!

### 서로에게 아쉬웠던 점 피드백

**myungsun**

- 6개월 간 함께 캠프생활을 할텐데 프로젝트 기간동안 아직 많이 친해지진 못해서 더 친해지고 많이 나누면 좋겠습니다! (제가 낯가림이 심해 말을 잘 못해서 그런거지만..)

**Yetti**

- 프로젝트에 너무 집중하느라 많이 이야기를 나눠보지 못해서 아쉽습니다!
