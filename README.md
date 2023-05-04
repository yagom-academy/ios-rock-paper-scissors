## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

# 목차

1. [제목](#1.)
2. [소개](#2.)
3. [팀원](#3.)
4. [타임라인](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)

------

<a id="1."></a>
# 1. 제목: RockScissorPaper & MukJjiPa Game

<a id="2."></a>
# 2. 소개
        사용자에게 1,2,3을 입력받아 가위바위보 게임을 진행합니다.
        가위바위보 게임의 승자가 선으로 묵찌빠 게임을 진행하여 최종 승자를 결정합니다.
        사용자가 0을 입력하면 게임이 종료됩니다.

<a id="3."></a>
# 3. 팀원: EtialMoon🌙, Serena 🐷
| [EtialMoon🌙](https://github.com/hojun-jo) | [Serena 🐷](https://github.com/serena0720) |
| :--------: | :--------: |
| <Img src = "https://i.imgur.com/hSdYobS.jpg" width="150"/>|  <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="150"/>|

<a id="4."></a>
# 4. 타임라인
### 23.05.01
- 가위바위보 게임 메뉴 출력 함수 정의
- 가위바위보 `while`문 활용하여 승패 판정 함수 정의
- `enum` 타입 활용하여 가위바위보 정의
- 승패 판정 함수 속 반복되는 조건문을 `enum`을 활용하여 정리

### 23.05.02
- 가위바위보 `struct` 생성
- `enum`, 함수, `struct` 용도별 파일 분리
- 가위바위보 승패 함수 누락 조건 수정
- `While` 반복문을 재귀함수로 수정
- `if` 조건문을 삼항 연산자로 수정
- 변수, 함수 이름 수정

### 23.05.03
- 묵찌빠 게임 메뉴 출력 함수 정의
- 묵찌빠 승패 판정 함수 정의
- 삼항 연산자 삭제 및 `if` 조건 수정
- 모든 게임 출력 함수 / 메뉴 선택 함수 분리
- 컴퓨터의 패 생성 함수 / 사용자 패와 컴퓨터 패 비교 함수 분리
- 변수, 함수 및 파일 이름 수정

### 23.05.04
- 에러 처리 방법 변경

  : 컴퓨터의 패 생성 함수에서 에러를 던지는 부분을 `nil`을 리턴하게 만들고 패 비교 함수에서 사용할 때 `do-catch`를 옵셔널 바인딩으로 변경
- 변수, 함수 이름 및 에러 메시지 수정

<a id="5."></a>
# 5. 실행 화면
- 사용자로부터 메뉴 번호를 입력받아 가위바위보 게임을 실행한다.

| 가위바위보 사용자 승리 시 | 
| :--------: |
| <Img src = "https://i.imgur.com/sYgKBk1.png" width="500"/> |
| **가위바위보 컴퓨터 승리 시** | 
| <Img src = "https://i.imgur.com/MUXL8Oz.png" width="500"/> |

- 사용자와 컴퓨터가 비기면 다시 가위바위보를 진행한다.

| 가위바위보 사용자와 컴퓨터가 비길 시 | 
| :--------: |
| <Img src = "https://i.imgur.com/r4NyLe2.png" width="500"/> |

- 가위바위보 게임 시 사용자가 잘못 입력한 경우 오류메세지 및 메뉴를 출력한다.

| 가위바위보 게임 시 잘못 입력한 경우 | 
| :--------: |
| <Img src = "https://i.imgur.com/92bcXxm.png" width="500"/> |
 
- 묵찌빠 게임 시 승자의 패와 동일한 경우 승자 판가름을 한다.

| 묵찌빠 사용자 승리 시 | 
| :--------: |
| <Img src = "https://i.imgur.com/Ix22tIJ.png" width="500"/> |
| **묵찌빠 컴퓨터 승리 시** | 
| <Img src = "https://i.imgur.com/aT7AVP8.png" width="500"/> |

- 묵찌빠 게임 시 사용자가 잘못 입력한 경우 턴이 컴퓨터에게 넘어가고, 메뉴를 출력한다.

| 묵찌빠 게임 시 잘못 입력한 경우 | 
| :--------: |
| <Img src = "https://i.imgur.com/BGJhtzo.png" width="500"/> |

- 사용자가 종료 메뉴 선택 시 게임이 종료된다.

| 가위바위보 진행 중 종료 시 | 
| :--------: |
| <Img src = "https://i.imgur.com/XfIRjah.png" width="500"/> |
| **묵찌빠 진행 중 종료 시** | 
| <Img src = "https://i.imgur.com/s6ZWYGZ.png" width="500"/> |


<a id="6."></a>
# 6. 트러블 슈팅
1) 반복문과 재귀함수

    : 처음엔 `While` 반복문을 활용하여 함수를 반복시켰습니다. 재귀함수와 반복문 중 어떤 것이 가독성이 좋은지, 효율적일지 고민하였습니다. 두 가지 모두 시도해본 결과 재귀함수가 가독성이 좀 더 좋다 판단하여 재귀함수를 사용하였습니다.
    
    <details>
    <summary>세부 사항</summary>

    #### 수정 전
    ```swift
    var programRunning = true

    while programRunning {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>")
    if let input: String = readLine() {
    switch input {
    case "1":
        computeGame(userInput: "1")
    case "2":
        computeGame(userInput: "2")
    case "3":
        computeGame(userInput: "3")
    case "0":
        programRunning = false
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }  
    ```

    #### 수정 후
    ```swift
    func startRockPaperScissors() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        selectMenu()
    }
    
    private func selectMenu() {
        guard let input: String = readLine() else {
            print(ErrorMessages.invalidAccess.rawValue)
            return
        }
        
        switch input {
        case HandOptions.scissors.rawValue:
            decideVictory(with: HandOptions.scissors)
        case HandOptions.rock.rawValue:
            decideVictory(with: HandOptions.rock)
        case HandOptions.paper.rawValue:
            decideVictory(with: HandOptions.paper)
        case "0":
            print("게임 종료")
        default:
            print(ErrorMessages.invalidInput.rawValue)
            startRockPaperScissors()
        }
    }
    ```
    </details>
    
2) 삼항연산자
    
    : if문에서 비슷한 조건이 반복되는 것을 줄이기 위해 삼항 연산자를 시도했습니다. 하지만 가독성이 떨어지는 것같아 다시 if문으로 되돌렸습니다.
    
    <details>
    <summary>세부 사항</summary>

    #### 수정 전
    ```swift
    let result = rivalHand == userHand ? "비겼습니다." :
        rivalHand == trialHand ? "졌습니다." :
        "이겼습니다!"
    ```

    #### 수정 후
    ```swift
    if userHand == rivalHand {
        print("비겼습니다!")
        startGame()
    } else if (userHand == .scissors && rivalHand == .paper)
            || (userHand == .rock && rivalHand == .scissors)
            || (userHand == .paper && rivalHand == .rock) {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
    ```
    </details>

3) 에러 처리 방법 변경
    
    : `do-catch` 없이 컴퓨터의 패를 만들 방법을 고민했습니다.
    컴퓨터의 패를 만드는 함수에서 에러를 던지지 않고 `nil`을 리턴하게 만들어 옵셔널 바인딩으로 처리했습니다.
    
    <details>
    <summary>세부 사항</summary>

    #### 수정 전
    ```swift
    private func makeRival() throws -> HandOptions {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            throw Errors.invalidRival
        }
        return rivalHand
    }
    private func compareHand(with userHand: HandOptions) {
        let rivalHand: HandOptions

        do {
            rivalHand = try makeRival()
        } catch {
            print("가위바위보가 성립하지 않습니다.")
        
            return
        }
    ...
    ```

    #### 수정 후
    ```swift
    private func createRival() -> HandOptions? {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            return nil
        }

        return rivalHand
    }
    private func decideVictory(with userHand: HandOptions) {
        guard let rivalHand: HandOptions = createRival() else {
            return
        }
    ...
    ```
    </details>


4) 함수 분리
    
    : 하나의 함수 안에 하나의 기능만 있어야 하기 때문에 함수 단위에 대한 고민을 많이 했습니다. 컴퓨터의 패를 계산하는 함수와 사용자와 컴퓨터의 패를 비교하는 함수를 분리했습니다.
    
    <details>
    <summary>세부 사항</summary>

    #### 수정 전
    ```swift
    func computeGame(userInput: Game) {
        guard let computerNumber: Game = Game.allCases.randomElement() else {
            return
        }
        if userInput == computerNumber {
            print("비겼습니다!")
        } else if (userInput == .scissors && computerNumber == .paper)
                     || (userInput == .rock && computerNumber == .scissors)
                     || (userInput == .paper && computerNumber == .rock) {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    }
    ```

    #### 수정 후
    ```swift
    private func createRival() -> HandOptions? {
        guard let rivalHand: HandOptions = HandOptions.allCases.randomElement() else {
            return nil
        }

        return rivalHand
    }

    private func decideVictory(with userHand: HandOptions) {
        guard let rivalHand: HandOptions = createRival() else {
            return
        }
        
        if userHand == rivalHand {
            print("비겼습니다!")
            startRockPaperScissors()
        } else if (userHand == .scissors && rivalHand == .paper)
                    || (userHand == .rock && rivalHand == .scissors)
                    || (userHand == .paper && rivalHand == .rock) {
            print("이겼습니다!")
            winner = "사용자"
            nextGame.startMukJjiPa()
        } else {
            print("졌습니다!")
            winner = "컴퓨터"
            nextGame.startMukJjiPa()
        }
    }
    ```
    </details>

