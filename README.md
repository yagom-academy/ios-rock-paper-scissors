# 묵찌빠게임 프로젝트 저장소
> 프로젝트 기간 2022/08/22 ~ 
> 팀원: @준호 @LJ / 리뷰어: @브래드

# 목차
- [프로젝트 소개](#프로젝트-소개)
    - [Step1](##Step1)
    - [Step2](##Step2)
- [코딩 컨벤션](##코딩-컨벤션)
- [STEP 1](#STEP-1)
   - [고민한 점](#고민한-점)
   - [배운 개념](#배운개념)
- [STEP 2](#STEP-2)
   - [고민한 점](#고민한-점)
   - [배운 개념](#배운개념)

---

# 프로젝트 소개
    사용자로부터 값을 입력받아 컴퓨터와 가위바위보게임(STEP1), 묵찌빠게임(STEP2)을 구현함. 

# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4-blue)]()

---

# 시각화된 프로젝트 구조(다이어그램 등)
<img src="https://media.discordapp.net/attachments/1011075486962679979/1011441282595442768/-STEP_1.drawio.png?width=675&height=920">

---

## 코딩 컨벤션
- 변수명 정할 때 단어 축약하지 않기
- 상수로 선언해줄 수 있는 부분은 최대한 상수로 구현
- 전역변수는 최대한 지양
- 타입 명시는 통일
- 메서드 내부는 메서드명과 메서드의 목적에 맞게 구현
- 타입(구조체, 열거형, 클래스)별로 파일 분리

---

# [STEP 1]

## 고민한 점
- 사용자 입력값과 컴퓨터 임의의 패를 비교할 때, 비교조건 내용을 고민하였습니다.
> 예: 사용자 입력값이 가위일 경우
> 방법(1) 1. 컴퓨터의 패와 같은지?(True/False) -> 2. 컴퓨터의 패가 바위인가?(True/False)
 방법(2) 1. 컴퓨터의 패가 바위인가?(True/False) -> 2. 컴퓨터의 패가 보인가?(True/False)

➡️ 방법(2)의 경우 사용자 입력값에 따라 비교조건이 전부 달라집니다. 
(가위일땐 바위,보,  바위일땐 가위,보, 보일땐 바위,가위 )
방법(1)의 경우에는 첫번째 비교조건은 컴퓨터의 패와 같은것으로 통일 할 수 있습니다.
(가위일땐 동일여부,바위,  바위일땐 동일여부,보, 보일땐 동일여부,가위)
그래서 방법(1)로 구현하였습니다.

---
- RockPaperScissors, WinLoseDraw 열거형을 사용해서 선택지를 제한했습니다.
- RockPaperScissors에는 Int 타입의 원시 값을 추가해서 원시 값으로 항목을 찾을 수 있도록 했습니다.
- WinLoseDraw에는 결과 출력 메서드를 추가해서 승부 결과별로 다르게 출력해 줄 수 있게 했습니다.

---
- RockPaperScissorsGame 구조체에서 startGame를 제외한 나머지 메서드에는 접근 제어 키워드 private를 추가해서 구조체 밖에서 접근할 수 없도록 했습니다.
- 클래스의 상속 기능이 필요가 없고 연관된 기능의 집합을 단순히 캡슐화하는 것을 목적으로 하기 때문에 클래스 대신 구조체를 사용했습니다.
- RockPaperScissors, WinLoseDraw, RockPaperScissorsGame 파일로 분리해서 main에는 실행 코드만 남겨두었습니다.

---
- 코드의 가독성을 위해 Naming을 -Menu접미사와 -Hand접미사로 구분지었습니다.
- 사용자에게 직접 입력받은 값과 입력 받는 메서드의 이름은 selectedUserMenu, getSelectedUserMenu 와 같이 Menu접미사를 붙였습니다.
- RockPaperScissors 타입의 변수명은 computerHand, userHand 와 같이 Hand 접미사를 붙였습니다.
- 처음에는 가위, 바위, 보를 1, 2, 3의 Int 타입으로 표현했는 데, 가독성을 위해 RockPaperScissors 열거형을 사용했습니다.

---

## 배운개념
- git branch 생성, merge 하는방법
- 열거형에서 랜덤 요소 가져오는 함수
~~~swift
    /// A type that provides a collection of all of its values.
    ///
    /// Types that conform to the `CaseIterable` protocol are typically
    /// enumerations without associated values. When using a `CaseIterable` type,
    /// you can access a collection of all of the type's cases by using the type's
    /// `allCases` property.
    public protocol CaseIterable {
        
    열거형: CaseIterable // CaseIterable 프로토콜 추가

    열거형.allCases.randomElement() // 반환 타입은 옵셔널
~~~

- 

# [STEP 2]

## 고민한 점
- 
## 배운개념

- 



## 🔗 참고 링크
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
