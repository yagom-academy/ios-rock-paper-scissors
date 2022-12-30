# 묵찌빠 게임

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)
8. [아쉬운점](#8-아쉬운-점)

<br/>

## 1. 소개
**Step01**
사용자로부터 0(종료), 1(가위), 2(바위), 3(보) 중 하나의 숫자를 입력받아 가위바위보 게임을 진행하거나 프로그램을 종료합니다.
게임이 진행된 경우, 승자는 묵찌빠 게임의 턴을 갖게 됩니다.

**Step02**
Step01를 진행한 후, 승패가 결정지어지면 묵찌빠 게임으로 넘어갑니다. Step01과 마찬가지로 사용자로부터 0(종료), 1(바위), 2(가위), 3(보) 중 하나의 숫자를 입력받아 묵찌빠 게임을 진행하거나 프로그램을 종료합니다. 게임이 진행된 경우, Step01의 승자가 턴을 갖게 됩니다. 사용자의 패와 컴퓨터의 패가 다른 경우, 승자가 턴을 갖게 되며 다시 묵찌빠 게임을 진행합니다. 사용자의 패와 컴퓨터의 패가 동일한 경우, 턴을 가지고 있는 쪽이 최종 승리합니다.

## 2. 팀원
> [팀 회고](https://github.com/Rhode-park/ios-rock-paper-scissors/blob/step02/팀%20회고.md)

|⭐️Rhode|⭐️Rowan|⭐️레옹아범|
| :--------: | :--------: |:--------:|
|<img height="180px" src="https://i.imgur.com/XyDwGwe.jpg">|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/Rowan.png">|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg">|

</br>

## 3. 타임라인
**프로젝트 진행 기간** 
- **22.12.26 (월) ~ 22.12.30 (금)** 

|날짜|타임라인|
| :-------: | :-------: |
|22.12.26 (월)|가위바위보 게임 기능 구현|
|22.12.27 (화)|가위바위보 게임 refactoring: 컨벤션 수정, 메서드 분리, Name Space 추가|
|22.12.28 (수)|가위바위보 게임 bug fix, 묵찌빠 게임 기능 구현|
|22.12.29 (목)|묵찌빠 게임 refactoring: 메서드 분리, 반복된 코드 줄이기|
|22.12.30 (금)|묵찌빠 게임 refactoring: 메서드 분리, naming 수정|

<br/>

## 4. 프로젝트 구조
### 순서도
<details>
<summary><strong>STEP01 Flowchart</strong></summary>
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/STEP1_rockScissorsPaperGame_순서도.jpeg">
</details>

<details>
<summary><strong>STEP02 Flowchart</strong></summary>
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/묵찌빠게임.jpg">
</details>

## 5. 실행 화면(기능 설명)
<details>
<summary><strong>가위바위보 올바른 값 입력</strong></summary>
    
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/1.png">

가위(1), 바위(2), 보(3) 중 하나 입력 시 결과가 나오고 비길 경우 한번 더 가위바위보를 하고, 승자가 결정된 경우 승자의 턴으로 묵찌빠게임 시작
</details>

<details>
<summary><strong>가위바위보 틀린 값 입력</strong></summary>

<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/2.png">

"6", "7", "~", "ㅁ", "" 등 잘못된 입력시 "잘못된 입력입니다. 다시 시도해주세요" 출력 후 재입력을 받습니다.
</details>

<details>
<summary><strong>가위바위보 종료(0) 값 입력</strong></summary>
    
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/3.png">
    
가위바위보 게임에서 0 입력시 가위바위보 게임이 종료됩니다.
</details>

<details>
<summary><strong>묵찌빠 입력 실수로 턴이 넘어간 경우</strong></summary>
    
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/4.png">
    
묵찌빠게임에서 잘못된 입력시 "잘못된 입력입니다. 다시 시도해주세요" 출력 후 컴퓨터의 턴으로 넘어가고 재입력을 받습니다.
</details>

<details>
<summary><strong>묵찌빠 종료(0)입력시</strong></summary>
    
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/5.png">

묵찌빠 게임에서 0 입력시 묵찌빠 게임이 종료됩니다.
</details>

<details>
<summary><strong>묵찌빠 승리할 경우</strong></summary>
    
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/6.png">
    
묵찌빠 게임에서 사용자의 패와 컴퓨터의 패가 동일한 경우 턴을 가지고 있는 사용자가 승리합니다.
</details>

<details>
<summary><strong>묵찌빠 패배할 경우</strong></summary>
    
<img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/7.png">
    
    
묵찌빠 게임에서 사용자의 패와 컴퓨터의 패가 동일한 경우 턴을 가지고 있는 컴퓨터가 승리합니다.(사용자 패배)
</details>

</br>

## 6. 트러블 슈팅
### 게임이 끝났음에도 불구하고 재귀함수로 인해 한번 더 실행되는 문제
* 트러블 슈팅 전, ```startGame```메소드에서 ```startMookZziPpa```함수를 마지막에 호출하는 형태로 묵찌빠게임을 시작했습니다.
* 프로그램 실행 시, 가위바위보를 비길 경우 다시 ```startGame```이 호출됩니다. 이후 재호출된 ```startGame```메서드가 종료되면 call stack에 남아있던 이전 ```startGame```의 ```startMookZziPpa```가 실행되어 불필요한 "무승부의 턴입니다."가 출력되는 문제가 있었습니다.

```swift
// before
func startGame() {
    displayMenu()
        
    let userChoice = readInput()
    let computerChoice = generateRockPaperScissors()
    guard let winner = compare(userChoice, and: computerChoice) else {
        return startGame()   
    }
    
    printResult(winner: winner)
    startMookZziPpa(winner: winner)  // 문제발생구간
}

private func printResult(winner: String) {
    switch winner {
    case WinnerResult.user:
        print("이겼습니다!")
    case WinnerResult.computer:
        print("졌습니다!")
    case WinnerResult.noWinner:
        print("비겼습니다!")
        startGame()
    default:
        print("게임종료")
    }
}
```
<br/>

* ```printResult```함수 내부에서 무승부가 아닐 경우```startMookZziPpa```메서드를 호출하여 불필요한 내용이 출력되는 현상을 해결하였습니다. 

```swift
//after
func startGame() {
    displayMenu()
        
    let userChoice = readInput()
    let computerChoice = generateRockPaperScissors()
    guard let winner = compare(userChoice, and: computerChoice) else {
        return startGame()
    }
    
    printResult(winner: winner)
}

private func printResult(winner: String) {
    switch winner {
    case WinnerResult.user:
        print("이겼습니다!")
        startMookZziPpa(winner: winner)
    case WinnerResult.computer:
        print("졌습니다!")
        startMookZziPpa(winner: winner)
    case WinnerResult.noWinner:
        print("비겼습니다!")
        startGame()
    default:
        print("게임종료")
    }
}
```

<br/>

### 가위바위보 게임과 묵찌빠 게임의 열거형의 raw value가 달라 코드의 중복이 일어나는 문제
 - 트러블슈팅 전, 가위바위보는 가위 (1), 바위 (2), 보 (3)의 입력값을 가지지만 묵찌빠는 가위 (2), 바위 (1), 보 (3)의 입력값을 가지고 있기 때문에 기존 열거형인 ```Menu```를 사용하지 못해 따로 ```MookZziPpa```를 만들어 주었습니다.
 - 이에 따라 중복된 코드를 가진 비슷한 메서드들이 다수 생기는 문제가 있었습니다.

```swift
//before
class RockPaperScissors {
    var isFirst = true

    private enum Menu: Int, CaseIterable {
        case end
        case scissors
        case rock
        case paper
    }
    
    ...
    
    extension RockPaperScissors {
    private enum MookZziPpa: Int {
        case rock = 1
        case scissors
        case paper
    }
```

<br/>

- parameter ```number```에 전달된 정수 값에 따라 ```Menu```의 case를 반환하는 기능의 타입 메서드 ```get```을 정의하여 가위바위보, 묵찌빠 룰에 따라 알맞게 rock, scissors를 반환할 수 있게 되었습니다.
- ```get```메서드가 정의되어 2개의 열거형 ```Menu```, ```MookZziPpa```를 하나의 열거형으로 표현하여 프로젝트 내부의 중복된 코드를 일부 해결하였습니다.

```swift
//after
enum Menu {
    case end
    case rock
    case scissors
    case paper
    
    static func get(_ number: Int, type: Rule) -> Menu? {
        if type == .rockPaperScissors {
            switch number {
            case 0:
                return .end
            case 1:
                return .scissors
            case 2:
                return .rock
            case 3:
                return .paper
            default:
                return nil
            }
        } else {
            switch number {
            case 0:
                return .end
            case 1:
                return .rock
            case 2:
                return .scissors
            case 3:
                return .paper
            default:
                return nil
            }
        }
    }
}
```

<br/>

### 중첩 if문, Magic Literal 처리
- 초기 ```decideWinner```메서드에서 if문을 중첩하여 "사용자", "컴퓨터", "무승부" 문자열을 반환했습니다. 
- if문 중첩으로 인해 가독성이 떨어지고, 문자열을 magic literal로 사용했다는 문제점이 있었습니다.
```swift
// before
private func decideWinner(user: Int, computer: Int) -> String {
    if user > computer {
        if user == paper && computer == scissors {
            return "컴퓨터"
        } else {
            return "사용자"
        }
    } else if user < computer {
        if user == scissors && computer == paper {
            return "사용자"
        } else {
            return "컴퓨터"
        }
    }
        
    return "무승부"
}
```

<br/>

- 가독성을 위하여 switch-case 문을 사용해 승리, 무승부, 패배의 case를 각각 정의했습니다.
- magic literal은 열거형을 통해 Name Space를 구현하여 처리하였습니다.

```swift
enum WinnerResult {
    static let user = "사용자"
    static let computer = "컴퓨터"
    static let noWinner = "무승부"
}
 
private func decideWinner(user: Menu, computer: Menu?) -> String {
        switch (user, computer) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return WinnerResult.user
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return WinnerResult.computer
        case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
            return WinnerResult.noWinner
        default:
            return ""
        }
    }
```

## 7. 참고 링크
> - [Swift 공식문서-Property](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
> - [Swift 공식문서-Enumeration](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
> - [Swift 공식문서-Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
> - [nameSpace-1](https://zeddios.tistory.com/353)
> - [nameSpace-2](https://cocoacasts.com/namespaces-in-swift)
> - [Foundation 공식문서](https://developer.apple.com/documentation/foundation)

## 8. 아쉬운 점
* enum내에서 타입 메소드가 아닌 타입 프로퍼티를 사용하는게 기존 생각했던 것과 유사했을 것 같은데 타입 메소드를 사용한 것이 아쉬움.
* 최대한 많이 줄였지만 아직까지도 중첩되는 메소드가 있는 것이 아쉬움.
