## iOS 커리어 스타터 캠프

# 👊👈🖐️묵찌빠 게임
> 프로젝트 기간: 2022.12.27 ~ 2022.12.30
> 
> 팀원: 🧑🏻‍💻Harry, 🧑🏻‍💻Andrew | 리뷰어: ☁︎som

<br>

## 목차
[1. 프로젝트 소개](#프로젝트-소개) <br>
[2. 타임라인](#타임라인) <br>
[3. 실행 화면](#실행화면) <br>
[4. 트러블 슈팅](#트러블-슈팅) <br>
[5. 아쉬운 점](#아쉬운-점) <br>
[6. 참고 링크](#참고링크) 


<br>
<br>

---

# 프로젝트 소개
가위바위보를 한 후에 묵찌빠게임을 진행하며 승자가 나오면 게임이 종료된다.
<br>
1. 가위바위보 게임을 진행!
    - 사용자의 입력을 받아 사용자가 가위, 바위, 보 중에 무엇을 낼지 정한다.
    - 이기는 사람이 묵찌빠 선공을 시작한다.
    - 단, 비길시 다시 가위바위보를 진행
2. 묵찌빠 게임을 진행!
    - 가위바위보를 이기면 선공으로 시작, 같은 것을 내면 공격자가 승리
    - 다른 것을 내면 가위바위보 룰을 이용해 공격권을 가져가고 다시 묵찌빠를 한다.
 
<br>
<br>

# 타임라인
- 22.12.27(화): 가위바위보 게임 기능 구현
- 22.12.27(수): 가위바위보 게임 기능 리팩토링(게임을 진행하는 함수와 결과를 알려주는 함수 기능분리)
- 22.12.27(목): 가위바위보 게임 기능 클래스로 수정, 묵찌빠게임 클래스 작성
- 22.12.27(금): 기존에 메인파일에서 각각의 게임을 진행하던 것을 수정
    - 메인 파일 수정 -> 가위바위보 게임 안에서 묵찌빠게임을 호출하는 방식으로 게임진행

<br>
<br>

# 실행화면

## 게임 진행
![화면-기록-2022-12-30-오후-2 53 16](https://user-images.githubusercontent.com/45560895/210039253-6ca03959-8dc5-4ee4-be8f-210af60687b6.gif)


## 가위바위보 예외처리
- 잘못 입력되었을 경우 다시 입력을 받음.
- 게임 진행중 0을 누를 경우 전체게임이 종료됨.

<img width="275" alt="스크린샷 2022-12-30 오후 2 52 53" src="https://user-images.githubusercontent.com/45560895/210039244-a50bf9b9-0323-48cb-9d6b-3ae57443dfa8.png">

## 묵찌빠 예외처리
- 사용자가 공격권을 가지고 있을 때 잘못된 입력을 할 경우, 컴퓨터에게 공격권이 넘어감.
- 게임 진행중 0을 누를 경우 전체게임이 종료됨.

<img width="275" alt="스크린샷 2022-12-30 오후 2 52 28" src="https://user-images.githubusercontent.com/45560895/210039247-6c63cd7a-7d09-44bb-8b78-62f01d387eb0.png">

<br>
<br>

# 트러블 슈팅

### 1. guard let
**옵셔널 바인딩은 nil이 있는지 없는지만 확인하는 용도로 사용해야되는데
어떤 변수의 상태에 따라 실행흐름을 분기하는 용도로 잘못 사용하고 있었다.**
- 열거형으로 새로운 타입을 정해 코드를 읽었을때 어떻게 실행흐름이 분기되는지
switch를 사용해서 쉽게 알 수 있도록 하였다.

<br>

### 2. main 파일 / 캡슐화
**main파일에 전체적인 게임 진행 흐름을 쉽게 알 수 있었다. 사용자의 입장에서는 알 필요가 없는 정보들이 많이 존재함.**

- main 파일이 사용자한테 보여지는 부분이라 생각하고 사용자한테 보여주지 않아도 되는 메서드들은 내부 class로 이동해서 main 파일을 단순화 하였다.
<br>

# 아쉬운 점
### class 상속을 이용한 은닉화를 제대로 하지 못했다.
- `묵찌빠 클래스`가 `가위바위보 클래스`를 상속받아 중복되는 메서드를 재활용했다. 하지만 메인파일을 사용자가 접하는 부분이라고 생각했을때, 게임을 시작하는 메서드 외에는 메인파일에서 호출할 수 없도록 하고 싶었다.
- 가위바위보 클래스 안의 메서드들을 `private` 접근 제한자로 지정했다면 `묵찌빠 클래스`에서 사용할 수 없기때문에 default인 `internal`로 하게 되었다.
- `상위 클래스`를 하나 만들고 가위바위보 클래스와 `묵찌빠 클래스`가 `상위 클래스`를 상속하면 어땠을까 하는 생각이 든다.

<br>
<br>


---
### 참고링크
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Swift Language Guide - Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html) 
