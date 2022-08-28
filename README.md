# iOS 커리어 스타터 캠프
# 묵찌빠 게임

## 프로젝트 소개
게임을 시작하면, 컴퓨터와 사용자가 가위바위보 게임을 진행합니다. 비겼을 경우 가위바위보를 다시 진행하고, 어느 한쪽이 승리한 경우 묵찌빠 게임으로 넘어갑니다. 가위바위보 게임을 이긴 쪽부터 묵찌빠 게임의 턴을 잡습니다. 만약 묵찌빠 게임에서 컴퓨터와 사용자 어느 쪽도 이기지 못했다면(서로 다른 것을 낸 경우), 컴퓨터가 낸 패와 사용자가 낸 패의 가위바위보 결과에 따라 다음 턴이 누구인지 결정합니다. 사용자가 0을 입력할 경우, 가위바위보 게임 또는 묵찌빠 게임이 즉시 종료됩니다.

---

## 팀원
| stone | SummerCat |
| ----- | ----- |
| <img width="180px" src="https://avatars.githubusercontent.com/u/74972815?v=4"> | <img width="180px" src="https://i.imgur.com/TVKv7PD.png"> |

---

## 실행 화면(기능 설명)
|1. (가위바위보) 잘못된 입력 및 게임종료 |2.(묵찌빠) 잘못된 입력 |
| ----- | ----- |
|<img width="350px" src="https://i.imgur.com/ELW2cPl.gif"> | <img width="350px" src="https://i.imgur.com/seHd5O2.gif">|

| 3. 컴퓨터 승리 | 4. 사용자 승리 |
| ----- | ----- |
| <img width="350px" src="https://i.imgur.com/1utF4if.gif">| <img width="360px" src="https://i.imgur.com/dUz9G9m.gif"> |

1. (가위바위보) 잘못된 입력 및 게임 종료
    - 사용자가 잘못된 입력(1, 2, 3, 0) 이외의 값을 입력할 경우 `잘못된 입력입니다. 다시 시도해주세요`를 출력한 후 다시 사용자 입력을 받습니다.
    - 사용자가 숫자 `0`을 입력하는 경우 `게임 종료` 출력 후 게임이 종료됩니다.
2. (묵찌빠) 잘못된 입력
    - `묵찌빠`게임에서 묵(1), 찌(2), 빠(3), 종료(0)의 수가 아닌 다른 값이 입력 되었을때, `잘못된 입력입니다. 다시 시도해주세요`를 출력 후 컴퓨터의 턴으로 `묵찌빠`게임을 다시 시작합니다.
3. 컴퓨터 승리
    - 컴퓨터의 턴에서 사용자가 입력한 값과, 컴퓨터가 랜덤으로 생성한 값에 대한 `묵찌빠` 값이 일치 한다면 컴퓨터의 승리로 게임이 종료됩니다.
4. 사용자 승리
    - 사용자의 턴에서 사용자가 입력한 값과, 컴퓨터가 랜덤으로 생성한 값에 대한 `묵찌빠` 값이 일치 한다면 사용자의 승리로 게임이 종료됩니다.

---

## 고민했던 점
1. 가위바위보/묵찌빠의 열거형 선언과 처리
- 가위바위보/묵찌빠의 생성과 입력이 모두 1, 2, 3이라는 숫자로 이루어지기 때문에 숫자값을 그대로 이용해서 승/패 판정에 사용할지, `enum`을 이용해서 입력된 숫자가 `rock`, `paper`, `scissors`인지 구분한 후 승/패 판정을 시행할지 고민했습니다.
- 숫자값을 그대로 이용해서 코드를 작성할 경우, 코드를 읽는 사람이 '가위바위보' 게임이라는 것을 알아보기 어렵고 승/패의 결과를 알아보기 어려울 것이라고 생각해 `enum`의 `rawValue`를 이용해 가위, 바위, 보 값으로 변환해준 후 승/패 판정을 했습니다.

2. 승/무/패 처리 로직 구현
- 컴퓨터와 유저의 값을 비교해 승무패 처리를 하는 로직에서, 아래와 같은 알고리즘을 통해 보다 가독성 좋은 코드를 구현하려고 시도하였습니다.

``` Swift
switch userNumber - computerNumber {
case -2, 1:
    print("이겼습니다!")
    isGame = false
case -1, 2:
    print("졌습니다!")
    isGame = false
default:
    print("비겼습니다!")
}
```
- 구현 도중 이 알고리즘을 모르는 사람이 본다면, 이 코드가 무엇을 처리하는지 이해하기 어려울 것이라고 판단했습니다. 그래서 가위/바위/보의 원시값인 Int value의 연산으로 승/무/패를 처리하지 않고, 가위/바위/보 케이스 이름을 직접 사용하여 승/무/패 처리를 하도록 아래와 같이 작성했습니다.
```swift
func checkGameResult(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) {
    if computerChoice == userChoice {
        print("비겼습니다")
        playMCBGame(gameResult = .draw)
    }

    switch userChoice {
    case .scissors:
        if computerChoice == .rock {
            print("졌습니다!")
            playMCBGame(gameResult = .lose)
        }
```

3. 가위바위보의 승/패 결과를 처리하는 함수의 case 내에서 묵찌빠 게임을 실행하는 함수를 호출했더니, 묵찌빠 게임을 모두 실행한 후에 `checkGameResult()` 함수의 가장 아래에 있는 코드들이 실행되는 문제가 있었습니다.