5) 함수, 변수 네이밍
    
    : 함수를 최소단위로 최대한 나누다 보니 함수명을 설정할 일이 많았습니다. `Struct`도 2개로 분리하였기 때문에 이번 프로젝트를 진행하면서 함수, 변수명을 설정할 일이 많았습니다. 특히 가독성이 좋은 네이밍을 찾고싶은 욕심에 더욱 고민을 많이 했습니다ㅠ 아직은 자주 쓰는 동사, 명사들에 대한 경험이 부족하여 네이밍에 아쉬움이 많았지만 수정에 수정을 거듭하면서 조금은 네이밍에 익숙해지는 거 같습니다.
    
6) enum
    
    : 처음엔 가위바위보의 경우에 대한 `enum`만 정의를 했습니다. 이후 묵찌빠 게임을 진행하면서 다양한 변수들을 두고 `enum` 처리를 할지 말지 고민을 많이 했습니다. 예를 들어 가위바위보와 묵찌빠 게임 모드를 `enum`으로 만들어 이를 각각의 경우로 받아서 `if`문에서 활용을 할지 말지에 대한 고민도 하였습니다. 하지만 결국 2개의 `struct`를 만들어 사용하면서 가위바위보에 대한 `enum`, 에러 프린트 구문에 대한 `enum`만 정의하여 사용하였습니다.

  

