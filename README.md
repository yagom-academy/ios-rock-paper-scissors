# 묵찌빠 게임

## Step 1

![묵찌빠 게임 순서도](ios-rock-paper-scissors.drawio.png)

### 코드 설명

#### ExpectedHand 열거형

가위바위보 게임에서 나올 수 있는 손의 모양은 3가지입니다.
> 가위(1), 바위(2), 보(3)

저희는 가위, 바위, 보 사이의 관계를 rawValue 간의 대소비교를 통해 구현하기 위해
열거형 내부에 사용자 정의 연산자(`<`)를 구현했습니다.

이때, 가위(1)가 보(3)를 이기기 때문에 if문으로 true 를 리턴하도록 만들었습니다.
그 외에 경우는 rawValue 값이 클 때 true 가 리턴되도록 만들었습니다.

```swift
enum ExpectedHand: String, CaseIterable, Comparable {
    static func < (lhs: ExpectedHand, rhs: ExpectedHand) -> Bool {
        if lhs == .paper, rhs == .scissors {
            return true
        }
        return lhs.rawValue < rhs.rawValue
    }
    
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}
```
