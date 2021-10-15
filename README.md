## iOS 커리어 스타터 캠프

## 묵찌빠 프로젝트 저장소

## Flow Chart

![flowChart](https://user-images.githubusercontent.com/45652743/136931450-400f8245-97ac-4f53-85d9-4573aa9d4c59.png)


## 코딩 컨벤션

- 맨 위에 전역변수, 함수는 중간, 실행은 아래
- 타입 추론이 가능한 경우 허용
- 프로퍼티 사이에는 줄바꿈하지 않는다. 
- 메서드 사이에는 줄바꿈

## 커밋 컨벤션

- 한글로 작성
- feat = 주로 사용자에게 새로운 기능이 추가되는 경우
- fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- docs = 문서에 변경 사항이 있는 경우
- style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- chore = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- subject와 body 사이는 한 줄 띄워 구분하기
- subject line의 글자수는 50자 이내로 제한하기
- subject line의 첫 글자는 대문자 사용하기
- subject line의 마지막에 마침표(.) 사용하지 않기
- subject line에는 명령형 어조를 사용하기
- body는 72자마다 줄 바꾸기
- body는 어떻게 보다 무엇을, 왜 에 맞춰 작성하기

## STEP 1

### 고민되었던 점 및 해결방법

#### - Sign vs SignFactory

Sign 타입 내에서 기존에 Sign을 생성하는 타입 메서드를 구현하였으나, SignFactory라는 Sign을 생성, 관리하는 새로운 타입을 만들어야하나 고민이 있었습니다. 

> 해결 방법 : Sign내의 타입 메서드를 SignFactory에 옮겨 구현하였습니다. 
>
> Sign 타입에는 중요한 특성만을 가지도록 만들어주기 위해 추가적인 기능은 붙이지 않았고, Sign 타입을 활용하여 생성, 관리하는 메서드는 SignFactory라는 타입을 새로 만들어 해당 타입 내에 구현해주었습니다. 

#### - Switch vs If

switch와 If 사이에서 가독성의 관점에서 어느 것이 더 좋은 방법인지 고민해봤습니다. 

- Switch

```swift
func checkWinner(userSign: Sign, computerSign: Sign) -> GameResult {
    switch computerSign {
    case userSign.counter:
        return .userWin
    case userSign:
        return .draw
    default:
        return .computerWin
    }
}
```


- If

```swift
func checkWinner(userSign: Sign, computerSign: Sign) -> GameResult {
    if userSign == computerSign.counter {
        return .userWin
    } else if userSign == computerSign {
        return .draw
    } else {
        return .computerWin
    }
}
```

> 해결 방법 : case가 명확한 상황에서는 switch, 추가적인 판단이 필요한 경우 if를 선택했습니다.
>
> 코드를 간결하게 만드는 것과 의미를 명확하게 하고자 하는 방법 사이에서 적절한 방식을 선택했습니다.


#### - Recursive vs Iterative

게임을 실행하기 위한 playGame을 구현할 때 recursively하게 구현할 지, iteratively하게 구현할 지에 대해 고민했습니다. 

- Recursive

```swift
func playGame() {
    printMenu()
    let userInput = getUserInput()
    let validationResult = isValid(userInput: userInput)
    
    switch validationResult {
    case .invalid:
        printInputError()
        playGame()
    case .valid(0):
        printGameOver()        
    case .valid(let userInput):
        let (userSign, computerSign) = generatePlayersSign(userInput: userInput)
        let gameResult = checkWinner(userSign: userSign, computerSign: computerSign)
        printGameResult(gameResult: gameResult)
        
        gameResult == .draw ? playGame() : printGameOver()
        return
    }
}
```

- Iterative

```swift
func playGame() {
    var gameResult: GameResult? = nil

    outerLoop: repeat {
        printMenu()
        let userInput = getUserInput()
        let validationResult = isValid(userInput: userInput)

        switch validationResult {
        case .invalid:
            printInputError()
            continue
        case .valid(0):
            break outerLoop
        case .valid(let userInput):
            let (userSign, computerSign) = generatePlayersSign(userInput: userInput)
            gameResult = checkWinner(userSign: userSign, computerSign: computerSign)
            printGameResult(gameResult: gameResult)
            continue
        }
    } while gameResult == .draw || gameResult == nil

    printGameOver()
}
```

> 해결 방법 : 재귀문으로 구현했습니다.
>
> 더 간결하고 문제의 제약 사항을 지키기에 적합한 방법이라고 생각되었습니다. 하지만 반복문에 비해 덜 직관적이라는 부분은 있는 것 같습니다. 

#### - Enumerations 활용 

- `Validity`
  : invalid한 경우에는 유효하지 않다는 결과만 출력하도록 하고, valid한 경우 유효하다는 정보와 유효한 입력을 함께 반환하도록 했습니다. 

- `Sign`
  - `counter` : 각 케이스를 이기는 `Sign`을 반환하여 이후 승패 판단에 활용하였습니다.
  - `init` : step 2의 묵찌빠와 가위바위보에서 각 sign에 해당하는 숫자가 다르지만 한가지 방법의 코드로 해결해주기 위해 rawValue를 사용하지 않고 직접적으로 initializer를 작성했습니다.
  - `Self` : 타입 이름을 반복적으로 사용하지 않게 도와주는 역할을 합니다. 타입 프로퍼티/메서드를 호출할 때 앞에 `Self`를 붙여 사용합니다.
  - `self` : 모든 인스턴스들이 암시적으로 생성하는 프로퍼티를 의미하며, 인스턴스 프로퍼티/메서드를 호출할 때 `self`를 붙여 사용합니다.

#### - 네이밍 

함수, 타입, 매개변수의 이름에 역할이 명확하게 표현되도록 고민하여 네이밍했습니다.

#### - Optional

- `generateRandomElement` 메서드 내에서 사용되는 `randomElement` 메서드는 대상 배열이 비어있을 경우 nil을 반환할 수 있습니다. 하지만 `Sign.allCases`에서는 빈 배열이 반환되는 경우가 없으나, 혹시나 nil이 반환되는 faltalError를 사용하여 고의로 오류를 발생시켜 논리적 오류를 재확인하도록 하였습니다.
- optional을 처리해줄 때, 빠른 종료의 장점을 갖는 `guard let` 구문을 사용했었습니다.

## STEP 2

### 고민되었던 점 및 해결방법

#### - randomElement

프로그램을 실행하였을 때 무승부가 연속으로 약 4~5회 나오는 상황을 여러 번 마주쳤습니다. 매우 낮은 확률의 상황이 자주 발생하여 작성한 코드에서 랜덤값을 불러오는 부분에 구현이 잘못된 게 없는지 고민했습니다. randomElement 메소드가 항상 랜덤한 값을 반환하는지 확인이 필요했습니다.

> 해결 방법 : Github에 올라온 Swift 코드를 확인해 보았습니다.

```swift
public func randomElement<T: RandomNumberGenerator>(
    using generator: inout T
  ) -> Element? {
    guard !isEmpty else { return nil }
    let random = Int.random(in: 0 ..< count, using: &generator)
    let idx = index(startIndex, offsetBy: random)
    return self[idx]
  }
```

#### - Protocol

- Equatable

  enum Game의 값을 비교할 때 에러가 발생했습니다. 에러 메세지를 읽어 보니 Equatable을 채택해야 한다고 하여 이유가 궁금해졌습니다.

  > 해결 방법 : Apple의 공식 문서를 확인해보았습니다.
  >
  > 그 이유는 다음 문구에서 찾아볼 수 있었습니다. "For an enum, all its associated values must conform to Equatable. (An enum without associated values has Equatable conformance even without the declaration.)"

- CustomStringConvertible

  기존에 하드코딩한 방식으로 문구를 출력하는 코드가 있었습니다. 어떻게 하면 기존 코드를 가독성 좋게 하면서 하드코딩을 하지 않게 할 수 있는지 고민해보았습니다.

  > 해결 방법:  재사용성을 높이기 위해 Player 타입을 추가해주었고, 추가 과정에서 RawValue를 사용하지 않고 문구를 출력하기 위해 Player 타입에 CustomStringConvertible을 채택하였습니다.

#### - 함수 재사용 및 기존 코드 확장성 증대

- 새로운 타입 추가

  - Player

    현재 플레이어 정보가 출력되는 부분의 재사용성을 높이기 위해 Player 타입을 사용하였습니다.

  - Game

    기존 함수의 재사용을 위해서 Game 타입을 매개변수로 사용하여 가위바위보/묵찌빠인 경우에 따라 다르게 실행 되도록 해주었습니다. generatePlayersSign과 printGameMenu 함수에서 해당 타입을 받도록 했습니다.

- GameResult의 값 수정

  기존의 draw 값은 가위바위보에서 서로 낸 게 같은 것을 의미하였습니다. 하지만 묵찌빠에서 draw 값을 그대로 쓸 경우 서로 같은 걸 냈더라도 비겼다는 의미로 읽혀서 네이밍을 바꾸어주어야겠다는 고민을 했습니다.

  > 해결 방법:  GameResult의 값 draw를 값 same으로 수정하였습니다.
  >
  > 가위바위보에서는 서로 낸 게 '같은' 게 비긴 거고 묵찌빠에서는 서로 낸 게 '같은' 게 이긴 것이기 때문에 draw를 same으로 바꾸어 재사용성을 높였습니다.
