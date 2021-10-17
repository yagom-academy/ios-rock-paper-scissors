# 묵찌빠 게임✊✌️🤚

## 👨‍👩‍👦‍👦 팀 그라운드 룰

---

### 팀원

@Yohan @Lily

### 협업방식

코드 설계 및 개선 작업 모두를 스크럼으로 진행

### Rule

1. 시간 약속
   - 데일리스크럼 시간 : 10시 (학습활동있는 날은 스킵)
   - 프로젝트는 10시까지만 진행
2. 짝 프로그래밍을 기본으로 하되 고민되는 사항은 의견 나누기
3. 서로 모르는게 있으면 그 즉시 묻기
4. commit 스타일 : Karma
5. commit 단위: 기능(=함수)단위
6. PR Deadline
   - STEP1은 화요일 저녁 10시까지 어떻게든 PR을 작성한다
   - STEP2는 STEP1 진행도를 보고 이후 논의한다

<br>


## 🐤 고민한 점 
----
### 1. 재귀함수 vs 반복문

잘못된 입력을 받았을 경우 입력을 다시 받는 기능을 구현해야 했습니다. 이 때 입력함수를 재귀 함수로 호출하거나 반복문으로 처리하는 두 가지 방법이 있어 어떤 방법이 합리적일지 고민해보았습니다. 

* 재귀함수

**장점** : `for`나 `while`을 선언하고 `break` 구현을 위해 flag를 둔다던가하는 추가적인 처리없이 함수를 단지 재사용함으로써 구현할 수 있으므로 상대적으로 간결한 코드로 구현할 수 있다고 생각했습니다

**단점** : 메모리 해제가 늦기에(처음 실행된 함수가 마지막 함수 종료 시점에서야 같이 종료되므로) 경우에 따라 컴퓨터에 부담을 줄 수 있다. 또한, 가독성 측면에서 반복성을 가졌는지 쉽게 파악하기 어렵다

* 반복문

**장점** : 코드가 반복성을 가졌는지 쉽게 파악할 수 있다 (for나 while같은 키워드가 바로 보이므로)
메모리 해제가 빠르다 (함수를 종료(=메모리 해제)시키고 다음 루프를 수행하므로)

**단점** : 추가적인 변수나 반복문 구문 등을 추가 작성해야하므로 코드가 상대적으로 복잡해진다

<br>

### 2. 함수 Naming : 명사 vs 동사

메소드가 아닌 함수가 non-mutating일 경우, API가이드라인에 따라 함수명을 명사로 네이밍하는 것을 고려해보았습니다.  

`func winnerDeterminedBetween(_ computersHand: Hand, and usersHand: Hand) ` X

함수의 주된 기능이 '승자를 결정짓는 행위'이므로 명사형 보다는 동사형 네이밍이 적절하다고 판단하여 아래와 같이 수정하였습니다.

`func decideWinner(between computersHand: Hand, and usersHand: Hand) ` ✅

<br>

### 3. 열거형 활용

플레이어 옵션과 안내 메시지를 열거형으로 정의하여 활용했습니다. 

1. 경우가 한정되어있음을 표현할 수 있음
2. 반복되는 게임 안내 메시지를 상수화하고 일괄적으로 관리 할 수 있음 

```swift
enum PlayerOption {
    case scissor
    case rock
    case paper
    case stop
    case none
}

enum GameNotice: String {
    case getInput = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case theEnd = "게임 종료"
    
    func printNotice() {
        switch self {
        case .getInput:
            print(self.rawValue, terminator: " : ")
        default:
            print(self.rawValue)
        }
    }
}

```

<br>


### 4. 가독성을 위해 mutating instance method 활용
열거형의 타입 메소드로 정의 시 함수 호출 시점에서 보기에 메소드명과 파라미터명이 어색하고, 파라미터로 인스턴스를 전달해야하는 구조였습니다. 하지만 타입메소드로 변경되는 주체가 열거형 타입이었기 때문에, 인스턴스 메소드 사용시 명시적으로 파라미터를 받지 않고도 self를 변경해 줄 수 있다고 생각되어 Mutating Method 를 사용했습니다.

