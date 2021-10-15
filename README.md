## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소
---
#### 프로젝트에 참여한 인원
@oksunwoo @llghdud921

---

### 프로그램 가이드

[Step 1] 

승자가 결정될 때까지 가위바위보를 진행합니다. 

[Step 2]

승자가 결정될 때까지 가위바위보를 진행합니다. 승자는 턴을 가지고 묵찌빠게임을 시작합니다.

같은 패를 낸 경우 - 턴을 가진 쪽이 승리 후 게임 종료

다른 패를 낸 경우 - 패를 비교하여 가위바위보의 승자가 턴을 가지고 묵찌빠 게임을 진행합니다.

---

### 출력문

![묵찌빠_출력문](https://user-images.githubusercontent.com/40068674/137495846-f81d3fbd-7458-4fe0-9f89-35e70579a53e.png)

---

### 순서도
<img src="https://user-images.githubusercontent.com/40068674/137440011-79ebd873-1f81-4894-925f-c3a4f2ecce3a.png" width="800" height="1600">

---

### 고민했던 점

1. 재귀 함수
    
    `startGame()` 함수를 반복하기 위해 조건문을 사용하는 것과 재귀함수를 사용하는 것을 고민해보았습니다.
    
    조건문을 사용할 시에 while 문안에 if 문을 사용해 들여쓰기 2번을 초과하기도 하였고 `while true {}` 와 같은 문장은 무한 루프의 위험도 있었기 때문에 재귀함수를 사용했습니다.
    
    재귀함수를 사용한 결과 isRestart 변수를 이용하여 코드의 가독성을 높이게 되었습니다.
    
    ```swift
    func startGame() {
        var needToRestart: Bool = false
     
        needToRestart = try needToRestartGame(handOfUser: handOfUser, handOfComputer: handOfComputer)
        
        if needToRestart {
            startGame()
        }
    }
    ```
    

2. optional
    
    입력값을 받을 때, 숫자가 아닌 값이거나 `readline()`시에 EOF 입력이 된 경우에 `guard`문을 사용하여 optional binding을 하였습니다.
    
    ```swift
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
            return -1
        }
    ```
    
4. Enumeration

    프로젝트에서 가위,바위,보를 숫자로 입력받기 때문에, 처음에는 `getComputerHand()` 함수에서 computerNumbers 배열에 `[1,2,3]`을 각각 할당해주었습니다. 
    
    하지만, 가독성이 떨어진다고 판단되어 열거형 enum을 사용하여 다음과 같이 구성했습니다.
    
    ```swift
    enum RockPaperScissors: Int {
        case scissor = 1
        case rock = 2
        case paper = 3
    }
    var computerNumbers: [RockPaperScissors] = [.scissor,.rock,.paper]
    ```
    
    추가로 열거형에서 CaseIterable 프로토콜을 채택하면 열거형의 case들을 하나의 배열로 반환할 수 있음을 알게되었습니다. 아래 코드로 최종 수정 하였습니다. 
    
    더 나아가 고차함수를 이용해 해당 열거형의 rawValue 값도 가져와 사용할 수 있겠네요 :)
    
    ```swift
    let handsOfComputer: [ShapesOfHand] = ShapesOfHand.allCases
    ```
    
4. if 와 switch 문의 사용

    저희는 유저의 숫자를 입력받아 처리를 할 때 if문을 쓰지않고 switch문을 사용해주었습니다. 이유인 즉슨, if문의 경우에는 속도에 있습니다. 
    비록 간단한 프로젝트이기에 속도에서 큰 차이를 보이지않을 수 있으나, if의 경우에는 조건문이 초반에 있을 수록 빠르고, 후반부에 있을 수록 느립니다. 
    
    반면 switch문은 차이가 있을 지언정 그 차이가 if문 만큼 심하지 않습니다. 
    결론적으로 ,`if문은 사용자가 자주 사용하는 기능 순서대로 조건문을 구현해주면 성능에 도움이 되고, 여러가지 기능을 유사한 빈도로 사용한다면 switch문을 이용하는 것이 더좋다` 라고 생각이 들어 switch문을 사용하게 되었습니다.

    
    ```swift
    func isRestartGame(inputNumber: Int) -> Bool {
        var isRestart: Bool = false
        let exit = 0
        let run = 1...3
        
        switch inputNumber {
        case exit :
            print("게임 종료")
            isRestart = false
        case run : isDraw(inputNumber: inputNumber) ? isRestart = true : playGame(inputNumber: inputNumber)
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            isRestart = true
        }
        return isRestart
    }
    ```
5. Dictionary
    
    Dictionary를 이용해서 가위바위보의 승패를 알려주는 로직을 이용했어요. 

    ```swift
    pointToWin = [.scissor: .paper,.rock: .scissor,.paper: .rock]
    ```

    key-value값의 속성을 이용해서 key: 사용자의 패, value: 컴퓨터의 패 라고 가정하여 key-value가 일치하는 경우 사용자가 이겼다! 라는 것을 알 수 있게 됩니다.
    
    
6. RandomElement

    처음에는 랜덤넘버를 생성하여 줄 때, shuffle()을 사용하여 배열을 랜덤하게 섞어준 후, 가장 앞에 있는 숫자의 값을 받아왔었습니다. 
    여러번의 고민을 걸친 후 randomElement 라는 것을 알게 되어 사용해주었습니다. 

    randomElement 는 컬렉션으로부터 랜덤한 요소를 반환하며, 만약 컬렉션이 비어있다면 메소드는 nil을 리턴하게 됩니다.

    ```swift
    func randomElement() -> Element?
    ```

    사용예시

    ```swift
    func getComputerHand() throws -> ShapesOfHand {
        let handsOfComputer: [ShapesOfHand] = ShapesOfHand.allCases

        guard let handOfComputer = handsOfComputer.randomElement() else {
            throw GameError.emptyValueError
        }
        return handOfComputer
    }
    ```
