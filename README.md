## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

# 📝 동기화 메모장

1. 프로젝트 기간: 2021.10.11 - 2021.10.15
2. Grounds Rules
    - Time Rule
        - 아침: 10시
        - 점심시간: 12시~ 1시
        - 저녁시간: 6시~7시
        - 프로젝트 최대 제한시간: 저녁 9시 ~ 최대 9시 30분 까지!
3. 커밋 규칙
    - 단위 : 기능 단위로
    - Convention: Karma Style

## 키워드

- `Naming`
- `Coding Convention`
- `switch` `repeat-while` `guard` `if-else`
- `struct` `enum` `method`
- `default parameter`
- `Read-Only Computed Properties`
- `static property`
- `CustomStringConvertible`
- `,` `&&`
- `Optional`
- `CaseIterable`
- `재귀함수`
- `LLDB`

# 목차
- [💻 Contributors](#💻-Contributors)
- [👩🏻‍💻 Reviewers](#👩🏻‍💻-Reviewers)
- [📄 Flow chart](#📄-Flow-chart)
- [1️⃣ STEP 1 : ✌🏻, ✊🏻, 🖐🏻 구현](#1️⃣-STEP-1-:-✌🏻,-✊🏻,-🖐🏻-구현)
    + [고민했던 것](##1️⃣-고민했던-것)
    + [의문점](##1️⃣-의문점)
    + [Trouble Shooting](##1️⃣-Trouble-Shooting)
    + [배운 개념](##1️⃣-배운-개념)
    + [PR 후 개선사항](##1️⃣-PR-후-개선사항)
- [2️⃣ STEP 2 : ✊🏻, ✌🏻,🖐🏻 구현](#2️⃣-STEP-2-:-✊🏻,-✌🏻,-🖐🏻-구현)
    + [고민했던 것](##2️⃣-고민했던-것)
    + [의문점](##2️⃣-의문점)
    + [Trouble Shooting](##2️⃣-Trouble-Shooting)
    + [배운 개념](##2️⃣-배운-개념)
    + [해결하지 못한 점](##2️⃣-해결하지-못한-점)
    + [PR 후 개선사항](##2️⃣-PR-후-개선사항)

# 💻 Contributors

@leeari95 @junbangg

# 👩🏻‍💻 Reviewers

@soll4u 

# 📄 Flow chart
![가위바위보 시작](https://i.imgur.com/SbJ7RUy.jpg)
![승패판정 메소드](https://i.imgur.com/XIC3Gle.jpg)
![묵찌빠 시작](https://i.imgur.com/Ei5xUvV.jpg)

# 1️⃣ STEP 1 : ✌🏻, ✊🏻, 🖐🏻 구현

가위바위보 게임을 구현합니다.

## 1️⃣ 고민했던 것

- 순서도의 작성 기준
- 일반화, 추상화, 은닉화, 캡슐화
- 코딩 컨벤션 정하기
- commit 스타일과 커밋 단위의 기준
- 적절한 Naming
- 코드 내부 가독성을 높이기 위한 여러가지의 방법
- 메소드 순서
- 메소드를 한가지의 기능 별로 분리, 확장성 고려
- 사용자 정의 타입을 원하는 형식의 문자열로 출력하게 만들기 위한 방법
- 타입 내부 property를 외부에서 바로 사용하는 방법

## 1️⃣ 의문점

- `repeat-while문`에서 `, 콤마`를 쓰니 에러가 났다. `&&`랑 `,`의 정확한 쓰임새가 궁금해졌다.
- 메소드명을 지을 때 파라미터명과 연결해서 지어주는 것이 나은건지? 아니면 메소드명에 한꺼번에 지어주는 것이 알맞은지 헷갈렸다.
ex) `validate(userInput:) validateUserInput(_ input:)`
- 조건문을 변수로 나누어서 만드는 것이 나은 방법인지, 하나로 연결해서 만드는 것이 나은 방법인지 판단이 어려웠다.
    
    ```swift
    private func isVictory(_ playerNumber: String?, _ opponentNumber: String) -> Bool {
        let winningCaseA = playerNumber == "1" && opponentNumber == "3"
        let winningCaseB = playerNumber == "2" && opponentNumber == "1"
        let winningCaseC = playerNumber == "3" && opponentNumber == "2"
        return winningCaseA || winningCaseB || winningCaseC
    }
    ```
    
    ```swift
    private func isPlayerWin(_ playerNumber: String?, _ opponentNumber: String) -> Bool {
        return (playerNumber == scissor && opponentNumber == paper)
            || (playerNumber == rock && opponentNumber == scissor)
            || (playerNumber == paper && opponentNumber == rock)
    }
    ```
    

## 1️⃣ Trouble Shooting

- `,`는 `condition`을 `이어붙이는 용도`로 쓰는 것이고, `&&`는 `두개의 boolean expression`을 `파라미터로 받는 논리 연산자`이다.
`while, if, guard문`에는 `condition-list`를 쓰지만, `repeat-while문`에서는 `condition`만 쓸 수 있다. 즉, 콤마로 여러 condition을 이어붙이는 것이 허용된 곳과 아닌 곳이 있는 것이다.
- 타입의 프로퍼티를 외부에서 바로 사용하려면 `static`키워드를 추가해줌으로써 정적 프로퍼티로 만들어야 한다.
- 조건문을 한 줄로 return 해주는 것 보다 switch로 조건문을 넣어주는 것이 **가독성 향상**에 도움이 된다.
    
    ```swift
    // 이전 코드
    private func isPlayerWin(_ playerNumber: String?, _ opponentNumber: String) -> Bool {
        return (playerNumber == scissor && opponentNumber == paper)
            || (playerNumber == rock && opponentNumber == scissor)
            || (playerNumber == paper && opponentNumber == rock)
    }
    // 변경 후
    private func isPlayerWin(_ playerHand: PlayerOption?, _ opponentHand: PlayerOption) -> Bool {
        switch (playerHand, opponentHand) {
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
            return true
        default:
            return false
        }
    }
    ```
    
- `reset` commit한 것이 마음에 들지 않을 때 reset을 이용하여 초기화 해줄 수 있다. `--hard` 옵션을 사용하면 작업중인 내용을 가져오지 않고 완전히 삭제가 된다. **아직 commit을 하지 않았다면 git reset hard를 사용하는 것은 주의**해야 한다.
- `reflog` 해당 명령어를 사용하면 **reset으로 지웠던 모든 이력**을 볼 수 있다.

## 1️⃣ 배운 개념

- 순서도 작성 시 따로 분리하여 그려보는 방식
- 메소드 확장성을 고려해보는 방법
- 코드 내부 가독성을 높이기 위한 방법
- Read-Only Computed Properties
- CustomStringConvertible 프로토콜의 용도
- CaseIterable 프로토콜의 용도
- Optional과 non-Optional을 비교하기
- guard문, if-else문, switch문의 적절한 활용방법
- static property의 용도

## 1️⃣ PR 후 개선사항

- 가위, 바위, 보 프로퍼티를 삭제한 후 `enum`으로 분리
- `validate` 메서드를 삭제하고, `recieveUserInput` 내부에 `if문`을 `switch문`으로 수정
- `isWrong` 메서드명 변경 (isWrong > **isWrongInput**)
- `isDraw` 파라미터의 순서를 `isPlayerWin`의 파라미터 순서와 동일하게 수정해주었음 (`player`가 앞으로 올 수 있도록 **기준**을 정함)
- `RockPaperScissorsGame` 내부에 승패판정 메소드를 따로 분리하여 구조체(`GameJudgment`)로 생성함
- `Message` 내부 `desctiption` 프로퍼티를 **하단**으로 순서를 변경함
- enum `RockPaperScissor` 이름을 `PlayerOption`으로 변경
- `startGame` 메서드 내부에 있던 승패를 출력하는 `if문`을 `printGameResult()` 메서드로 분리함
- `RockPaperScissorsGame` 내부에 있는 `randomHand` 프로퍼티를 `playerOption` 내부로 위치를 변경함

---

# 2️⃣ STEP 2 : ✊🏻, ✌🏻, 🖐🏻 구현

묵찌빠 게임을 구현합니다.

## 2️⃣ 고민했던 것

- 재귀함수와 반복문의 적절한 사용법
- 가위바위보에서 활용하였던 승패판정을 묵찌빠에서도 활용할 수 있는 법
- 적절한 Naming
- 들여쓰기를 최대한 줄이는 코드 작성법
- 코드의 가독성

## 2️⃣ 의문점

- guard문 안에서 재귀함수를 호출하면 앞서 호출되었던 재귀함수는 종료되는 것이 아닐까?
- 반복문과 재귀함수를 선택할 때 어떤 점을 고려해야 할까?
- 코드의 가독성만을 위해서 사용자 정의 타입을 만드는 것이 과연 적절한 것일까?

## 2️⃣ Trouble Shooting

- 재귀함수가 guard문 안에서 끝나는지 확인하기 위해 **디버깅모드**를 통해 해결하였다.
    
    ![debugging](https://i.imgur.com/GqmeQqb.png)

    
    - 재귀 호출을 할 때 메모리에 어떤 변화가 있는지 확인해보았다. `디버깅모드`로 통해 확인할 수 있다.
    `Thread` 내부에 재귀함수가 들어가는데 호출된 재귀함수들이 `Queue` 에 하나씩 쌓이다가 마지막에 호출된 재귀 함수가 `guard`를 모두 통과하여 함수가 **종료**되면 쌓였던 재귀 함수들이 차례대로 `return`이 되면서 `Queue`에서 **제거**되는 모습을 볼 수 있었다.
- 재귀함수를 구현하고 디버깅을 하니 복잡하고 어려웠다. 메모리 측면에서도 이 프로젝트에서는 큰 차이는 없겠다만 성능적으로는 좋지 못하다는 사실을 알아냈고, 디버깅을 위해서라도 반복문으로 고쳐야겠다는 생각이 들어서 코드를 재수정 하였다.

## 2️⃣ 배운 개념

- `반복문`과 `재귀함수`의 차이
    - 반복문은 속도가 상대적으로 빠르다는 장점이 있지만, 코드가 복잡해지는 단점이 있다. 재귀함수는 상대적으로 간결한 코드로 작성할 수 있다는 장점이 있지만 반복문에 비해 속도가 느리다는 단점이 있다. 재귀함수는 함수를 반복적으로 호출하기 때문에 스택 메모리를 사용한다. (스택 오버플로우가 발생할 수 있다.) 반면 반복문은 메모리 힙을 사용한다.
    - 성능 측면에서만 본다면 재귀함수는 사용하지 않는 것이 맞다. 반복문으로 구현했을 때 보다 메모리나 속도 등 성능적인 측면에서 많이 뒤쳐지기 때문이다. 하지만 예전처럼 Hardware가 좋지 못해 Software의 속도를 극한까지 끌어올려야 하는 시대가 아니기 때문에 가독성도 고려하여 프로그래밍을 해야한다. 특히 여러사람이 개발에 참여한다면 가독성은 더욱 중요하다. 결국 프로그램의 목적에 맞게 판단해서 사용해야한다.
- 디버깅모드 시 콘솔창에 `n`을 적고 엔터를 누르면 다음 코드로 이어진다.

## 2️⃣ 해결하지 못한 점

- `repeat-while문` 내부 코드를 가독성 있게 고쳐보고 싶었으나 더이상 좋은 방법이 떠오르지가 않았다.
- 재귀함수로 하는 것 보다 반복문으로 재구현 하였으나 어떤 것이 적절한 방법인지 판단하는데 있어서 어려움이 있었다.
- 가독성만을 위해 사용자 정의 타입을 만드는 것이 과연 적절한 것인지에 대한 의문을 풀지 못했다.

## 2️⃣ PR 후 개선사항

- `PlayerOption` 내부 `randomHand`하드코딩 개선
- 사용자의 턴을 나타냈던 `Bool`타입을 `Turn`타입으로 새롭게 만들어서 개선
- `changeTurn` 내부 조건문을 `isWrongInput` 메서드로 대체
- 묵찌빠 게임 타입 내부에 `startGame` 메서드에서 `isContinued`를 `repeat-while문`이 아니라 `changeTurn` 메서드 내부에서 바꿔주도록 로직 변경
