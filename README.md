## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

----

# STEP 1 

## 기능 구현

- `RockPaperScissorsGame` : 컴퓨터와 사용자의 가위-바위-보 게임 클래스
- `printGameMenu()` : 게임의 메뉴인 "가위(1), 바위(2), 보(3)! <종료: 0>:"를 보여주는 함수
- `receiveUserInput()` : 사용자에게 가위-바위-보 선택을 입력받는 함수
- `makeComputerSelection()` : 컴퓨터의 임의의 가위-바위-보 선택을 정하는 함수
- `judgeVictory()` : 컴퓨터와 사용자의 선택을 비교해서 승패를 결정하는 함수
- `startGame()` : `makeComputerSelection()`와 `judgeVictory()`를 호출해 게임을 진행하는 함수
- `displayError()` : 잘못된 입력을 출력하는 함수
- `endGame()` : 게임을 종료을 출력하는 함수
<br/>

## 고민한 점

### 1. return
    
보통 함수는 stack의 영역에 메모리가 할당된다. stack영역은 메모리의 크기에 제한이 있기 때문에 함수가 끝나는 시점에 메모리도 자동으로 해제 된다고 알고있다. 하지만, 재귀함수의 경우에 `return` 처리를 해주지 않는다면 stack에서 메모리 해제가 되지 않아 `stack overflow` 가 발생할 수 있다 그래서 각 함수마다 안전 장치의 역할로 `return` 처리를 해주었다. 

하지만, 함수가 정상적으로 종료되면 자동으로 stack에서 메모리 해제가 된다는 사실을 알았고, 그렇기 때문에 함수의 끝마다 있는 `return` 은 필요하지 않다고 생각되어 없애주었다 다만, 특정 조건에 의해 함수를 벗어나야 할 경우에는 그대로 `return` 을 사용 해주었다. 
<br/>

### 2. extension 

기능간의 구분감을 주기 위해서 `extension`을 이용해 나눠 주었다.
<br/>

### 3. enum 사용

```swift
enum RockPaperScissors {
    case rock
    case paper
    case scissors
}
```
가위, 바위, 보에 대한 경우의 수를 `enum` 으로 정리를 해 놓으니, 따로 변수를 만들어줄 필요가 없었고 가독성이 좋았다.
<br/>

### 4. Class vs Struct

`RockPaperScissorsGame`를 클래스로 구현할지 구조체로 구현할지 고민을 했다. 클래스와 구조체 모두 코드의 메서드와 프로퍼티를 가지고 코드의 기초가 된다는 공통점을 가졌다. 큰 차이는 클래스는 참조 타입이고, 구조체는 값 타입이란 점이다. 더불어 클래스는 구조체와 달리 추가 기능을 가지고 있는데 상속이 가능하고, `Deinitializers`로 메모리 해제가 가능하고, 하나의 인스턴스에 둘 이상에 참조가 가능한 것 등이다.

참조 타입인 클래스에서 값 타입인 구조체로 변경한 결과 많은 메서드들을 자신의 프로퍼티의 값을 변경 할 수 있는 `mutating`으로 변경해줘야 하는게 부담이 됐다. 결론적으로 Class를 이용하게 되었다.


<br/>

----

# Flow Chart

<br/>

![](https://i.imgur.com/TK48Vj2.png)

