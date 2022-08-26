## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

# **1. 제목: 묵찌빠 게임**👊✌️🖐

# **2. 소개**

- 가위바위보를 먼저 진행하고, 이긴 사람이 턴을 가집니다. (비길 경우, 가위바위보 계속 진행)
- 묵찌빠를 비길 때까지 계속 진행하는 동안, 이긴 사람이 턴을 가집니다.
- 해당 사람의 턴에서 비길 경우, 해당 사람이 승리하게 됩니다.

# 3. **팀원**
|![KakaoTalk_Image_2022-08-19-11-48-18](https://user-images.githubusercontent.com/94514250/186832043-e0a731db-4f9f-437b-8609-a132c0703bfc.png)|![포차코](https://user-images.githubusercontent.com/94514250/186832089-4b62cf4a-e0e9-4bc9-b908-97837bff96c4.png)|
|:---:|:---:|
|감자|som|


# 4. **타임라인**
<img width="1065" alt="스크린샷 2022-08-26 오후 2 37 08" src="https://user-images.githubusercontent.com/94514250/186832638-6079bac7-adb8-47c7-a577-6dbda2daa9a3.png">
<img width="1060" alt="스크린샷 2022-08-26 오후 2 37 24" src="https://user-images.githubusercontent.com/94514250/186832551-97563e90-bb24-42ec-ae2b-d33132f7e38b.png">
<img width="1055" alt="스크린샷 2022-08-26 오후 2 37 34" src="https://user-images.githubusercontent.com/94514250/186832563-ab46e95d-1397-41d2-a539-6bc0dec6495d.png">
<img width="1056" alt="스크린샷 2022-08-26 오후 2 37 42" src="https://user-images.githubusercontent.com/94514250/186832570-6636596f-aa2a-435b-b195-0376d2c0c498.png">
<img width="1063" alt="스크린샷 2022-08-26 오후 2 37 50" src="https://user-images.githubusercontent.com/94514250/186832581-35fb95a5-e4ad-428a-8917-1747680637c0.png">

# 5. **시각화된 프로젝트 구조**
![제목 없는 다이어그램 drawio](https://user-images.githubusercontent.com/94514250/186832719-d333d226-c014-49da-a3ea-664a604b0878.png)

# 6. **실행 화면**
1. 정상적으로 게임이 작동되는 경우
<img width="303" alt="스크린샷 2022-08-26 오후 2 40 45" src="https://user-images.githubusercontent.com/94514250/186832812-5804c701-3362-4650-8ef2-c9afde24be9e.png">

2. 잘못된 수를 입력한 경우
<img width="275" alt="스크린샷 2022-08-26 오후 2 40 04" src="https://user-images.githubusercontent.com/94514250/186832885-21e05fff-4e16-45bf-b99e-80dc05e4c69d.png">

3. 게임을 종료한 경우
<img width="245" alt="스크린샷 2022-08-26 오후 2 39 47" src="https://user-images.githubusercontent.com/94514250/186832906-068dd688-518d-46cb-9b5e-1aaeacb63f37.png">


# 7. **트러블 슈팅**

1. 반복문 VS 재귀함수<br>
게임의 반복성을 위해 `while 반복문`으로 할지, `재귀함수`로 할지 고민을 했습니다. 일단 `while 루프`를 도는 방법이 메서드들을 파악하기 어려워지는 거 같아 `재귀함수`로 선택했습니다.

2. 옵셔널 언래핑에 대한 고민

```swift
func inputUserNumber() -> String {
    guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
        return "입력된 값이 없습니다."
    }
    userNumber = Int(inputUserNumber) ?? 4
        
    return inputUserNumber
}
```

위의 코드에서 `옵셔널 병합 연산자`를 통해 `4라는 Int형 값`을 주었습니다. 이 부분이 언래핑 절차에 부적절한 코드인 거 같아서 정말 많은 고민 끝에 코드를 수정하게 되었습니다.

```swift
func inputUserNumber() -> Int? {
    guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
        print("입력된 값이 없습니다.")
        return inputUserNumber()
    }

    let inputUserNumberToInt = Int(inputUserNumber)

    return inputUserNumberToInt
}
```

som은 `Int?` 반환값 사용이 익숙치 않아서 `inputUserNumber()` 메서드 안에서 언래핑을 실행해야 한다는 생각 때문에, 이 부분에서 감자와 논의를 많이 한 거 같습니다. `옵셔널 언래핑`도 기능이라고 볼 수 있기 때문에 다른 메서드로 기능을 옮기는 과정으로 결정했습니다.

3. `judgeWinOrLose` 메서드<br>
처음에는 `inputUserNumber()`에서 가져온 `userNumber`과 1...3의 랜덤숫자를 가지는 `computerRandomNumber`의 차이값을 사용하여 `switch구문`을 만들었습니다.

```swift
func judgeWinOrLose() {
    switch userNumber - computerNumber {
    case -1, 2:
        return "졌습니다!"
    case -2, 1:
        return "이겼습니다!"
    case 0:
        return "비겼습니다!"
    default:
        return "잘못된 입력입니다. 다시 시도해주세요."
    }
}
```

제작자가 아닌 다른 사람들이 코드를 보았을 때, 직관적으로 와닿지 않는 점을 고려하여 `RPS 열거형`을 넣어보기로 했습니다.

```swift
switch userRPS {
    case .scissors:
        if computerRPS == .paper {
            gameResult = .win
        } else if computerRPS == .rock {
            gameResult = .lose
        }
    case .rock:
        if computerRPS == .scissors {
            gameResult = .win
        } else if computerRPS == .paper {
            gameResult = .lose
        }
    case .paper:
        if computerRPS == .rock {
            gameResult = .win
        } else if computerRPS == .scissors {
            gameResult = .lose
        }
    }
```

`case` 안에 들어간 `조건문`을 `삼항연산자`로 구현할까 고민했지만, `if 조건문`이 더 직관적으로 표현될 거 같아 `조건문`을 사용했습니다.

# 8. 참고한 문서

[Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) <br>
[재귀함수 (반복문과 비교)](https://jaemuyeo.github.io/swift/RecursionFunction/) <br>
[[Algorithm] 재귀와 반복문](https://velog.io/@gillog/Algorithm-%EC%9E%AC%EA%B7%80%EC%99%80-%EB%B0%98%EB%B3%B5%EB%AC%B8)

