# 묵찌빠 프로젝트 저장소
> 프로젝트 기간 2022.02.14 ~ 2022.     <br/>
팀원 : [@malrang](https://github.com/kinggoguma) [@dudu](https://github.com/FirstDo)  / 리뷰어 : [@jiseong](https://github.com/yim2627)

## 목차
- [프로젝트 규칙](#프로젝트-규칙)
- [순서도](#순서도)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
    
## 프로젝트 규칙

- 컴퓨터가 생성한 숫자와 유저가 입력한 숫자를 비교합니다.  
- 가위 바위보 결과를 출력합니다.  
- 비긴 경우 게임을 다시 시작합니다.  
- 이긴경우와 진경우 게임을 종료합니다.  

## 순서도
<img src="https://user-images.githubusercontent.com/69573768/153990820-b0d03969-e372-4bd5-baf7-d4816447c2a1.png" width="500"/>

## STEP 1 기능 구현 
- RockPaperScissors enum
    - 가위 바위 보 타입 
- GameResult enum
    - 게임의 결과 타입
- RockPaperScissorsGame struct
    - `start()`: 가위바위보 게임을 시작하는 메서드
    - `makeComputerSign() -> RockPaperScissors?`: 랜덤한 case를 갖는 값을 반환 
    - `inputUserSign(gameFlag: inout Bool) -> RockPaperScissors?`: 입력값을 받고 조건을 검사후 RockPaperScissors 타입의값으로 변환 후 반환
    - `compareSigns(userInput: Int?)`: 컴퓨터 값을 생성하고 유저값과 비교
    - `decideResult(computerSign: RockPaperScissors, userSign: RockPaperScissors) -> GameResult`: 유저의 입력값과 컴퓨터값 을 비교하여 게임의 결과 값을 반환
    - `printGameResult(gameResult: GameResult) -> Bool`: 게임의 결과를 출력
    
## 고민했던 것들
활동학습에서 struct, class에 대해서 공부해서, 모든 함수를 struct의 인스턴스 함수로 작성해 보았습니다

### 1. 가위 바위 보 판정을 구현하는 부분

모든 케이스를 비교하면 if문을 7번을 써야하는데, 이렇게 하는게 맞나? 라는 생각이 들었어요 <br/>
그래서 if문을 4번으로 줄이고, 3항연산자를 사용해 보았습니다. 지성의 생각이 어떤지 궁금합니다! <br/>
<br/> 
[API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)파트를 읽어보고 가위바위보를 진행하는 함수 이름을 playGame(with opponentPlayer:  RockPaperScissors) → GameResult 로 지었는데, 괜찮은 방식일까요? <br/> 
> When the first argument forms part of a prepositional phrase, give it an argument label. 
The argument label should normally begin at the preposition 

### 2. Struct를 쓸지, Class를 쓸지 고민했습니다.

[Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes) 문서를 봤는데, 기본적으로는 구조체를 쓰고, Class의 기능이 필요할때 (상속, Objective-C 호환성이 필요할 때, Identity가 필요할때 등) 만 Class를 사용하라고 되어있어서 구조체로 작성해 봤습니다

## 배운 개념

### 1. rawValue

열거형은 그 case자체로 값을 나타내지만, rawValue라고 부르는 값을 가질수도 있습니다
string, character, integer or floating-point type을 가질 수 있다고 써 있습니다

유저로부터 1,2,3 이라는 값을 받아서 가위 바위 보 열거형으로 바꿔줘야 했기에 열거형의 rawValue를 Int로 설정해서 let data = RockPaperSiccsors(rawValue: userInput) 같이 사용했습니다.

### 2. Protocol

> A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.

프로토콜은 매서드나 프로퍼티나 다른 요구사항들에 대한 청사진을 정의한다고 합니다
사용자 타입은 해당 프로토콜을 채택한후, 프로토콜의 요구사항을 구현하고, 실제 동작도 그때 구현해서 사용한다고 합니다.

### 3. CaseIterable

> When using a CaseIterable type, you can access a collection of all of the type’s cases by using the type’s allCases
 property.
 
컴퓨터가 랜덤한 가위바위보를 결정해야 해서 Int.random(in: 1..<4) 와 같이 쓰고 싶었습니다. <br/>
근데 찾아보니까 열거형에 CaseIterable 프로토콜을 채택하면 allCases라는 타입 프로퍼티를 이용해서 모든 case가 포함된 컬렉션을 얻을 수 있다고 해서, 그렇게 얻은 컬렉션에 randomElement() 매서드를 사용해서 랜덤한 가위 바위 보 중 하나를 얻게 구현했습니다.

## PR 후 개선사항
- `playGame(with opponentPlayer: RockPaperScissors) -> GameResult` 네이밍 변경
    - `decideResult(with opponentPlayer: RockPaperScissors) -> GameResult`
- `decideResult(with opponentPlayer: RockPaperScissors) -> GameResult` 위치 변경
    -  `RockPaperScissors enum에 위치하던 메소드를 RockPaperScissorsGame` struct 내부로 변경
- 가위바위보 게임을 시작하는 start() 메서드 내부 로직 변경
    - 반복문을 이용해 작동되는 로직을 switch와 재귀 함수를 이용한 방식으로 수정