```swift
// 타입 메소드 사용
Player.switchPlayer(currentTurn: &currentTurn)

// 인스턴스 메소드 사용
currentTurn.toggle()
```
<br>

### 5. repeat While문을 써도 괜찮을까?
이번 프로젝트에서 사용자 입력을 구현해야하는데 먼저 입력을 받고 이를 검증하여 반복을 할지 안할지를 결정하는 구조이므로 repeat while문이 가장 적절하다고 생각했습니다. 하지만 가독성이 좋지않다고 느꼈고, repeat while은 최대한 지양하는 것이 좋다는 의견을 많이 들어서 While문으로 변경하다보니 while true + if return/break로 구현해보았습니다.

코드 리뷰를 받고 나니 상황에 따라서는 repeat while문을 사용하더라도 가독성을 해치지 않는 경우도 있었습니다. 

<br>

### 6. 에러상황이 아니지만 여러 함수 레이어를 관통하는 플로우 구현을 위해 do catch문을 활용해도 될까?
여러 사람의 의견을 들어봤을 때 괜찮다는 의견과 그렇지 않다는 의견도 있었습니다. 더 많은 코드를 접하며 스위프트의 컨벤션을 파악해나가면 될 것 같습니다.

<br>

### 7. Bool타입 변수 네이밍
노수진 개발자님의 [포스팅](https://soojin.ro/blog/english-for-developers-swift)을 참고했습니다.👍


<br>

### 8. 삼항연산자는 언제 쓰는게 좋을까?
```swift
  let userWannaExit = (matchResult == .stop) ? true : false
```
대부분의 경우엔 삼항연산자가 이해하는데 오래걸리지만, 이 코드처럼 간단한 경우 오히려 가독성을 좋게 만들어 활용하면 좋은 것 같습니다.
 
 <br>
 
## ☄️ Trouble Shooting
---

### 1. 코드의 전체적 흐름 파악 어려움👿
Flow Chart만으로는 전체 코드 흐름이 구체적으로 파악이 되지 않아 각자가 생각하는 코드 설계 구조를 공유하지 못했습니다.  이로 인해 협업의 어려움이 있었습니다.
  
### 해결 방법: Pseudo Code 작성
반복문/분기문을 미리 결정하고 그에 맞춰 세부함수를 배치하는 의사코드를 작성하니 코드 흐름을 더 쉽게 파악하고, 더 나은 협업을 진행할 수 있었습니다. 

**Pseudo Code**

```swift
func main() {
    STEP1()

    if input == "0" { return }

    STEP2()
}

func STEP2() {
    //큰 루프 
    while true {
        //작은 루프
        사용자옵션 = 사용자옵션결정()

        if 사용자옵션 == "0" { return }

        상대패결정()

        if 같은지체크() == true { break }

        턴변경()
        턴출력()
    }

    승리자출력()
}

func 사용자옵션결정() -> 사용자옵션 {
    var 입력검증결과 = false
    var 사용자옵션
    while 입력검증결과 == false {
        안내문구()
        사용자옵션 = 사용자입력()
        입력검증결과 = 입력검증(사용자입력)
        if 입력검증결과 == true { break }
        컴퓨터턴으로변경()
        턴출력()
    }
}
```


## 🐔 Flow Chart
---
### [STEP1] 


![](<https://images.velog.io/images/yohanblessyou/post/e4bfba83-3916-4d3a-8a91-4406f36cc706/Untitled%20(3).png>)

<br>

### [STEP2] 
![묵찌빠게임 STEP2](https://user-images.githubusercontent.com/81469717/137277200-6f19dd5e-3e6e-4732-91a7-e179950455a0.png)
<br>
---
<br>

![스텝2플로우차트 개선](https://user-images.githubusercontent.com/81469717/137444557-f16d7a42-7350-47b1-aa4e-a61536f86cd5.png)
<br>




