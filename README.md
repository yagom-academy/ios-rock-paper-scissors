# 가위-바위-보 게임 프로젝트 저장소
> 프로젝트 기간 2022.02.14 ~ 2022.02.18 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) [@saafaaari](https://github.com/saafaaari)

- [가위 바위 보 게임규칙](#가위-바위-보-게임규칙)
- [STEP 1](#step-1-순서도)
    + [순서도](#step-1-순서도)
    + [기능 구현](#step-1-기능-구현)
    + [고민했던 것](#step-1-고민했던-것들)
    + [배운 개념](#step-1-배운-개념)
    + [PR 후 개선사항](#step-1-pr-후-개선사항)
- [STEP 2](#step-2-순서도)
    + [순서도](#step-2-순서도)
    + [기능 구현](#step-2-기능-구현)
    + [고민했던 것](#step-2-고민했던-것들)
    + [배운 개념](#step-2-배운-개념)

## 가위 바위 보 게임규칙
* 프로그램을 실행하게 되면, 선택 메뉴 문구가 출력되고, 입력을 받습니다.
* 입력은 0, 1, 2, 3 중 한 가지 만을 입력받습니다. 그 외 입력이 들어오면, "입력이 잘못되었습니다."문구 출력 뒤 다시 입력을 받습니다.<br/>
* 입력이 완료되면, 임의의 패가 생성되고, 두 패(사용자, 컴퓨터)를 비교합니다.
* 비교 후 결과에 대한 문구가 출력되고, 비긴 경우엔 다시 처음 과정으로 돌아갑니다. 그 외엔 "게임 종료"문구가 출력되고, 게임이 종료됩니다.

## STEP 1 순서도
<img src = "https://user-images.githubusercontent.com/91936941/154011096-fcb0d0f5-bcf8-41f8-8f3b-5db47c1ed709.png" width="500px">

## STEP 1 기능 구현
- inputSelectionCard 함수
    - 사용자에게 입력값을 받아 게임을 시작하는 함수
- printMenu 함수
    - 게임 메뉴를 출력하는 함수
- playGame 함수
    - 입력받은 값과 임의의 컴퓨터의 패를 비교하는 게임을 진행하는 함수
- makeRandomCard 함수
    - 임의의 패를 생성하는 함수
- printResult 함수
    - 게임의 결과를 출력하는 함수
- compareEachCard 함수
    - 두 패를 비교해서 승패결과를 반환하는 함수
    
## STEP 1 고민했던 것들
- 입력값을 받아 어떤 타입으로 저장할 것인지(Int or String)
- 게임 진행에서 반복문을 쓸 것인지, 재귀함수를 쓸 것인지
- 입력받은 값을 어떤 방법으로 타입 변환을 할 것인지
- 함수와 변수의 Naming
- 기능에 대한 함수 분리를 어디까지 할 것인지
- 가위, 바위, 보와 게임 결과에 대해 열거형 사용을 할 것인지
- 가위 바위 보 로직 구현 방법

## STEP 1 배운 개념
- 옵셔널 바인딩(switch, guard-let)
- 열거형 문법과 값 추출하는 방법
- flatMap의 사용법
- readLine()에서의 nil 입력 방법


## STEP 1 PR 후 개선사항
- Result타입에 printMessage()함수를 두어 케이스를 나눠 출력하는 부분을 험수 하나로 통합
> ```swift
> //전
> case Result.win:
>     print("이겼습니다.")
>     print("게임 종료")
> ```
   
> ```swift
> //후
> case Result.win:
>     Result.win.printMessage()
>     print("게임 종료")
>```

- 패의 승패를 결정해주는 함수 compareEachCard()를 전역에서 Card타입 내부로 이동
> ```swift
> //전
>func compareEachCard(userCard: Int, computerCard: Int) -> Result {
>    if userCard == computerCard {
>        return Result.draw
>    ...
>}
>printResult(gameResult: compareEachCard(userCard: userCard, computerCard: computerCard))
> ```
   
> ```swift
> //후
>enum Card: String, CaseIterable {
>    case scissors = "1"
>    case rock = "2"
>    case paper = "3"
>    static let cases: [Card] = Card.allCases
>    
>    func compareEachCard(computerCard: Card) -> Result {
>        let winCase = [[Card.scissors, Card.paper],[Card.rock, Card.scissors],[Card.paper, Card.rock]]
>        let cardPair = [self, computerCard]
>        ...
>    }
>}
>printResult(gameResult: userCard.compareEachCard(computerCard: computerCard))
>```

## STEP 2 순서도
<img src = "https://user-images.githubusercontent.com/91936941/154185828-6e5d68f6-233b-4956-b263-cdef49ab2379.png" width="500px">

## STEP 2 기능 구현
- ```printMessage()```함수
    - 가위바위보 결과에 따라 메시지를 출력하는 함수
- ```Player``` 클래스: 게임을 진행하는 플레이어
- ```Game``` 클래스: 가위바위보 게임, 묵찌빠 게임의 부모 클래스
- ```RockPaperScissors``` 클래스: Game 클래스를 상속받은 가위바위보 게임
- ```MukChiBa``` 클래스: Game 클래스를 상속받은  게임
- ```playGame()``` 함수
    - 게임을 시작하는 함수. 입력이 잘못된 경우 다시 입력을 받는다.
- ```turnPlayerName: String``` 변수
    - 현재 턴 플레이어의 이름을 담는 변수
- ```convertCard()``` 함수
    - 가위바위보 게임과 묵찌빠 게임의 값을 동일하게 가져가기 위한 값 변환 함수
- ```decideTurn()``` 함수
    - 묵찌빠 게임에서 턴 전환이 필요한 경우 현재 턴 플레이어의 값을 저장하는 함수

## STEP 2 고민했던 것들
- 열거형 내에서 함수 정의를 할 수 있는 부분은 최대한 사용하자
- 함수의 재사용
- 함수와 변수의 naming(많이 도움된 곳 : [Swift 개발자처럼 변수 이름 짓기](https://soojin.ro/blog/english-for-developers-swift))
- 가위바위보와 묵찌빠를 별도의 인스턴스로 볼 것인지
- 가위바위보의 결과를 바탕으로 묵찌빠가 실행되어야 하는데 묵찌빠의 실행을 어떻게 호출할 것인지
- 은닉화와 캡슐화에 대한 고민
    - Game에서 상속받아 오버라이딩한 함수에 대한 은닉화

## STEP 2 배운 개념
- 객체지향적 프로그래밍
- 은닉화, 캡슐화
- 구초제와 클래스의 기능적 차이
- 클래스 상속 및 함수 오버라이딩
- 열거형 타입에 대한 유연한 사용방법(열거형 내부에 함수를 구현하여 메인 코드를 간결하게 할 수 있다.)
- 열거형의 프로토콜 사용에 대해
- 삼항연산자 사용방법
