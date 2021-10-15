## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

 &nbsp;
  &nbsp;
  
## 프로그램 가이드 👊✌️🖐


승자가 결정될 때까지 가위바위보를 진행합니다. 가위바위보의 승자는 턴을 쥐고 묵찌빠를 시작합니다. 

묵찌빠에서는 

1. 다른 패를 냈을 시 -> 그 패를 비교하여 승자가 다음 묵찌빠의 턴을 쥡니다. 
2. 같은 패를 냈을 시 -> 턴을 쥔 사람이 승리하고 게임이 종료됩니다. 

_!!콘솔 입출력을 통해 게임을 진행합니다.!!_

 &nbsp;
  &nbsp;
   &nbsp;
   
## ❕코드 가이드❕
- _'가위바위보에서 비겼을 경우'_, _'묵찌빠에서 패가 다를 경우'_, _'두 게임 모두에서 사용자 입력이 잘못되었을 경우'_ 에 __게임이 반복__ 됩니다.
-  이 반복은 __재귀 함수__ 형태로 구현했습니다. 함수 내부에서 자기자신을 다시 호출하는 것입니다.
- 그렇기에 __재귀 함수를 탈출하는 조건(반환값)__ 에 일관성을 갖고자 했습니다. 
- 다음은 저희가 의도한 조건입니다.
1. 사용자가 "게임 종료"를 선택한 경우 -> __`nil`을 리턴하여 종료를 알림.__
2. 사용자가 잘못된 입력을 해서 올바른 입력을 다시 받아야 할 경우 -> __재귀 호출하여 올바른 값을 전달받아 반환.__  (올바른 값을 받거나 게임 종료를 선택할 때까지 재귀를 반복함)
3. 가위바위보 게임에서 비기거나 묵찌빠에서 패가 다른 경우 -> __승자가 나올 때 까지 재귀호출하여 승자를 전달받아 반환.__ 

&nbsp;
 &nbsp;

## Flowchart

