# 묵찌빠 게임 프로젝트
> 프로젝트 기간 2022.04.18~2022.04.22 
> 팀원: @Groot-94(https://github.com/Groot-94), @yeton(https://github.com/yeeton37)
> 리뷰어: @Red

## step1 기능 구현
- UserChoice 타입 구현
- GameMessage 타입 구현
- GameResult 타입 구현
- RockPaperScissorsGame 타입 구현
- 메세지 출력 함수(printGameMessage)
- rawValue 추출 함수(convertUserChoiceToNumber)
- 게임 실행 함수(executeRockPaperScissors) : 게임실행에 필요한 함수들을 호출하는 함수
- 사용자의 입력을 받는 함수(inputUserSelect)
- 사용자의 입력값과 컴퓨터의 입력값 비교하는 함수(compareChoice)
    - 사용자의 입력(가위, 바위, 보)에 따라 비교하여 .win, .lose, .draw 를 반환하는 함수(compareToScissorsOfUser, compareToPaperOfUser, compareToRockOfUser)
- 게임결과를 출력하는 함수(printGameResult)
  
## 배운 개념

- 열거형 rawValue에선 중복값이 불가능
- 열거형 rawValue에선 literal 사용불가, rawValue는 enum 자체를 수정하는 게 아닌이상 다른 방식으로 수정이 불가함
- switch문을 이용한 옵셔널 추출
- switch에서 비교하는 값이 case에 모두 해당되면 default를 사용하지 않는다
- if문에서의 함수 호출이 가능하다.(1급 객체 개념!!!)
- enum을 사용하여 매직 넘버, 매직 스트링을 관리할 때 유지보수가 쉽다. 하지만, 가독성이 떨어질 수도 있다.
- 구조체와 클래스 모두 인스턴스를 선언 할 시 스택의 영역에 들어가게 된다. 하지만, 구조체는 스택의 영역에 값이 들어가고 클래스는 힙 영역에 값이 들어가고 그 주소값이 스택에 저장된다. 그렇기 때문에 클래스는 인스턴스를 상수로 선언해도 프로퍼티(변수)의 변경이 가능하다.
- 소스코드를 작성하면서 Foundation framework의 라이브러리를 사용하지 않고 swift 표준 라이브러리를 사용했기 때문에 적어주지 않아도 괜찮았다.
- 꼬리재귀 : 재귀함수 사용 시 추가연산을 하지않고 함수를 끝내는 것
    - 일반적인 재귀함수는 함수를 호출할 때 연산정보를 스택에 쌓으며 계산을 한다. 꼬리재귀를 사용하면 스택에 쌓지 않고 바로 다시 함수를 실행시키는 방법을 사용한다.
    - 조건 : 컴파일러가 최적화를 지원하는지 확인 후 사용해야 함
    - 컴파일러가 최적화를 지원하면 내부적으로는 재귀 함수를 반복문으로 변경되어 실행이 된다. 따라서, Stack Overflow 에 대한 위험이 없다고 하는 것이다.
    - 재귀함수를 사용해야 한다면 쓰는게 좋다? 반복문 VS 재귀 ?? 
    
## 고민했던 것들

#### 1. 매직 넘버, 매직 스트링을 사용하지 않고 enum을 사용하는 방법의 장단점

매직 넘버는 가독성을 위해 명명된 상수로 교체하는 것이 좋다.


### `WRONG`
- 해당 코드를 봤을 때 10이라는 숫자를 보고 예측해야하는 상황이므로 안좋은 코드
```swift
func setBackgroundColor() {
    if myTextField.text.count > 10 {
        view.backgroundColor = .blue
    } else {
        view.backgroundColor = .systemBackground
    }
}
```
### `RIGHT`
- 매직 넘버를 명명된 상수로 사용함으로서 더욱 가독성 높은 코드
```swift
let inputThresholdCount = 10

func setBackgroundColor() {
    if myTextField.text.count > inputThresholdCount {
        view.backgroundColor = .blue
    } else {
        view.backgroundColor = .systemBackground
    }
}
```

->문제점: 가독성을 좋게 하기 위해서 이번 프로젝트때 매직 넘버와 스트링을 모두 enum에 묶어주었는데, 왠지 가독성이 더 안좋아진 것 같은 느낌이 들었다...(?)

#### 2. 은닉화/캡슐화의 기준에 대해 고민

처음엔 실제로 객체에서 사용하는 함수 이외에 모든 함수와 변수를 은닉화 하려고 했다. 나중에 생각해보니 구조체는 상속이나 확장이 불가능 하므로 변수에만 은닉화를 해도 외부에선 함수의 기능을 바꾸지 못하겠다고 생각이 들었다. 그래서 그 부분에 대해 우롱차에게 질문을 했고, 함수의 기능을 외부에서 수정하지 못하도록 은닉화를 해주는 것뿐만 아니라 외부에서 사용하지 말아야 할 함수들에 대해서도 은닉화를 해줘야 한다는 걸 알았다. 결국, 처음의 방법으로 은닉화/캡슐화를 진행했다.

#### 3. 재귀호출을 쓸 것인지, while문을 사용할 것인지에 대한 고민
`게임 실행함수(executeRockPaperScissors)`를 호출했을 때 에러가 나거나 사용자가 0을 입력하면 게임종료가 된 후에 다시 게임 실행함수를 호출해야 하는 상황이었다.

그래서 아래와 같이 재귀 호출을 해준 뒤 이전 실행된 함수는 return을 시켜주었다.
```swift
mutating func executeRockPaperScissors() {
        printGameMessage(.menu)
        inputUserSelect()
        
        if verifyUserSelection() {
            decideGameStart()
        } else {
            printGameMessage(.error)
            executeRockPaperScissors()
            return
        }
    }
```

그렇다면 재귀함수와 반복문의 차이점은 무엇일까?!
1. 재귀함수: 재귀함수는 함수를 호출할 때 스택에 연산정보를 쌓으며 계산을 한다. 
2. 반복문: 스택 메모리를 사용하지 않고 메모리 힙을 사용한다. 
3. 재귀함수에 포함된 꼬리재귀: 꼬리재귀는 재귀함수의 종류이다. 꼬리재귀의 장점은 꼬리재귀를 사용하면 스택에 쌓지 않고 바로 다시 함수를 실행시킬 수 있다.
4. 꼬리재귀 사용 조건: 컴파일러가 최적화를 지원하는지 확인 후 사용해야 한다.

`Red의 추가 설명`: Buliding setting 에 Optimization Level 의 Debug 와 Release 부분을 설정해 주면 된다.
(https://velog.io/@cherrish_red/iOS-컴파일-최적화-feat-꼬리재귀) 참고!

결론: 여러 면을 볼 때, 반복문이 더 나을듯....? 그러나 재귀 호출이 중요한 이유는 크게 봐서 두 가지 인 것같다.
> 1. 알고리즘 자체가 재귀적인 표현이 자연스러운 경우
> 2. 변수 사용을 줄일 수 있다.



#### 4. 객체 분리에 대한 고민
1. STEP 1에서는 가위바위보 게임이라는 하나의 구조체만 생성했었음.
2. STEP 2로 와서 묵찌빠 게임을 하나 더 생성해줘야 했고, 그 과정에서 클래스를 사용해서 추가할 지 구조체로 사용해서 추가할 지 고민했음
3. 가위바위보 게임과 묵찌빠 게임의 관계가 상속의 관계는 아니라고 생각해서 둘 다 구조체로 만들어준 뒤 가위바위보 게임 안에서 묵찌빠 객체의 인스턴스를 생성해 호출해줌
-> 그 과정에서 중간에 호출이 안됐는데 그 이유는...private가 호출한 변수 앞에 붙어있었음 ㅎㅎ 


## PR 후 개선사항

- convertUserChoiceToNumber 함수를 만들어서 사용한 이유는 enum에서 rawValue를 조금 더 간편하게 사용하려고 했으나, 리뷰를 받고나서 enum에서 프로퍼티를 꼭 case를 사용하는 방식이 아닌 static let을 사용해서 인스턴스 생성없이 바로 접근이 가능한 방법을 사용해서 수정
    - case가 없는 enum을 쓰면 순수하게 namespace로 사용이 가능하고, 뜻하지 않은 초기화를 막을 수 있다.
- 기존 구조체에 정의된 printGameMessage 함수를 제거하고 enum 안에서 rawValue를 사용하지 않고 printMessage 함수를 만들어서 원하는 메세지를 출력하도록 수정
- inputUserSelect 함수에서 불필요한 nil coalescing 사용을 제거
```swift=

//변경 전 
userChoice = Int(readLine() ?? "") ?? 4

//변경 후 
userChoice = Int(readLine() ?? "")

// 옵셔널 값을 비교하기 위해 switch 문을 사용하였기 때문에 옵셔널 추출이 필요하지 않았다
switch userChoice {
        case UserChoice.end,
            UserChoice.scissors,
            UserChoice.rock,
            UserChoice.paper:
            return true
        default:
            return false
        }
```

## step2 기능 구현
- 파일 분리
   - main
   - RockPaperScissorsGame(구조체)
   - MukChiBaGame(구조체)
   - GameChoice(enum)
   - GameStatus(enum)
   - GameResult(enum)
  
- 가위바위보 구조체(RockPaperScissorsGame) 생성

  - 가위바위보 메인 함수(execute) 구현
  - 사용자에게 입력받는 함수(inputUserSelect) 구현
  - 사용자에게 입력받은 수 검증하는 함수(verifyUserSelection) 구현
  -  입력받은 수가 0일 경우 종료하고 아니면 시작하는 함수(decideGameStart) 구현
  -  수를 비교하는 함수(compareChoice) 구현
     - 사용자가 낸 값이 가위일 때 비교해주는 함수(compareScissorsOfUser)
     - 사용자가 낸 값이 바위일 때 비교해주는 함수(compareRockOfUser)
     - 사용자가 낸 값이 보일 때 비교해주는 함수(comparePaperOfUser)
  -  게임 결과를 알려주는 함수(printGameResult
- 묵찌빠 구조체(MukChiBaGame) 생성
   - 가위바위보 구조체랑 거의 함수 패턴이 비슷함
   - 턴을 바꿔주는 함수인(printTurn,decideTurn)만 추가해줌
   
## 고민했던 것들
- 연산 프로퍼티
```swift
enum GameRockPaperScissorsChoice: Int {
    case end = 0
    case scissors = 1
    case rock = 2
    case paper = 3
    case error
    
    var number: Int {
        get {
            return self.rawValue
        }
    }
}
```
`rawValue`를 코드상에서 직접적으로 쓰면 그 rawValue가 Int인지 String인지 사용자가 알 수 없기 때문에 가독성을 좋게 하기 위해서 rawValue를 number라는 이름으로 대체해주었다.
그러기 위해서 `
enum(GameRockPaperScissorsChoice)
` 안에서 연산 프로퍼티를 사용했다.

- Bool type으로 된 튜플의 네이밍에 대해 고민.
`var isBool = (UserTurn, SameChoice)`
위와 같이 변수 이름을 짰다가 의미도 확 안 와닿고 두 가지의 정보를 튜플로 한번에 쓰면 알아보기 힘들 것 같아서
```swift
var isUserTurn: Bool?
var isSameChoice: Bool?
```
이렇게 변수로 나눠주고 나중에 활용할 때 합쳐서 아래와 같이 사용하는 것으로 변경했다.
```swift
switch (isUserTurn, isSameChoice) {
        case (true, true):
            GameStatus.userWin.printMessage()
            GameStatus.end.printMessage()
```

- (예톤의 고민) 순서도만 보고 바로 코드로 구현한다음 어떻게 함수 단위로 분리할 것인지 고민함

 바로 짠 코드
```swift
func 묵찌빠게임시작() {
    var computernumber: Int
    var userTurn: Bool = true
    while true {
        print("1~3중에 입력하세요, 0은 종료")
        var userinput = Int(readLine()!)!    // 인풋받는거는 함수가 될 수 있음
        computernumber = Int.random(in: 1...3)  // 검증하는거도 함수가 될 수 있음
        if userinput >= 0 && userinput <= 3 { 
            if userTurn == true {
                if computernumber == userinput {
                    print("사용자 승리")
                    break
                } else {
                    userTurn = false
                }
            } else {
                if computernumber == userinput {
                    print("컴퓨터 승리")
                    break
                } else {
                    userTurn = true
                }
            }
        }
    }
}

묵찌빠게임시작()
```
위와 같이 코드를 한번에 짜보고 함수 단위로 분리하는 연습을 했다. 막막함 -> 시각화 되니까 훨씬 자신감이 생겼다,,! 

- extension에서 저장프로퍼티를 사용할 수 없어서 연산프로퍼티를 사용해야하는데 어려움을 겪음.
연산 프로퍼티를 더 많이 써봐야 할 것 같다!
> 이번 프로젝트때 사용한 연산프로퍼티
```swift
enum GameChoice: Int {
    case end = 0
    case scissors = 1
    case rock = 2
    case paper = 3
    
    var number: Int {
        return self.rawValue
    }
}
```


## 배운 개념
- 연산 프로퍼티: 연산 프로퍼티는 실제로 값을 저장하지 않는 계산된 프로퍼티로, 다른 프로퍼티의 값을 getter을 이용해 간접적으로 값을 가져오고 setter을 이용해서 값을 설정하는 프로퍼티 이다.

- Bool type으로 된 변수의 네이밍:
![Bool](./BoolName.png)
## PR 후 개선사항
- mutating: mutating은 객체를 바꾸는 함수임을 알리는 키워드이다.
구조체 내부 함수에서 변수를 바꾸려고 할 때 mutating 키워드가 없으면 'self' ~~ 에러가 발생한다.

### mutating
**1. 구조체에서 왜 mutating 키워드를 붙여줄까?**

`mutating`은 객체를 바꾸는 함수임을 알리는 키워드이다.
구조체 내부 함수에서 변수를 바꾸려고 할 때 mutating 키워드가 없으면 'self' ~~ 에러가 발생한다.
`구조체`는 `값 타입`이다. 인스턴스 자체가 힙 메모리에 저장되어 참조할 수 있는 `클래스`와 다르게, 구조체는 자체가 값을 가지고 있으므로 스택 메모리에 저장이 된다. 따라서 구조체는 전달될 때마다 참조가 아니라 매번 `복사`되어 전달되기 때문에 굉장히 비효율적이라고 할 수 있다. 
그래서 Swift는 효율적으로 동작하기 위해 ‘`값이 변경되었을 때에만`’ 복사하도록 만들어졌다.
그리고 구조체의 값을 변경하는 함수의 경우 스위프트에게 알려주는 키워드가 바로 mutating이다.


Swift는 메모리에 단독으로 접근하기 위해, 메모리의 위치를 수정하는 코드를 요구해서, 메모리의 동일한 영역에 대해 다중 접근이 충돌하지 않도록 하는 것이다.

### 2.객체를 사용할 때의 장점과 단점?

`장점`: 객체로 분리하면서 진행하니까 수정이 용이했고, step1에서 사용했던 객체들을 step2에서 다시 사용할 때 수정없이 사용할 수 있어서 좋았다(원하는 부품을 사용하듯이).
결론적으로는 재사용이 쉽고, 수정이 용이하다고 생각했다. 

`단점`: 코드가 길어진다. 시간이 많이 든다. 가독성이 떨어질 수가 있다. (객체 간의 상호작용에 너무 포커스를 맞추다 보니 객체의 캡슐화가 저해되는 느낌이 들었따?)




## 순서도
![flowchart_mukchiba](https://user-images.githubusercontent.com/98514397/164467057-58909075-f4dd-434a-876d-f2f79858a04f.jpg)

