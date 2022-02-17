# ⛺️iOS 커리어 스타터 캠프

# 목차
-  [Ground Rules](#️-ground-rules)
-  [묵찌빠 게임 프로젝트 ](#️-묵찌빠-게임-프로젝트)
    - [게임 규칙](#게임-규칙)
    - [Flow Chart](#flow-chart)
    - [실행 영상](#step1-실행-화면)
- [구현 내용](#구현-내용)
   - [고민했던점](#고민했던점)
- [프로젝트 하면서 공부한내용](#공부한-내용)
- [피드백 수정](#피드백-받아서-수정하고-개선-한점)

</br>



## ⛺️ Ground Rules

- 프로젝트에 집중하는 시간: 10:00 ~ 23:00
- 밥먹는 시간: 12 ~ 14 / 18 ~ 19:30
- 공식적인 휴일: 주말

### 연락이 어려운 시간

- 로이: 연락 24시간 받을 수 있음. (금요일 : 오후 2시에  운동, 보통은  오전에 오픈하자마자 감 )
- 마이노: 연락 24시간 받을 수 있음.

> 유동적!

### TIL, 일일회고

- 끝나고 각자 작성

### 규칙

- 늦지 말자.
- 일이 생기면 미리 이야기하기
- 눈치보지 않고 편하게 서로 질문하기
- 공동 노션 사용하기
- 문서 읽고 프로젝트 시작하기
    - 사전에 시간을 두고 읽고 프로젝트 진행하기
- 요구사항 읽고 로드맵 작성한 후 코드 짜기
- 모르는 개념 나오면 그때 그때 정리하기
    - 트러블슈팅 기록하기
- 코딩 컨벤션
    - 카르마 스타일
    - 커밋 단위: 기능 단위 최대한 잘 지키기, 기능 잘 쪼개기
- 리드미 작성하기


</br>
</br>
</br>

## ⛺️ 묵찌빠 게임 프로젝트 
🗓 기간 : 2022.02.14 ~ 2022.02.18(4d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [마이노](https://github.com/Mino777)</br>
🗓 리뷰어: [yohan](https://github.com/YohanBlessYou)</br>
📝 설명 : 컴퓨터와 묵찌빠 게임(console app)</br>
🗓 피드백 주신분 : [lily](https://github.com/yeahg-dev), [수박](https://github.com/soo941226), 
[Tacocat](https://github.com/Ldoy)
</br>

### 게임 규칙
- 컴퓨터가 생성한 숫자와 유저가 입력한 숫자를 비교하여 같으면 비김, 두 값의 차이가 1 이거나 -2 인 경우 사용자 승리, 두값의 차이가 -1 이거나 2 인 경우 컴퓨터 승리
- 번호가 0...3이 아닌 수가 입력 되면 다시 메뉴로 돌아가게 구현 

</br>

### Flow Chart
#### Step1
![](https://i.imgur.com/4Pvq7Kj.jpg)</br>

#### Step2
![](https://i.imgur.com/VIOBh51.jpg)</br>



### STEP1 실행 화면
<img src = "https://user-images.githubusercontent.com/54234176/154023942-56040465-d3c5-4be4-8364-db895dac103f.gif" width="250px" height="300"></br>

### Step2 실행 화면 
<img src = "https://user-images.githubusercontent.com/54234176/154266544-ce92a695-54bb-409f-8f38-1d9ac42bcb91.gif" width="45%" heigt = "300"></br>


</br>

### Naming
1. `enum RockPaperScissorsType` : 가위바위보 타입 구현 
2. `enum GameResult` : 게임의 결과 및  타입 구현 
3. `startProgram()  : ` 가위바위보 시작하는 함수
4. `playSelectedMenu()`: 메뉴 선택 함수
5. `judgeGameResult` 가위바위 보 판별 하는 함수
</br>

## 구현 내용 
### Step1 && Step2
1. Swift의 Optional 안전하게 처리하기
2. if와 switch 조건문의 차이와 장단점 비교하면서  사용 
3. 순환함수(재귀함수)와 반복문의 장단점 비교
4. guard 구문의 이해와 활용을 해보면서  코드 구현 
5. Struct 와 Class의 차이를 파악하고 사용
</br>




### 로직구현  
- final class RockPaperScissorsGame
   - `private enum RockPaperScissorsType: Int`
   - `private enum GameResult: String`
   - `func startProgram()`: 프로그램을 시작하는 메서드
   -  `private func playSelectedMenu()`: 선택된 메뉴에 따른 게임 실행 메서드
   - `private func judgeGameResult(userSelectedNumber: Int)`: 결과를 판단해주는 메서드
  - `private func printUserInterface()`: 사용자 인터페이스를 출력해주는 메서드
  - `private func printGameOver()`: 게임 종료를 출력해주는 메서드
  - `private func printErrorMessage()`: 에러 메세지를 출력해주는 메서드
  - `private func printGameResult(gameResult: GameResult)`: 게임의 결과를 출력 하는 메서드 
- struct User
  - `enum UserOption
func selectedMenu() -> Int`: 가위바위보 메뉴 선택 메서드 
  - `private func verifyUserInput(userInput: Int) -> Bool`: 사용자의 입력 검증 하는 메서드 
- struct Computer
  - `func generatedComputerNumber(numberRange: ClosedRange<Int> = GameOption.computerNumberRange) -> Int`: 컴퓨터의 난수를 생성해주는 메서드
- struct MukjipaGame
    - `private enum MukjipaType: Int`
    - `mutating func startMukjipaGame(currentTurn: Player)`: 묵찌빠게임을 시작하는 메서드
    - `private mutating func playSelectedMenu()`: 선택된 메뉴에 따른 게임 실행 메서드
    - `private mutating func judgeGameResult(userSelectedNumber: Int)`: 결과를 판단해주는 메서드
    - `private mutating func changeCurrentTurn()`: 턴을 교체해주는 메서드
- enum GameOption
- enum Player
- struct UserInterface: 출력 메서드들을 모아둔 구조체
    - `print~()`
</br>




### 고민했던점
- 어떤 경우에 class 와 struct를 적정하게 써야 되는지 고민을 많이 했습니다.
- switch 문에서 self가 동작하는 이유가 무엇인지 궁금합니다.
- 역시나 네이밍은 매번 어렵네요 😂
- 묶찌빠 조건에서  이기면 턴이넘어가는걸 구현할때 `swith문`으로 구현을을 할까  아니면 `if문으로` 참거짓을 판별해서 구현을 할까 고민이 많았습니다 
- 이번에 프로젝트를 하면서 구현 별로 파일을 분리 했는데 파일을 분리 하는 기준을 어떻게 잡는지 궁금해서 의견을 물어봅니다!!🤔
- 이번에 git에서 이슈라는 기능이 있다고 하는데 이 기능에대해 좀  자세히 알고 싶어요🤔
</br>


#### 매직 넘버도 피하도록 하자!

- 매직 넘버는 코드 중간에 갑자기 등장하는 상수를 의미한다. (문자의 경우 매직 리터럴이라고 한다.)
- 매직 넘버를 사용하게 되면 코드를 알아보기도, 유지보수하기도 힘들어진다.
 </br>
 
### 공부한 내용
#### 재귀 함수

- [컴퓨터 과학](https://ko.wikipedia.org/wiki/%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99)에 있어서 재귀(再歸, Recursion)는 자신을 정의할 때 자기 자신을 재참조하는 방법을 뜻하며, 이를 프로그래밍에 적용한 재귀 호출(Recursive call)의 형태로 많이 사용된다.
> [재귀 - 위키백과](https://ko.wikipedia.org/wiki/%EC%9E%AC%EA%B7%80_(%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99))

- 반복문을 사용하는 것보다 코드가 짧고 간결해진다는 장점이 존재한다.
- 함수를 호출하는 과정에서 오버헤드가 계속 발생하고, 스택오버플로우의 위험이 존재한다.
- 스택프레임을 구성하고 해제하는 시간이 추가적으로 필요하므로 일반적인 반복문보다 느리다는 단점이 있다.
</br>

#### 함수는 최대한 쪼개도록 하자!

- 사용자에게서 입력을 받거나 콘솔에 출력하는 아주 간단한 함수라고 하더라도 가독성, 확장성을 고려한다면 별도의 함수로 감싸서 작성하는 것이 좋다. (의미면에서도 더 명확할 것이다.)
</br>


### struct 와 class 차이 
#### struct와 class 

```swift=
//구조체 구현
struct Sample {
  var mutableProperty: Int = 100
  let immutableProperty: Int = 100
  // 타입 프로퍼티
  static var typeProperty: Int = 100
  
  // 인스턴스 메서드
  func instanceMethod() { print("instance method") }
  // 타입 메서드
  static func typeMethod() { print("type method") }
}


// 구조체 사용
var mutable: Sample = Sample()
mutable.mutableProperty = 200
// mutable.immutableProperty = 200 컴파일 오류

let immutable: Sampe = Sample()
// immutable.mutableProperty = 200 컴파일 오류
// immutable.immutableProperty = 200 컴파일 오류

// 타입 자체의 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() 

// mutable.typeProperty = 400 인스턴스에서 타입 프로퍼티 사용 불가 - 컴파일 오류
// immutable.typeMethod()     인스턴스에서 타입 메서드 사용 불가 - 컴파일 오류

```

```swift=
// 클래스 구현
class Sample {
  // 프로퍼티는 구조체와 크게 다르지 않음
  ...
  
  // 타입 메서드
  // (상속을 받았을 때)재정의 불가 타입 메서드
  static func typeMethod() {
    print("type method - static")
  }
  // (상속을 받았을 때)재정의 가능 타입 메서드
  class func classMethod() {
    print("type method - class")
   }
}


// 클래스 사용
var mutable: Sample = Sample()
mutable.mutableProperty = 200
// mutable.immutableProperty = 200 컴파일 오류

let immutable: Sampe = Sample()
immutable.mutableProperty = 200 // 컴파일 오류 안남!!!! struct와 다른점!!
// immutable.immutableProperty = 200 컴파일 오류
```

- struct에서는 static을 이용하여 타입 프로퍼티, 타입 메서드를 만들 수 있다.
- swift에서 클래스는 다중 상속이 안되고, struct는 그냥 상속 자체가 안된다.
- 둘 다 extension은 가능
- struct에서 var로 선언된 인스턴스의 var 프로퍼티를 변경이 가능하다.
- class는 var, let으로 선언된 인스턴스의 var 프로퍼티를 변경할 수 있다. (let 인스턴스의, var 프로퍼티 가능!)
- 구조체는 값 타입, 클래스는 참조 타입
- 구조체는 다른 객체 또는 함수 등으로 전달될 때 참조가 아닌 복사를 원할때 사용

#### Class, Struct의 공통점
- 값을 저장할 프로퍼티를 선언할 수 있습니다.
- 함수적 기능을 하는 메서드를 선언 할 수 있습니다.
- 내부 값에. 을 사용하여 접근할 수 있습니다.
- 생성자를 사용해 초기 상태를 설정할 수 있습니다.
- extension을 사용하여 기능을 확장할 수 있습니다.
- Protocol을 채택하여 기능을 설정할 수 있습니다.

#### Class (클래스)
- 참조 타입입니다.
- ARC로 메모리를 관리합니다.
- 같은 클래스 인스턴스를 여러 개의 변수에 할당한 뒤 값을 변경시키면 할당한 모든 변수에 영향을 줍니다. (메모리만 복사)
- 상속이 가능합니다.
- 타입 캐스팅을 통해 런타임에서 클래스 인스턴스의 타입을 확인할 수 있습니다.
- deinit을 사용하여 클래스 인스턴스의 메모리 할당을 해제할 수 있습니다.


#### Struct (구조체)
- 값 타입입니다.
- 구조체 변수를 새로운 변수에 할당할 때마다 새로운 구조체가 할당됩니다.
- 즉 같은 구조체를 여러 개의 변수에 할당한 뒤 값을 변경시키더라도 다른 변수에 영향을 주지 않습니다. (값 자체를 복사)


#### 값 타입 vs 참조 타입
- 값 타입: 데이터를 전달할 때 값을 복사하여 전달
- 참조 타입: 데이터를 전달할 때 값의 메모리 위치를 전달

#### switch self 사용하는 이유
- switch self 는 네이밍 중복
> var value 안에 이름이  같으면  똑같이 쓰면  중복이 되니까  나중에  이름을 찾을때 똑같은 이름인데 내용이 같은면 오류가 발생할수도 있다 그래서 하드 코딩 방지를 위해  self를 사용 

```swift=

var value: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissor: return 3
            case .exit: return 0
```
</br>

### 피드백 받아서 수정하고 개선 한점
1. if 문으로 exit 조건문을 -> guard 문으로 변환 
2. 네이밍을 userOption에서 option으로 변경 
3. value로 따로 처리 한값을  rawValue를 통해서 수정 
4. 폴더 그룹핑 및 공통으로 쓰는 코드 분리 
    - 현재 RockPaperScissorsGame타입 안에 있는 User, Computer, UserInterface 프로퍼티의 경우 값타입인 struct 타입이기 때문에 class로 진행할 이유가 없음.
5. print 관련 메서드들을 UserInterface로 분리하여 관리

