# ✊✌️🤚 묵찌빠 프로젝트

## 📑 프로젝트 소개
- 가위바위보 게임을 실행한 후 사용자와 컴퓨터가 승부를 겨룹니다. 그 다음 이어서 묵찌빠 게임을 진행해 최종 승부를 겨룹니다.

### 🧑🏻‍💻 팀원
|Wonbi|미니|
|:----:|:----:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/88074999?v=4">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">|

## 🔖 순서도
<img width="700px" src="https://i.imgur.com/GskdWe0.png">

### ⏱ 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시
---
- 매일
    - 공식문서 공부
- 2022.08.22
	- 사용자 입력 및 가위바위보 로직 구현
- 2022.08.23
    - 묵찌빠 및 가위바위보 게임 순서에 따른 순서도 작성
    - 숫자형 게임에서 묵찌빠 사용자 정의 변경
- 2022.08.24
    - 각 게임에 대한 모듈화 구성
    - 리뷰에 따른 리팩토링
    - 각 게임의 공통된 함수 일반화 방법 고민
- 2022.08.25
    - 프로토콜을 통한 일반화 방법 고민
- 2022.08.26
    - 리뷰에 따른 컨벤션 수정 및 리팩토링


## 💻 실행 화면(기능 설명)
### 1. 게임 종료

![게임 종료](https://i.imgur.com/WVmGkQ5.png)
- 사용자가 0을 입력하면 게임이 종료된다.

--- 

### 2. 오류 처리

![오류 처리](https://i.imgur.com/ceecb4N.png)
- 사용자가 잘못된 값을 입력하면 "잘못된 입력입니다. 다시 시도해주세요." 메세지가 출력된 후, 다시 사용자의 입력을 받는다.
- 만약 묵찌빠 게임일 경우, 사용자가 잘못된 값을 입력하면 턴이 컴퓨터에게 넘어가게 된다.
---

### 3. 정상적인 게임 실행 화면
![사용자 승리](https://i.imgur.com/hdy338I.png)
- 사용자가 게임을 승리하였을 때 모습.

![컴퓨터 승리](https://i.imgur.com/SRTou8P.png)
- 사용자가 게임을 패배하였을 때 모습.

## 🚀 트러블 슈팅


1. `enum` 타입 `randomElement` 함수의 무작위성으로 인한 오류
    - `GameElement` 라는 프로토콜에 선언되어 있는 게임에 필요한 컴퓨터의 카드를 생성하는 `generateComputerCard` 함수내에서 발생한 문제이다. `generateComputerCard`는 프로토콜을 채택한 enum 타입에서 `.none`이라는 케이스를 반환해서는 안되기 때문에 `allCases` 내의 존재하는 `randomElement`함수를 활용 할 수 없었다. 이 문제로 고민한 결과 `Int.random` 함수를 활용하여 `allCases[Int.random(1...3)]`와 같이 최대값과 최소값을 지정해주었다. 이 방식을 사용하면 옵셔널 바인딩 없이 바로 값을 생성할 수 있기 때문이었다. 

2. 매직넘버 사용
    - 하지만 문제는 `1...3`이라는 매직 넘버를 사용할 수 밖에 없는 문제가 있었다. 우리는 이 `1...3`이 가위바위보 중 하나를 뜻하는 것을 알지만, 다른 코더 입장에서는 왜 `1...3`인지에 대해 고민할 수 있을거 같았다. 그래서 `chooseComputerNumber`라는 함수를 선언해주어서 컴퓨터가 그 숫자를 선택해서 그걸 컴퓨터의 패로 바꿔주도록 로직을 짰다. 이 함수를 호출할 때 '컴퓨터가 1과 3사이의 숫자를 선택하고, 그 숫자를 컴퓨터의 패로 바꾼다' 라는 흐름이 보이게 되어 숫자를 선택한 이유를 충분히 설명할 수 있을것이라 판단하였다.

## 💭 고민했던 점
### 📍 Step 1

1. 가위바위보 게임의 패를 비교하는 함수
    - `RockPaperScissors`와 `Mukjipa` 내부에 구현되어 있는 `compare` 메소드가 다른 코더의 입장에서 직관적이지 못하다고 생각해 직접 `enum`의 `case`들과 비교하는 방법과 고민하였다. 그리고 우리의 판단은 다른 코더가 `compare` 라는 메소드를 타고 들어왔을 때, 안에있는 로직과 `compare`의 반환 값을 보고 충분히 유추가 가능할 것이라 판단하였고 `compare` 메소드를 그대로 사용하였다.

2. 게임 플레이어의 모듈화
    - 게임이 사용자와 인터렉티브 하는 모듈과 사용자의 입력을 직접 처리하고 게임 결과를 받는 모듈을 나눠서 구현하였다. 이렇게 나눠서 구현했던 이유는 이후에 구현하는 묵찌빠 게임도 비슷한 로직을 채택하기 때문에 각 게임의 모듈화를 통해 코드의 기능을 확실하게 분리할 수 있고, 만약 묵찌빠를 이용한 다른 게임을 구현하고자 할 때도 기존 다른 게임에 영향을 주지 않으면서 구현할 수 있게 하기 위해서였다.


### 📍 Step 2
1. 묵찌빠 게임과 가위바위보 게임의 일반화
    - 묵찌빠 게임과 가위바위보 게임의 공통적인 함수를 일반화 하기 위해서 프로토콜을 채택하기로 하였다. 하지만, 프로토콜에서 두 게임의 반환타입이 다르기 때문에 공통적인 함수를 구성하는 것이 어려웠다. 그래서 공통적인 함수를 구성하기 위해서 제네릭 타입을 활용하려고 하였다. 하지만 제네릭에 대한 공부가 부족하여 트러블을 해결하지는 못하였다. 제네릭에 대한 공부를 한 후에 프로토콜을 재정의하여 활용하도록 수정해야 할 것 같다.

2. 객체 지향 프로그래밍에 대한 고민
    - `GameManager`는 사용자와 상호작용하는 객체다. 하지만, 이 객체는 두 가지의 게임의 의존하여 프로그램을 실행한다. 이는 `SOLID`원칙 중 `DIP`를 위반하는 경우라고 판단하였다. 그래서 의존성 주입을 통해서 객체의 의존관계를 끊기 위해서 고민하였다. 그래서, 직접적으로 선언하던 두개의 게임을 외부에서 초기화 하여 주입하는 것으로 변경하였다.

## 📎 참고 링크
- [Swift API Design Guideline](https://www.swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
- [Swift Language Guide - Protocol](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)



