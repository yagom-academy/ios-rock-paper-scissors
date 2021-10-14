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

# 🐤 STEP1: 가위 바위 보 게임 구현 
---

## Flow Chart


![](<https://images.velog.io/images/yohanblessyou/post/e4bfba83-3916-4d3a-8a91-4406f36cc706/Untitled%20(3).png>)

## 구현 기능
---

## 고민한 점
----
### 재귀함수 vs 반복문

잘못된 입력을 받았을 경우 입력을 다시 받는 기능을 구현해야 했습니다. 이 때 입력함수를 재귀 함수로 호출하거나 반복문으로 처리하는 두 가지 방법이 있어 어떤 방법이 합리적일지 고민해보았습니다. 

* 재귀함수

**장점** : `for`나 `while`을 선언하고 `break` 구현을 위해 flag를 둔다던가하는 추가적인 처리없이 함수를 단지 재사용함으로써 구현할 수 있으므로 상대적으로 간결한 코드로 구현할 수 있다고 생각했습니다

**단점** : 메모리 해제가 늦기에(처음 실행된 함수가 마지막 함수 종료 시점에서야 같이 종료되므로) 경우에 따라 컴퓨터에 부담을 줄 수 있다. 또한, 가독성 측면에서 반복성을 가졌는지 쉽게 파악하기 어렵다

* 반복문

**장점** : 코드가 반복성을 가졌는지 쉽게 파악할 수 있다 (for나 while같은 키워드가 바로 보이므로)
메모리 해제가 빠르다 (함수를 종료(=메모리 해제)시키고 다음 루프를 수행하므로)

**단점** : 추가적인 변수나 반복문 구문 등을 추가 작성해야하므로 코드가 상대적으로 복잡해진다

<br>

### 함수 Naming : 명사 vs 동사

메소드가 아닌 함수가 non-mutating일 경우, API가이드라인에 따라 함수명을 명사로 네이밍하는 것을 고려해보았습니다.  

`func winnerDeterminedBetween(_ computersHand: Hand, and usersHand: Hand) ` X

함수의 주된 기능이 '승자를 결정짓는 행위'이므로 명사형 보다는 동사형 네이밍이 적절하다고 판단하여 아래와 같이 수정하였습니다.

`func decideWinner(between computersHand: Hand, and usersHand: Hand) ` ✅

<br>

### 열거형 활용

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

# 🐔 STEP2 : 묵 찌 빠 게임 구현
---

## Flow Chart
![묵찌빠게임 STEP2](https://user-images.githubusercontent.com/81469717/137277200-6f19dd5e-3e6e-4732-91a7-e179950455a0.png)
