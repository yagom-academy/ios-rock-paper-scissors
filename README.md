## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

<!-- 
1. 제목: 앱 이름
2. 소개: 2~3줄 사이의 간략한 소개글
3. 팀원
3-1. 사진 (아바타 or 미모지)
3-2. 닉네임
3-3. 역할
4. 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시
5. 시각화된 프로젝트 구조(다이어그램 등)
6. 실행 화면(기능 설명)
6-1. 화면 스크린샷 or gif
6-2. 해당 화면에 대한 설명
7. 트러블 슈팅
7-1. 겪었던 문제점, 고민했던 부분 → 해결책
7-2. 사소하다고 느껴지더라도 가능한 많은 트러블 슈팅을 작성합니다. (물론 순서는 중요도 순으로 작성합니다.)
* 문제해결 항목과 내용이 많다면 캠프 이후에 항목수를 조절하여 README 분량을 조절해보세요.
README DAY에 README를 완벽하게 완성하는 것이 아니기 때문에 포트폴리오 제출시 다시 한번 다듬어 봅시다.
8. 참고 링크
8-1. 사용한 자료의 출처, 식별자 표시
-->

# 목차
1. [제목](#제목)
2. [소개](#소개)
3. [팀원](#팀원)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [실행화면](#실행화면)
7. [트러블 슈팅](#트러블-슈팅)
8. [참고 링크](#참고-링크)

## 제목
- 묵찌빠 게임
## 소개
- 컴퓨터를 상대로 묵찌빠를 진행하는 게임입니다.
- 일반적인 묵찌빠 게임과 마찬가지로
먼저 가위바위보 결과를 통해 공격하는 사람을 정하고
묵찌빠 게임을 진행합니다.


## 팀원
- [Ayaan]()
- [inho]()

## 타임라인
<details>
    <summary>커밋 로그</summary>
    <img src="https://i.imgur.com/OtWJQNz.png" width="800" height="400"/>
    <img src="https://i.imgur.com/NEFOFYU.png" width="800" height="400"/>
    <img src="https://i.imgur.com/njlvnJ3.png" width="800" height="400"/>
</details>



## 프로젝트 구조
|startRockPaperScissorsGame|startMukJjiBbaGame|
|:---:|:---:|
|<img src="https://i.imgur.com/AjX2J0r.png" width="400" height="400"/>|<img src="https://i.imgur.com/pOTmSgc.png" width="400" height="400"/>|

## 실행화면
|묵찌빠 사용자 승리|묵찌빠 컴퓨터 승리|묵찌빠 게임 종료|
|:---:|:---:|:---:|
|![](https://i.imgur.com/KzvcGTl.gif)|![](https://i.imgur.com/kHvlhrf.gif)|![](https://i.imgur.com/q5GEc1m.gif)

|묵찌빠 잘못된 입력|가위바위보 잘못된 입력과 종료|
|:---:|:---:|
|![](https://i.imgur.com/b1wutnX.gif)|![](https://i.imgur.com/s2sSHlx.gif)|

## 트러블 슈팅
- 가위, 바위, 보 승패 판정에 대한 고민.
 가위, 바위, 보의 승패 판정을 직관적인 코드로 어떻게 작성해야 하는지 고민을 하였다.
 처음에는 `HandShape`타입의 `rawValue`를 이용하고 가위바위보와 `rawValue` 간의 규칙을 찾아서 표현했다.
```swift
if userHandShape == computerHandShape {
    return .draw
}
return abs(userHandShape.rawValue - computerHandShape.rawValue) == 1 ? 
        (userHandShape.rawValue > computerHandShape.rawValue ? .win : .lose) : 
        (userHandShape.rawValue < computerHandShape.rawValue ? .win : .lose)
```
```swift
let rawValueDifference = computerHandShape.rawValue - userHandShape.rawValue

if rawValueDifference == 0 {
    return .draw
} else if rawValueDifference == -1, 2 {
    return .win
} else {
    return .lose
}
```
위 두 경우는 코드의 가독성과 의미 전달이 부족하다고 판단하였고
이를 해결하기 위해 아래와 같은 방법을 사용해서 해결했다.
- switch문을 사용해서 이기는 경우와 지는 경우를 모두 case로 지정해주는 방식이다.
    
```swift   
switch (userHandShape, computerHandShape) {
    case (HandShape.rock , HandShape.scissors),
        (HandShape.paper , HandShape.rock),
        (HandShape.scissors , HandShape.paper):
        return .win
    case (HandShape.scissors , HandShape.rock),
        (HandShape.rock , HandShape.paper),
        (HandShape.paper , HandShape.scissors):
        return .lose
    default:
        return .draw
    }  
```
- `HandShape`(가위, 바위, 보)을 생성하기 위한 방법들.
    - `HandShape`타입을 리턴하는 함수를 만들어서 값을 할당할지, 타입의 `init`메서드를 이용하서 값을 할당할지 고민했다.
    - `HandShape`타입을 생성하는 코드가 여러번 등장하는 상황이어서 메서드를 만들고 필요한 상황마다 호출하는 식으로 결정했다.
- `GameResult` 타입과 `winner`
    - 묵찌빠게임을 진행하면서 누구의 턴인지 나타내기 위해 `winner` 혹은 `turnPlayer` 프로퍼티를 `GameManeger` 타입에서 선언했다. 
    - 그런데 `winner`는 게임의 승패를 나타내는 `GameResult`타입에 속해있다고 판단하여 `winner`와 승패 메세지를 해당 타입에서 처리하도록 구현했다.


## 참고 링크
- https://www.swift.org/documentation/api-design-guidelines/
- https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html