![](https://i.imgur.com/LdRZ40O.png)
:warning:  ~~Flowchart는 Step2까지 모두 구현하였을 때를 기준으로 작성함. 현재 Step1 단계에서는(2021.10.12) 가위바위보 게임의 승자가 결정된 후 묵찌빠게임으로 진행되지 않고 프로그램 종료됨.~~ 

⭕️2021.10.15 현재 Flowchart 에 표현된 모든 기능 구현완료⭕️

 &nbsp;
 
## 작동 예시

- 컴퓨터 승리 

![패배](https://i.imgur.com/eqRHSX8.gif)

- 여러 오입력 케이스, 게임 종료 명령("0") 입력

![오입력](https://i.imgur.com/PjWHbQD.gif)

- 묵찌빠에서 오입력 시 턴 변경, 사용자 승리

![사용자 승리](https://i.imgur.com/nxbB6b9.gif)
---

 &nbsp;
 &nbsp;
 &nbsp;

## namu - 느낀점

  STEP2 PR을 보내는 현 시점의 코드는 `다중 재귀함수` 구조로 되어있다. 또한 `함수의 재사용`을 위해 STEP1에서 구현했던 함수들에 __`현재 어떤 게임을 위해 함수를 호출하는지 전달하는 매개변수`__ 들이 추가되어있다.(ex -`GameMode`) 결과적으로, 이 코드는 __`흐름을 쉽게 이해하며 읽기 힘들며(재귀 구조 때문)`__, 각각의 함수들도 __`너무 많은 매개변수와 리턴값`__ 을 가지게 되어 가독성이 떨어진다고 판단된다.

   __재귀 구조로 반복 로직을 구현한 이유__ 는, __몇 가지 형태를 피하고 싶어서__ 였다. 
1.__`전역(Global Scope)에서의 반복문 사용`__ 은 처음부터 고려하지 않았는데, 그 이유는 전역에 중요한 로직을 구현하면 __추후 `유지보수`__ 하기 위해서 __전역의 코드들을 처음부터 끝까지 들여다봐야__ 하고, __해당 로직을 재사용할 수 없으며__ , __`전역 변/상수`를 사용__ 하게 될 것이기 때문이다.
2.__함수 내에서 반복문 사용__ 도 피하고 싶었는데, 시각적으로 __`코드 뎁스가 깊어지는 문제(들여쓰기)`__ 가 부담스러웠고, 특정 루프를 반복시키는 함수는 필연적으로 __`하나의 함수가 너무 많은 기능을 포함`__ 하게 될 것 같았다.

  설계 시 부터 __`비슷한 기능의 함수들을 여러 곳에서 재사용`__ 하려는 목표를 세우고 시작했는데, 그것이 __결과적으로 역효과__ 를 내게 된 측면도 있는 것이다. 현재 게임이 가위바위보냐 묵찌빠냐에 따라 미세하게 다르게 처리해야 하는 부분이 있는데, 이것을 같은 함수로 처리하려다 보니 `추가적인 정보전달`이 필요하게 되는 것이다.

  사실 이 기능들이 `타입` 내부에서 구현되었다면 타입의 `private property`로 변수를 만들어두고 그것을 통해 1.현재 진행되는 게임이 무엇인지와 2. 누구의 턴인지 등의 정보를 쉽게 저장 및 전달할 수 있었을 것이다. 그렇다면 현재의 복잡한 로직이 상당부분 해소될테지만, 현재 코드는 전역에서 함수만을 정의하여 구현하기 때문에 전역변수를 놓는 것을 어떻게든 피하려 하다가 이렇게 된 측면도 있다.

  하지만 이런 경험을 통해 __`함수 간 값 전달 방법`__ 이나 __`순환하는 Flow를 가진 로직의 구현 방법`__ 에 대해 깊이 고민해볼 수 있었던 것 같다. 함수는 가장 기본적인 기능 구현단위이지만, 능숙하게 사용하려면 발전의 여지가 많이 남아있는 것 같다. 또한 __`재귀함수로 반복을 구현함의 단점`__ 을 명확히 깨닫게 되어, 배운게 많은 프로젝트 경험이었다.


## 쿼카
### 느낀점

- 오류처리할때 빠른종료구문 `guard let`으로 `enum`에 정리된 오류메세지를 처리하는 보편적인 방식이 있는데 똑같이 일회성으로 사용되는 `print()`함수도 `enum` 타입으로 묶어서 활용했을때 변수와 상수나 함수의 매개변수 안에 넣어서 활용할때 코드가 훨씬 문장같아 가독성이 좋아지는것 같다.

- `enum` `case`값들에 대한 배열 컬렉션을 제공하는 프로토콜 `CaseIterable` 을 활용하여 반복문이나 조건문에도 활용할 수 있다는 점, `case`들이 갖는 프로퍼티를 생성하여 다양한 선택지를 파생적으로 제공해줄 수 있음을 알게되었다.

- `switch`문의 기본적인 기능만 알고있는 상태와, 스위치문의 `switch`에서 `튜플`로 조건체크범위를 넓히고`where`로 하나 체크하고 `if`문을 `case`안에 넣어서 사용할 필요가 없게끔 활용할 수 있는 차이는 
   코드를 늘어짐을 줄일 수 있다. 그래서 공식문서를 가볍게 읽고 넘기는 행위는 조심하고 꼭 문서통해서 이해안되는 `예시코드`는 직접 `xcode`에 예제문을 작성하여 구현해야 내것이 된다.
   

### 고민했던점 

- print()메서드를 이용해서 일회성으로 사용하는 문자열출력보다 enum안에 담아서 문자열들을 호출하는게 변수나 상수 또는 함수와 잘 어울려 자연스럽고 가독성이 좋아진다는 생각드는 동시에
  한편으로 기본적으로 제공하는 print()메서드를 이용해서 간단하게 작성할 수 있는데 오히려 코드를 더 길어지게 사용함으로써 역설적인? 코드의 늘어짐이 생길 수 도 있는거 아닌가 라는 생각이들었다.

- 프로젝트는 하나의 함수의 기능을 준수하도록 작성하였고 반복문?대신 재귀함수형태로 진행이되었다. 사실 핵심경험 중 하나로 “재귀함수와 반복문의 차이점”을 이해하는게 있었지만 이 부분을 양쪽으로 이해하기에는 여유가 없었던것같다..재귀함수를 구현하게 되면서 느낀점은 코드를 이해하는 시간이 상대적으로 길어질 수 있다는 점과 재귀함수 형태로 함수의 매개변수나 리턴타입을 추가 또는 변경할때 연관되어있는 여러개의 함수들의 흐름에도 생각하지않을 수 없어 번거로움이 있었던것같다. 예시로) 반환 타입을 튜플로 설정하면서 연관되어있는 함수들의 컴파일오류? 등을 해결하는것까지 같이 생각해야할 필요가 있었던것같다. 그래서 코드를 수정할때 “고려해야할 점이 더 늘어나는거일 수 있겠다. “ 라는 생각이 들었고 반복문으로 구현되면 어떤 점의 차이가 존재할지? 그리고 재귀함수를 사용한다면 어떤상황일때 사용하는게 좋을지? 궁금해지는 시간이었다.

## 타임라인 
## STEP2  / 10월 15일 (Fri)

  &nbsp;

### ❓이슈와 해결 방법❗️
**1.**    `checkGameResultBy(userHand:,computerHand:)` 함수 리팩토링 중 의도치 않은 작동 발생 이슈
```swift
func checkGameResult(by userHand: HandGameHand, computerHand: HandGameHand) -> HandGameResult {
    if userHand == computerHand {
        return .draw
    } else if userHand == .paper && computerHand == .rock) {
        return .user
    } else if (userHand == .rock && computerHand == .siccors) {
        return .user
    } else if (userHand == .siccors && computerHand == .paper) {
        return .user
    } else {
        return .computer
    }
}
```
원래 위와 같은 상태의 함수였는데, 사용자가 이기는 경우들인 `else if` 블록 내에서 모두 같은 동작(`return .user`)을 하게 되기에 때문에 조건들을 하나로 통합하여 실행문을 한 번만 쓸 수 있도록 아래와 같이 리팩토링함. 
```swift
func checkGameResult(by userHand: HandGameHand, computerHand: HandGameHand) -> HandGameResult {
    if userHand == computerHand {
        return .draw
    } else if userHand == .paper, computerHand == .rock ||
                userHand == .rock, computerHand == .siccors ||
                userHand == .siccors, computerHand == .paper {
        return .user
    } else {
        return .computer
    }
}
```
하지만 추후 테스트 도중 아무리 게임을 반복해도 사용자가 가위바위보를 이겼다는 결과가 나오지 않음.

컴퓨터의 패를 `print()` 해보니,  __사용자가 이기는 경우에도 패배라고 판단하는 버그__ 발생함.

**-> 해결 방법**
조건을 논리 연산자 `||`로 연결하는 과정에서 착오가 발생했던 것. 먼저, 전제가 되는 지식은 다음과 같다.
1. `,`쉼표로 이어진 `condition-list`는 논리연산자로 결합할 수 없음. 예컨데, `(A&&B)||(C&&D)`는 가능하지만 `(A,B)||(C,D)` 는 불가능하다.
2. 쉼표는 연결된 조건`condition`/`condition-list`들을 나열하는 것이고, `&&`는 표현`expression`을 만들어내는 연산자이다. `condition`은 `expression`의 상위 개념이다. 즉, `expression`은 `condition`이지만, `condition`은 `expression`이 아니다.

그렇기에, `condition-list`를 `||`로 이어붙이려고 했던 시도 자체가 잘못된 것이다. 게다가 콤마 단위로 조건이 분할되어 원래 의도와 전혀 다른 조건이 되어버린다. 소괄호로 묶어 표현해보면 다음 코드같은 상황이 되어버린 것이다.
```swift
  userHand == .paper && (computerHand == .rock ||
    userHand == .rock) && (computerHand == .siccors ||
    userHand == .siccors) && computerHand == .paper
```
이런 상황이기에 당연히 사용자가 이긴다는 조건문 블록으로 진입이 불가능했던 것이고, 자연스럽게 `else` 블록으로 탈출해 사용자 패배라는 결과를 반환하게 된 것이다.
그래서 본래 의도에 맞는 조건으로 다음과 같이 최종 변경하였다.
```swift
func checkGameResult(by userHand: HandGameHand, computerHand: HandGameHand) -> HandGameResult {
    if userHand == computerHand {
        return .draw
    } else if (userHand == .paper && computerHand == .rock) ||
                (userHand == .rock && computerHand == .siccors) ||
                (userHand == .siccors && computerHand == .paper) {
        return .user
    } else {
        return .computer
    }
}
```
:warning::warning::warning: 교훈: 조건과 논리연산자를 다룰 때는 두 번 세 번 확인하자! :warning::warning::warning:

 &nbsp;
 &nbsp;
 ---
  &nbsp;
  &nbsp;

**2.** 사용자 메뉴얼 입력 할때 `가위(1)바위(2)보(3)`와 `묵(1)찌(2)빠(3)` 의 차이가 1과 2의 순서만 다르다는것으로 받아들여져 재활용해보자라는 아이디어가 나왔습니다.
  그래서 `튜플`타입을 이용하여 `가위바위보`와`묵찌빠`를 `gameMode` 선택에 따라 조건(`switch`)을 체크하고 반환값을 설정하였습니다. 
  
  ### `Before` `After`차이 
  - 리턴값을 담는 `statusMessage`와`userHandResult` 변수를 사용하지않고 `case`안에서 바로 리턴값 설정, 반환하지않는 `튜플`내 매개변수는 `nil`처리
  - `튜플` 타입을 사용하여 `case` 의 조건을 `가위바위보와` 와 `묵찌빠` 로 분기
  
`[Before]`
```swift
func receiveUserManualInput() -> (userHand: HandGameHand?, errorMessage: HandGameExceptionMessage?) {
    var statusMessage: HandGameExceptionMessage?
    var userHandResult: HandGameHand?
    print(HandGameMessage.rockPaperSiccorsManual.rawValue, terminator: "")
    let userInput = readLine()?.replacingOccurrences(of: " ", with: "")
    
    switch userInput {
    case "1":
        userHandResult = .siccors
    case "2":
        userHandResult = .rock
    case "3":
        userHandResult = .paper
    case "0":
        statusMessage = .endGame
    default:
        statusMessage = .wrongInput
    }
    return (userHandResult, statusMessage)
}
```
`[After]`
```swift
func receiveUserManualInput(of gameMode: GameMode) -> (userHand: HandGameHand?, exceptionMessage: HandGameExceptionMessage?) {
    printMessage(of: gameMode == .rockPaperSiccorsGame ?
                    HandGameManual.rockPaperSiccorsManual : HandGameManual.mukjipaManual)
    let userInput = readLine()?.replacingOccurrences(of: " ", with: "")

    switch (userInput,gameMode) {
    case ("1", .rockPaperSiccorsGame), ("2", .mukjipaGame):
        return (.siccors, nil)
    case ("2", .rockPaperSiccorsGame), ("1", .mukjipaGame):
        return (.rock, nil)
    case ("3", .rockPaperSiccorsGame), ("3", .mukjipaGame):
        return (.paper, nil)
    case ("0", .rockPaperSiccorsGame), ("0", .mukjipaGame):
        return (nil, .endGame)
    default:
        return (nil, .wrongInput)
    }
}
```


### 학습 키워드
함수 재활용, 중복 코드 병합, 재귀함수 코드흐름 이해하기, 열거형 프로퍼티
 &nbsp;


## STEP1 
### 10월 11일 (Mon)
### 의도한 점
- 가급적 하나의 함수가 하나의 기능만 하도록 Flowchart 단계부터 고민하며 설계했습니다.
- 가위바위보와 묵찌빠 게임에서 공통된 기능은 같은 함수를 재사용할 수 있도록 구현하려 했습니다.
- 열거형을 정의하여 코드 가독성을 높이고 함수 간 값 전달이 용이하도록 설계했습니다.
- 사용자 입력을 받을 숫자가 4개인 점을 고려하여 선택지를 한정시킬 수 있는 switch문을 선택하였습니다.


### 고민한 점
- 함수의 네이밍에서 모호한 단어을 줄이고 함수의 기능을 표현함에 더 가깝게 작성하려고 했습니다.

### 학습 내용
### 키워드
열거형, Naming

### 10월 12일 (Tue)

## [나무]
### 의도한 점
- 추후 함수 재사용을 위해 범용적인 매개변수 타입 및 범용적인 리턴 타입으로 통일할 필요성을 느꼈기에 열거형을 정의하였습니다.

### 고민한 점
- 가위바위보 게임의 승패를 결정하는 로직을 열거형의 프로퍼티로 구현하는 방법, 재귀 열거형을 사용하는 방법을 모두 고민해보았으나 기존 코드를 너무 많이 수정해야 하고, 함수 간 메세지 전달이 오히려 불편해지는 문제로 인해 해당 기능은 별도의 함수로 구현하였습니다.
- 사용자 입력을 받고 그에 따라 분기하는 부분이 가장 구현이 까다로웠습니다. Result<T,T> 타입으로 반환, 튜플 타입으로 반환 등 여러 방법을 고민해 볼 수 있었고, 반환된 값을 예외처리하거나 옵셔널바인딩하는 로직을 구현하는데 가장 많은 시간을 들였습니다. 
- 승리 조건을 판별하는 여러가지 방법을 고민해 보았습니다. switch문의 where를 통해 추가적인 조건을 걸어주는 방법이나, 일반적인 if와 else if, else를 조합하는 방법, guard를 사용하는 방법을 다양하게 시도해 보았습니다.
### 학습 키워드
- 열거형, 사용자 정의 타입, 열거형의 연관값, recursive Enumeration, 함수의 전달인자 레이블, 매개변수, 리턴 타입, switch, where, 옵셔널 바인딩




## [쿼카]
### 의도한 점
- 1,2,3,0 이렇듯 선택지가 한정적일 경우 그에 맞게 선택지를 제공하는 제어문인 스위치문을 사용했습니다.
- 지속적으로 활용되는 패들을 enum에 묶고 일회성이 잦은 print()메서드를 enum안에 담아 게임내에서 사용하는 용도로 묶어주었습니다.
- 함수와 변수 네이밍의 통일성을 생각하여 구현했습니다. ex) func checkGameResult(), var gameResult..
- 구현한 함수들을 startRockPaperSiccorsGame()내에서 FlowChart와 일치하게끔 나열하였습니다.
- 함수명과 매개변수명이 합쳐져 한 영어문장을 만들 수 있는 네이밍을 고려하였습니다.

### 고민한 점
- 함수 기능은 내부에서 한가지의 기능만을 추구하기 위함과 하드코딩을 지양하고 함수의 기능이 범용적으로 활용할 수 있도록 고민하였습니다.

- STEP1에서 사용하는 checkGameResult와 같은 함수는 STEP2에서도 활용될 수 있음을 고려하여 재활용성을 생각했습니다.

- 옵셔널 타입을 반환되는 값을 let userInput에 담아 사용할시, 옵셔널 래핑 전과 후를 구분하여 네이밍을 작성했습니다.
ex)래핑이존재할때 = let wrappedUserInput, 래핑 벗겨진 이후 = let userInput

### 학습 내용
- if generateRandomHand() 함수를 바로 userHand와 패를 비교하여 사용하였을때 발생하는 오류
generateRandomHand()함수가 if의 조건을 체크할때마가 값이 변경되어 오류를 발생시킴.
고로 generateRandomHand()함수의 값을 상수에 담아서 정해진 값으로 비교하는 것이 안전하다.

- 사용자 정의 타입인 열거형을 사용함으로 코드의 가독성을 높일 수 있었다.
열거형의 연관값과 원시값을 코드를 하게되면 Int나 String의 값도 영어문장처럼 코드하는 방식으로 사용하여 가독성을 높일 수 있다는 점이 흥미로웠다.

- func receiveUserManualInput() -> (userHand: HandGameHand?, errorMessage: HandGameMessage?){}
매개변수 두가지(옵셔널이 아닐경우)중 하나의 매개변수만을 사용하야할시 굳이 할 필요없는 값도 return해줘야하지만
옵셔널을 적용하면 그수고를 하지않아도 된다는 것을 알게되었습니다.

### 학습 키워드
- 옵셔널, enum, switch, 옵셔널래핑, 얼거형의 연관값과 원시값 구분
