## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

### 프로그램 가이드

---

[Step 1] 

승자가 결정될 때까지 가위바위보를 진행합니다. 

[Step 2]

승자가 결정될 때까지 가위바위보를 진행합니다. 승자는 턴을 가지고 묵찌빠게임을 시작합니다.

같은 패를 낸 경우 - 턴을 가진 쪽이 승리 후 게임 종료

다른 패를 낸 경우 - 패를 비교하여 가위바위보의 승자가 턴을 가지고 묵찌빠 게임을 진행합니다.

---

### 순서도

![순서도](https://user-images.githubusercontent.com/40068674/137440011-79ebd873-1f81-4894-925f-c3a4f2ecce3a.png)

---

## [STEP 1]

### 고민했던 점

1. 재귀 함수
    
    `startGame()` 함수를 반복하기 위해 조건문을 사용하는 것과 재귀함수를 사용하는 것을 고민해보았습니다.
    
    조건문을 사용할 시에 while 문안에 if 문을 사용해 들여쓰기 2번을 초과하기도 하였고 `while true {}` 와 같은 문장은 무한 루프의 위험도 있었기 때문에 재귀함수를 사용했습니다.
    
    재귀함수를 사용한 결과 isRestart 변수를 이용하여 코드의 가독성을 높이게 되었습니다.
    
    ```swift
    func startGame() {
        var isRestart: Bool = false
        let userInputNumber =  inputUserData()
    
        generateRandomNumber()
        isRestart = isRestartGame(inputNumber: userInputNumber)
        
        if isRestart {
            startGame()
        }
    }
    ```
    

1. optional
    
    입력값을 받을 때, 숫자가 아닌 값이거나 `readline()`시에 EOF 입력이 된 경우에 `guard`문을 사용하여 optional binding을 하였습니다.
    
    ```swift
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
            return -1
        }
    ```
    
2. randomNumber 생성 방법
처음에는 [random.Int](http://random.int/) 방식으로 랜덤숫자를 생성하는 generateRandomNumber()를 구성하고 싶었으나, 다른 방식인 shuffle()을 이용함으로써 새롭게 구성해보았습니다.
    
    ```swift
    func generateRandomNumber() {
        var computerNumbers: [RockPaperScissors] = [.scissor,.rock,.paper]
        let randomIndex = 0
        
        computerNumbers.shuffle()
        computerNumber = computerNumbers[randomIndex].rawValue
    }
    ```
    
3. enum 사용
프로젝트에서 가위,바위,보를 숫자로 입력받기 때문에, 처음에는 generateRandomNumber() 함수에서 computerNumbers 배열에 `[1,2,3]`을 각각 할당해주었습니다. 하지만, 가독성이 떨어진다고 판단되어 열거형 enum을 사용하여 다음과 같이 구성했습니다.
    
    ```swift
    enum RockPaperScissors: Int {
        case scissor = 1
        case rock = 2
        case paper = 3
    }
    var computerNumbers: [RockPaperScissors] = [.scissor,.rock,.paper]
    ```
    
4. if 와 switch 문의 사용
저희는 유저의 숫자를 입력받아 처리를 할 때 if문을 쓰지않고 switch문을 사용해주었습니다. 이유인 즉슨, if문의 경우에는 속도에 있습니다. 비록 간단한 프로젝트이기에 속도에서 큰 차이를 보이지않을 수 있으나, if의 경우에는 조건문이 초반에 있을 수록 빠르고, 후반부에 있을 수록 느립니다. 반면 switch문은 차이가 있을 지언정 그 차이가 if문 만큼 심하지 않습니다. 결론적으로 ,`if문은 사용자가 자주 사용하는 기능 순서대로 조건문을 구현해주면 성능에 도움이 되고, 여러가지 기능을 유사한 빈도로 사용한다면 switch문을 이용하는 것이 더좋다` 라고 생각이 들어 switch문을 사용하게 되었습니다.

    
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
