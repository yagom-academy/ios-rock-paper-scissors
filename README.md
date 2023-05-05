# 👊✌️✋묵찌빠

## 📖 목차

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

---

## 🍀 소개

`yy-ss99`와 `Hemg` 팀이 만든 가위 바위 보, 묵찌빠 게임입니다. 컴퓨터와의 승부에서 승리해야 합니다.

- 주요 개념: `Control Flow` ,  `Functions`, `Enumerations` , `Properties` , `Methode` ,`Naming`

---

## 👨‍💻 팀원  사진 링크추가

| yy-ss99 | Hemg |
| --- | --- |
| <Img src = "https://i.imgur.com/ltt6W14.jpg" width="250" /> | <Img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="200"> |
| [Github Profile](https://github.com/yy-ss99) | [Github Profile](https://github.com/hemg2)|

---

## 👀 시각화된 프로젝트 구조

| 가위바위보 |
|:--:|
|<img height="800" width="500" src="https://i.imgur.com/zkXx1i9.png">

|묵찌빠 (사용자 승리) 묵찌빠 (컴퓨터 승리) |
|:--:|
|<img height="800" width="1000" src="https://i.imgur.com/r3gRdbC.png">
</p>



## 💻 실행 화면

| 사용자 승리 | 컴퓨터 승리 | 
|:--:|:--:|
|<img src="https://i.imgur.com/UzjmQSu.gif" height="400" width="600">|<img src="https://i.imgur.com/ZIItc9r.gif" height="400" width="600">

| 잘못된 입력 | 무승부 |
|:--:|:--:|
|<img src="https://i.imgur.com/RRZRey5.gif" height="400" width="600">|<img src="https://i.imgur.com/rijNZz1.gif" height="400" width="600">

| 턴 변경 시점 |
|:--:|
|<img src="https://i.imgur.com/cHFCs8U.gif" height="500" width="600">|

---


## ⏰ 타임라인

| 날짜 | 내용 |
| --- | --- |
| 2023.05.01. | 팀 룰, 가위바위보게임 순서도 고민, 가위바위보 승리조건 함수 구현 |
| 2023.05.02. | PR진행 및 PR 대한 피드백 반영 |
| 2023.05.03. | 묵찌빠 게임 시작, 조건, 결과 함수 구현 |
| 2023.05.04. | PR진행 및 PR 대한 피드백 반영 |
| 2023.05.05. | 프로젝트 회고 및 README 작성 |

---

# 트러블 슈팅  추가적으로 생각나는부분 추가

- 함수의 기능 분리
- 처음 showGameMenu()에는 메뉴출력, 메뉴 입력, 컴퓨터입력값 출력 여러가지 일을 진행했습니다.
- 함수는 하나의 기능을 하기 위해 함수를 분할하고 테스트 해보면서 진행했습니다.

```swift
func showGameMenu() {
print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
guard let userInput: String = readLine() else { return }
        let computerInput: String = String(Int.random(in: 1...3))
        guard userInput != gameEnd else { return print("게임종료") }
        getUserInput(userInput, computerInput)
}
```

```swift
func showGameMenu() {
print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
guard let userInput: String = readLine() else { return }
        let computerInput = makeComputerInput()
        
        checkGameEnd(userInput)
        getUserInput(userInput, computerInput)
    }
}
    private func checkGameEnd(_ userInput: String) {
        guard userInput != "0" else { return print("게임종료") }
    }
    
    private func makeComputerInput() -> String {
        return String(Int.random(in: 1...3))
    }
```

- 0번 호출시 게임종료(x) 함수 실행 이슈
- checkGameEnd()의 함수 생성이후   showGameMenu() 에서 실행할시에 checkValidInput() 함수와 같이 실행이 되어 “0” 눌러도 게임종료후 리턴되어 빠져나가지않고 다음 함수인 checkValidInput() 함수까지 실행되어 checkValidInput()함수의 default로 넘어가게되어  checkGameEnd()함수에서 잘못 입력시 리턴  되지 않았습니다. 이러한 방법을 해결하기 위해 따로 함수 구현을 진행하지 않고 showGameMenu() 에서 guard를 사용 하여 예외 처리시에 함수가 리턴되어 종료 되게끔 진행했습니다.

```swift
func showGameMenu() {
guard userInput != "0" else { return print("게임 종료") }

let computerInput = makeComputerInput()

checkGameEnd(userInput)

checkValidInput(with: userInput, computerInput, userGameResult)

}
private func checkGameEnd(_ userInput: String) {
guard userInput != "0" else { return print("게임 종료") }
 }

private func checkValidInput(with userInput: String, _ computerInput: String, _ gameResult: GameResult) {
        switch userInput {
        case MuckJjiBbaSign.jji.rawValue,
            MuckJjiBbaSign.muck.rawValue,
            MuckJjiBbaSign.bba.rawValue:
            checkMuckJjiBbaGameResult(with: userInput, computerInput, gameResult: gameResult)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            getUserMuckJjiBbaInput(when: .lose)
        }
    }
```

- 가독성 문제
    - 매개변수 타입을 String에서 Enum타입으로 변경하였음. 변경 전에는 받아온 인수를 비교하기 위해 `MuckJjiBbaSign.Muck.rawValue` 와 같이 표현해야 했는데 `.Muck`로 바꿀 수 있었음
- 반복되는 print문

```swift
if gameResult == .win {
        print("[사용자의 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
} else {
        print("[컴퓨터의 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
} 
```

위의 코드를 rawValue를 사용하여 한 줄로 처리함

```swift
print("[\(gameResult.rawValue)의 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
```


---

## 📚 참고 링크

- [🍎Apple Docs: Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/)
- [🍎Apple Docs: Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/)
- [🍎Apple Docs: Enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/)
- [🍎Apple Docs: properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/)
- [🍎Apple Docs: Methods](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/methods/)
- [🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)


# 팀 회고

## 우리팀이 잘한 점
- 그라운드 룰에 맞게 같은 시간대에 페어프로그래밍을 진행했습니다.
- 당일 스크럼을 통하여 당일 목표치에 맞게 진행을 했습니다.
- 서로의 의견을 적극 반영하였다.
- 연락이 잘 되었고 시간약속을 잘 지켰다.

## 우리팀 개선할 점
- branch를 사용을 못한점이 아쉽다.
- 조금은 조급하게 진행한 점.

## 서로에게 좋았던 점 피드백
- Hemg to yy-ss99
- 네이밍을 대한 고민의 시간을 얻게 되었습니다.
- 함수 기능 분리에 대해서 잘이해 했으며 잘 설명 해주었습니다.
- yy-ss99 to Hemg
- 코드에 대해서 상세히 설명해 주셔서 좋았습니다.
- 팀 분위기를 활기차게 이끌어 주었습니다.

## 서로에게 아쉬웠던 점 피드백
- STEP에 시작함에 방향성을 확실하게 못잡은점?(타입설정?) 그냥 와이도 너무 일찍만났..
- 저도 진짜 딱히 없어요 햄지햄.. 잘가요…ㅠㅠㅠㅠㅠㅠㅠ