<a id="7."></a>
# 7. 참고 링크
- [Apple Developer - API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/#fundamentals)
- [Apple Developer - caseiterable](https://developer.apple.com/documentation/swift/caseiterable)
- [Apple Developer - allcases](https://developer.apple.com/documentation/swift/caseiterable/allcases-swift.type.property#declaration)

<a id="8."></a>
# 8. 팀 회고
## 우리팀이 잘한 점
- 하나의 코드에 안주하지 않고 다양한 조언과 예시를 참고하여 여러 도전을 하였습니다. 이 과정에서 코드를 짜는 것보다 코드를 수정하는 시간이 갑절로 들었지만, 새로운 부분들을 배울 수 있어서 좋았습니다.
- 서로 배려를 잘했습니다. 스케줄 공유하여 프로젝트 공부시간 정하기, 약속 시간 잘 지키기기 등 서로에게 피해를 주지 않고자 노력하였습니다.
- 반복문, 재귀함수, 삼항연산자, `.allCases`, `struct` 등을 공부하며 다각도로 가독성이 좋은 코드를 만들고자 노력했습니다.

## 우리팀 개선할 점
- 코드 수정할 때 시간이 너무 오래걸렸습니다.
- 남들의 조언에 쉽게 넘어 갔습니다. 다음부턴 좀 더 줏대있는 코드를 짜야겠습니다.

## 서로에게 좋았던 점 피드백
- EtialMoon에게
    - 시간약속을 잘 지켰습니다.
    - 배려를 잘 해줬습니다.
    - 모르는 부분이 있을 때 꼼꼼하고 차분하게 설명을 잘 해줬습니다.
    - 같이 의욕적으로 코드를 발전시키고자 치열하게 고민하였습니다.
    - 꼼꼼하게 제가 놓치는 부분들을 잘 챙겨줬습니다.
  
- Serena에게
    - 시간약속을 잘 지켰습니다.
    - 배려를 잘 해줬습니다.
    - 분위기를 항상 좋게 만들어 줍니다.
    - 새로운 시도를 계속 하려는 모습에 자극을 받게 됩니다.