```swift
// 처음 작성한 코드
func checkGameResult(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) {
    if computerChoice == userChoice {
        print("비겼습니다")
        playMCBGame(gameResult = .draw)
    }

    switch userChoice {
    case .scissors:
        if computerChoice == .rock {
            print("졌습니다!")
            playMCBGame(gameResult = .lose)
        }
    case .rock:
        if computerChoice == .paper {
            print("졌습니다!")
            playMCBGame(gameResult = .lose)
        }
    case .paper:
        if computerChoice == .scissors {
            print("졌습니다!")
            playMCBGame(gameResult = .lose)
        }
    }

    print("이겼습니다!")
    playMCBGame(gameResult = .win)
}
```
- 위 코드의 경우, `lose`일 때 `playMCBGame`을 실행한 후, 묵찌빠 게임이 종료된 후에 `checkGameResult`의 `switch`문 바깥에 있는 `print("이겼습니다!")`와 `playMCBGame(gameResult = .win)`을 실행하는 문제가 있었습니다.
- 위와 같은 오류를 해결하기 위해 `checkGameResult` 함수가 게임의 승/패/무승부/입력오류를 반환하는 `enum` 타입의 `GameResult`를 반환하도록 변경한 후,
`startGame` 함수 내에서 위 `GameResult`값을 받아 받아온 값으로 `switch`문을 사용해 묵찌빠 게임을 실행할 것인지(승/패의 경우) / 게임의 시작으로 돌아가서 사용자 입력을 다시 받을 것인지 (무승부) / 게임을 종료할 것인지 결정하도록 했습니다.

```swift
func checkGameResult(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) -> GameResult {
    if computerChoice == userChoice { return .draw }
    
    switch userChoice {
    case .scissors:
        if computerChoice == .rock { return .lose }
    case .rock:
        if computerChoice == .paper { return .lose }
    case .paper:
        if computerChoice == .scissors { return .lose }
    case .none:
        return .exit
    }
    
    return .win
}

```
```swift
let gameResult = checkGameResult(computerChoice: computerChoice, userChoice: userChoice)
    
    switch gameResult {
    case .win:
        print("이겼습니다!")
        playMCBGame(gameResult: .win)
    case .lose:
        print("졌습니다!")
        playMCBGame(gameResult: .lose)
    case .draw:
        print("비겼습니다")
        startGame()
    case .exit:
        print("게임 종료")
        break
    }
```

4. 사용자 입력에 따라 게임을 반복하는 부분을 반복문(`while`)로 구현했었으나, 재귀함수로 변경
- `Step1`에서는 Bool 값을 갖는 `isRunning` 변수를 활용해 무승부인 경우에는 무한 반복하는 반복문으로 구현했었습니다.
- `Step2`를 진행하던 중, 가위바위보의 사용자 승/패 조건에 따라 묵찌빠 게임에서 턴이 결정되는 부분을 고려했을때 RPS게임에서의 반복조건이 적합하지 않다고 판단되었습니다. 그리고 `startGame` 함수의 `while`문 내에서 묵찌빠 게임을 실행하는 함수를 호출하기 때문에, 묵찌빠 게임이 종료된 후 다시 `while`문으로 돌아와서 그 이후의 구문을 실행하는 문제가 있었습니다. 이것은 게임을 즉시 종료하기를 원하는 저희의 의도와 맞지 않았기 때문에 재귀함수로 변경하게 되었습니다.

5. 사용자 입력값을 처리하는 enum에 잘못된 입력의 케이스 `none`, 게임 결과 반환값에 게임 종료를 의미하는`exit` 추가
- 사용자 입력 값을 처리하는 부분에서 `enum` 타입에 `none`이라는 타입을 추가해준다면, `enum`타입의 생성자와 `0...3 ~=` 이라는 범위 연산자의 유효성 체크를 한번에 해줄 수 있다고 판단하였습니다.
- `0...3 ~= ` 범위연산자를 제거해주고, enum 타입에 none을 추가 해줌으로써, `none`의 Raw Value인 `0`은 게임을 종료시키는 조건으로 사용할 수 있도록 했습니다.
- `GameResult`라는 열거체를 추가하고, `switch`문을 활용해 `GameResult`의 값에 따라 게임 진행 흐름을 제어하도록 변경하면서 RPS게임에서 Bool값을 갖는 `isGame` 플래그 변수를 활용한 `while` 반복문 대신 재귀함수로 처리할 수 있었습니다.
- `exit`라는 `GameResult`의 타입을 추가함으로써 게임 종료에 대한 타입을 한가지로 통일하였습니다.

6. 묵찌빠 게임 시작 시 이전 게임의 승/패 결과에 따른 사용자/컴퓨터 턴 플래그 변수
- 가위바위보 게임의 결과값 win과 lose를 활용해 묵찌빠 게임의 시작 턴을 결정하기 위해 `isUserTurn`이라는 변수를 추가하였습니다.
- 묵찌빠 게임 내에서 턴을 정할 때에도, `isUserTurn`이라는 변수를 이용해서 사용자의 턴과 컴퓨터의 턴을 핸들링 할 수 있었습니다.

---

## 참고 링크
https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html </br>
https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html
