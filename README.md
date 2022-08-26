# README

# 1. 제목: 묵찌빠 게임

<br>

# 2. 소개:
가위바위보를 통해 이긴사람이 묵찌빠 턴을 쥡니다.
묵찌빠는 승자가 나올때 까지 진행합니다!

<br>

# 3. 팀원
| zhilly | rhovin |
| --- | --- |
| ![profile1](https://user-images.githubusercontent.com/99257965/186835289-1dd42754-ae2d-4528-9cbc-9e6c916789d4.png) | ![rhovin](https://user-images.githubusercontent.com/99257965/186835583-7d73e447-ea78-4139-bd65-f18b2f3515b3.png) |

<br>

# 4. 타임라인
STEP-1
![STEP-1](https://user-images.githubusercontent.com/99257965/186835106-a7f83445-0dae-40cc-a78c-fcd97e2c4f41.png)


STEP-2
![STEP-2](https://user-images.githubusercontent.com/99257965/186835123-0ff51d49-a6d4-4855-a721-c10a5dba821f.png)

<br>

# 5. 시각화된 프로젝트 구조
## File Tree

```bash
.
├── Case
│   ├── RockPaperScissorCase.swift
│   ├── TurnCase.swift
│   └── WinLoseDrawCase.swift
├── Library
│   └── RockPaperScissorsLibrary.swift
├── Protocol
│   └── RockPaperScissorsLibraryProtocol.swift
└── main.swift
```

## Flow Chart
### STEP-1
![RPS-STEP-1](https://user-images.githubusercontent.com/99257965/186835183-4c2d4427-a8f0-4ede-acb2-952756c72027.jpg)
### STEP-2
![RPS-STEP-2](https://user-images.githubusercontent.com/99257965/186835192-15c17ebc-6201-43be-8031-619d1496b267.jpg)

<br>

# 6. 실행 화면(기능 설명)
## 메뉴선택 & 가위바위보
사용자가 메뉴를 선택 가능하게 합니다.
사용자가 0번을 입력하면 프로그램을 종료합니다.
잘못된 입력을 하면 경고를 출력하고 다시 입력을 받습니다.
승패 결과가 나오게 되면 이긴사람이 턴을 쥐고 묵찌빠가 시작됩니다.

<br>

![기능-종료](https://user-images.githubusercontent.com/99257965/186835489-8486b910-e240-41c7-8279-e997b85ccc29.png)

<br>

![기능-1](https://user-images.githubusercontent.com/99257965/186835514-5de01698-0000-487b-b793-b825de8c7d87.png)


## 묵찌빠
턴을 쥔 쪽을 출력해주고 사용자에게 입력을 받습니다.
사용자가 잘못된 입력을 하게 되면 턴은 컴퓨터에게 넘어가고 다시 입력을 받습니다.
마찬가지로 0을 입력받게 되면 프로그램을 종료합니다.
묵찌빠 승패 결과가 결정되면 누구의 승리인지 출력하고 게임을 종료합니다.

<br>

![Cursor_및_RockPaperScissors_—_RockPaperScissorsLibrary_swift](https://user-images.githubusercontent.com/99257965/186835938-9eba4917-3760-4968-a9f2-52c10893cab1.png)

<br>

![기능-2](https://user-images.githubusercontent.com/99257965/186835913-be867fd4-d974-4051-923a-0a8263e00b34.png)

<br>

# 7. 트러블 슈팅
- 캡슐화, 은닉화, 접근제어
`Protocol`과 접근제어를 통해 프로그램을 어떻게 캡슐화, 은닉화 할지 고민 했습니다. 
    > 어떻게 캡슐화 했나?

    사용자에게 제공하는 인터페이스 함수를 제외한 모든 함수들을 `RockPaperScissorsLibrary` 로 패키징 해서 캡슐화 시켰습니다. 또한 `RockPaperScissorsLibrary`가 인터페이스 함수가 정의된 `RockPaperScissorsLibraryProtocol` 를 채택하도록 해서 패키징된 함수를 사용할 수 있게 했습니다.
    
    <br>

    > 왜 `Protocol`을 사용했나?
    
    `Protocol`을 사용함으로 사용자에게 프로그램의 인터페이스를 제시해 준다는 목적으로 사용했습니다.
    
    <br>

    > 왜 `Extension`을 사용했나?

    `Extension`을 사용한 이유는 `RockPaperScissorsLibrary`가 `RockPaperScissorsLibraryProtocol` 를 준수하도록 하기 위해 작성하였습니다.
    
    <br>

    > 접근 제어는?

    `RockPaperScissorsLibrary` 내부에 있는 `callStartGame()`를 제외한 메스드들은 외부 소스파일에서 접근 및 사용되면 안되므로 `private` 접근제어자를 통해 내부 메서드들을 은닉화 시켜주었습니다.
    
    <br>

- 매직넘버

    > 소스 코드 안에 작성된 구체적인 숫자값 또는 문자열을 매직넘버, 매직리터럴 이라고 합니다. 여기서의 1, 2, 3 값에 대한 의미는 코드작성자가 아니고서야 한눈에 알아보기 힘들 것 같습니다. 어떻게 바꿔줄 수 있을까요?

    사용자 입력, 게임 승패, 게임 턴 케이스로 나누기 위해 열거형을 정의하여 가독성을 높힐 수 있도록 리펙토링 하였습니다.
    ```swift
    enum RockPaperScissorCase {
    	  case end
        case scissor
        case rock
        case paper
    }
    ```
    ```swift
    enum WinLoseDrawCase {
        case lose
        case win
        case draw
    }
    ```
    ```swift
    enum TurnCase: String {
        case ComputerTurn = "컴퓨터"
        case UserTurn = "사용자"
    }
    ```

<br>

- 함수의 기능분리

    > 어떠한 기준으로 기능 분리를 하였나?
    
    하나의 함수는 하나의 기능만을 실행할 수 있다. 라는 기준을 잡고 최대한 함수들이 한 가지 기능만 실행할 수 있도록 기능 분리를 하였습니다. 따라서 코드의 가독성이 향상되고 유지보수에도 용이해졌습니다.

<br>

- 게임 시작하는 함수 호출

    내부 로직에서 `startGame()` 이라는 함수가 조건에 맞게 계속 호출 되었어야 했습니다. 따라서 `while`문을 사용해서 호출을 할지 재귀함수를 이용해서  `startGame()` 내부에서 호출을 할지 고민을 했습니다. 프로젝트 단위가 크다고 생각하지 않고, 가독성을 위해서 재귀함수를 사용하는 방법을 이용해서 호출하였습니다.

<br>

- 네이밍, 컨벤션

    함수의 역할을 의도에 맞게 전달될 수 있고, 함수 이름과 파라미터가 자연스럽게 읽혀질 수 있는 명확한 이름을 짓기 위해 고민했습니다.

<br>

- if와 switch

    `userHand와` `computerHand를` 각각 변수로 받아  if-else 문로 비교해서 게임 결과를 반환했는데, `userHand와` `computerHand를` hand라는 튜플로 묶어 swith문으로 분기처리 하였습니다.

<br>

# 8. 프로젝트 수행 중 핵심 경험

- 열거형을 switch 문에 활용하기
- class, struct에 대한 이해
- protocol, extension에 대한 이해
- 접근 제어자 5가지에 대한 이해
- Swift Convention Guide를 지키며 코드 작성하기
- 캡슐화, 은닉화 고민하며 코드 작성하기
- 함수는 하나의 기능만 실핼할 수 있도록 기능분리하기
- API Design Guidlines을 지키며 네이밍 정하기
- Git Commit 단위 고민하기
- 소스파일 역할에 따라 그룹화

<br>

# 9. 참고 링크

* [API Design Guidlines](https://swift.org/documentation/api-design-guidelines/)
* [Swift Style Guide](https://google.github.io/swift/)
* [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
* [miro.com - flow chart](https://miro.com/)
* [Control Flow — The Swift Programming Language (Swift 5.7)](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
* [Enumerations — The Swift Programming Language (Swift 5.7)](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
* [Access Control — The Swift Programming Language (Swift 5.7)](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
* [Protocols — The Swift Programming Language (Swift 5.7)](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
* [Extensions — The Swift Programming Language (Swift 5.7)](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
