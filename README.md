# 묵찌빠 게임
> 사용자로부터 1, 2, 3 중 하나의 수를 입력받아
> 컴퓨터가 정한 임의의 수와 가위바위보 형식으로 대결하는 게임.
> 가위바위보를 이긴 플레이어가 턴을 가져가며,
> 두 플레이어가 비길 경우 해당 턴을 가지고 있던 플레이어가 승리.

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)
- [팀 회고](#-팀-회고)

## 🧑‍💻 팀원 소개
| <img src="https://i.imgur.com/PmVVM2M.png" width="200"/> | <img src="https://i.imgur.com/8mg0oKy.jpg" width="200" height="250"/> |
| :-: | :-: |
| [**maxhyunm**](https://github.com/maxhyunm) | [**Mary**](https://github.com/MaryJo-github) |

## ⏰ 타임라인
프로젝트 진행 기간 | 23.05.01.(월) ~ 23.05.05.(금)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.05.01.(월)     | 게임 시작 함수 추가<br/>결과 타입 생성 및 게임 실행 기능 구현<br/>가위바위보 결과를 판단하는 함수 기능 구현 |
| 23.05.02.(화)     | 사용자 입력을 받는 함수 분리<br/>오류처리 추가<br/>     |
| 23.05.03.(수)     | 가위바위보 로직과 묵찌빠 로직 분리 및 구분자 추가<br/>조건에 따라 다른 로직을 실행하도록 함수 수정 |
| 23.05.04.(목)     | 리펙토링 진행     |
| 23.05.05.(금)     | README 작성     |

## 📺 실행화면
- 사용자가 이겼을 때 <br>
![](https://i.imgur.com/oVXvD6C.gif)
- 컴퓨터가 이겼을 때 <br>
![](https://i.imgur.com/fSSSe7m.gif)
- 게임 종료 <br>
![](https://i.imgur.com/5ifvRWJ.gif)



## 🔨 트러블 슈팅 
1️⃣ **가위바위보와 묵찌빠 입력** <br> <br>
🔒 **문제점** <br>
처음 가위바위보를 할 때와 묵찌빠 게임을 진행할 때 전달받는 값이 달라지기 때문에, 하나의 Dictionary 안에 타입을 지정한 튜플을 배치해 `rockScissorsPaper`일 경우와 `mukJjiPpa`일 경우 다른 내용을 반환하도록 구현하였습니다. 하지만 이렇게 처리하니 함수 내에 조건문이 추가되어 코드가 다소 복잡해지는 단점이 있었습니다.
``` swift
typealias gameType = (rockScissorsPaper: Menu, mukJjiPpa: Menu)
     let choices: Dictionary<String, gameType> = [
         "0": (rockScissorsPaper: .exit, mukJjiPpa: .exit),
         "1": (rockScissorsPaper: .scissors, mukJjiPpa: .rock),
         "2": (rockScissorsPaper: .rock, mukJjiPpa: .scissors),
         "3": (rockScissorsPaper: .paper, mukJjiPpa: .paper)
     ]
```
``` swift
guard let computersMenu = choices[String(Int.random(in: 1...3))] else {
             throw GameError.unknown
         }
if isFirstGame {
    let computersChoice = computersMenu.rockScissorsPaper
} else {
    let computersChoice = computersMenu.mukJjiPpa
}
```

🔑 **해결방법** <br>
연산 프로퍼티와 switch문을 활용하여 `isFirstGame` 여부에 따라 다른 값을 리턴하도록 변경하였습니다. 함수 내부에서 조건문이 생략될 수 있어 코드가 훨씬 간결해졌습니다.
``` swift
var choices: Dictionary<String, Menu> {
         switch isFirstGame {
         case true:
             return ["0": .exit, "1": .scissors, "2": .rock, "3": .paper]
         case false:
             return ["0": .exit, "1": .rock, "2": .scissors, "3": .paper]
         }
     }
```
``` swift
guard let computersChoice = choices[String(Int.random(in: 1...3))] else {
             throw GameError.unknown
         }
```


2️⃣ **메시지 출력** <br> <br>
🔒 **문제점 1** <br>
처음에는 `turn` 변수에 willSet을 활용해 정보가 바뀔 때마다 메시지를 출력하도록 구현했습니다. 하지만 이렇게 되면 묵찌빠가 처음 실행되는 첫 번째 게임에서도 "OOO의 턴입니다" 라는 메시지를 출력하는 오류가 발생했습니다.
``` swift
var turn: String {
         willSet(newValue) {
             print("\(newValue)의 턴입니다.")
         }
     }
```

🔒 **문제점 2** <br>
`Result` 타입의 원시값을 이용하여 결과 메세지를 출력하도록 구현하였습니다. 하지만 이렇게 하니 `gameResult.rawValue` 가 어떤 것을 의미하는지 한 눈에 알기 어려웠습니다.
``` swift
enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}
```
``` swift
func startGame() {
    ...
    print(gameResult.rawValue)
    ...
}
```


🔑 **해결방법** <br>
`Result` 타입에 메소드를 추가하여 의미가 모호한 표현을 줄이고, 상태에 따라 알맞는 메세지를 리턴할 수 있도록 구현했습니다.
``` swift
enum Result {
        case win
        case lose
        case draw
        case exit
        
        func selectMessage(isFirstGame: Bool, turn: String) 
    -> String {
            switch self {
            case .win:
                return isFirstGame ? "이겼습니다!" 
                : "\(turn)의 턴입니다."
            case .lose:
                return isFirstGame ? "졌습니다!" 
                : "\(turn)의 턴입니다."
            case .draw:
                return isFirstGame ? "비겼습니다!" 
                : "\(turn)의 승리!"
            case .exit:
                return "게임 종료"
            }
        }
    }
```
``` swift
func startGame() {
    ...
    let resultMessage = gameResult.selectMessage(
        isFirstGame: isFirstGame, turn: turn)
            
            print(resultMessage)
    ...
}
```


3️⃣ **컨벤션** <br> <br>
🤔 **고민했던 점** <br>
조건문과 print문, return 의 개행 위치 등 공통된 컨벤션을 정리하기 위해 스타일 가이드 자료를 기반으로 여러 고민을 거쳤습니다. 개발자에 따라 선호하는 스타일이 다를 수 있고 정답이 없는 부분이라 판단하여, 팀원간 논의 끝에 프로젝트 내에서 함께 지킬 통일된 규칙을 만들었습니다.


## 📑 참고자료
- [Switch](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch)
- [Computed Property](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties#Computed-Properties)
- [Enum](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations)
- [Style Guide](https://google.github.io/swift/)




## 📝 팀 회고
### 우리 팀
👍 활발한 의견 공유 <br>
👍 팀프로젝트 활동시간대를 정하여 개인 공부 시간에 영향 없도록 한 점 

🤔 protocol extension, class 상속 등 다양한 방법을 활용해보고자 했지만 프로그램 흐름에 효율적으로 녹여내는 방법을 찾지 못해 방향성을 선회

### 팀원 피드백
**To. Mary** <br>
👍 네비게이터를 하면서 중간에 여러 차례 방향을 틀어도 척척 이해해주시는 센스 덕분에 짧은 시간에 많은 작업을 할 수 있었던 것 같습니다.<br>
👍 코드가 복잡하게 뻗어나갈 것 같을 때마다 중심을 잡는 좋은 의견들을 내주셔서 효율적인 방향으로 잘 정리할 수 있었습니다.<br>
👍 짝프로그래밍을 하면서 다양한 방향성과 방법에 대해 논의를 할 수 있어서 큰 도움이 됐습니다.

**To. Maxhyunm** <br>
👍 제가 기존에 활용해보지 못한 기능들을 능숙하게 사용하셔서 많은 공부가 되었습니다.<br>
👍 다양한 아이디어를 가지고 계셔서 새로운 관점을 볼 수 있는 좋은 기회가 되었습니다.<br>
👍 모르는 부분에 대해 여쭤보았을 때 이해하기 쉽게 답변해주셔서 좋았습니다.


