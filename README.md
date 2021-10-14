## 묵찌빠 프로젝트 저장소

## 🤝 Ground Rule

**팀원**</br>

@horeng2 (호랭이) @yim2627 (Jiseong)

**시간**</br>

- 끝나는 시간 : ~ 오후 10시
- 쉬는 날 : 화, 토, 일


## ⏰  타임라인 ('21.10.11 ~ ing)
**2021.10.11 Mon**

- 팀 그라운드 룰 지정
- 프로젝트 요구사항 파악 및 이해
- FlowChart 작성
- Step 1 기능 구현
- Step 1 PR

**2021.10.12 Tue**

- README.md 수정

## 🌊 Step 0 - FlowChart
![Flowchart](https://user-images.githubusercontent.com/87305744/136777385-07e4805c-e2fd-4aca-b8c8-f5be9f45cfdd.png)

## 🐯 Step 1 - 가위, 바위, 보 게임 구현
- ```selectUserChoice``` 함수
    - 메뉴 출력 및 메뉴 선택을 입력 기능 구현
- ```checkVaildInput``` 함수
    - 입력값 검증 기능 구현
- ```generateChoiceOfComputer``` 함수
    - 컴퓨터 임의의 패 생성 기능 구현
- ```compareChoices``` 함수
    - 승부 결과 판정 및 결과 출력 기능 구현
- ```enum Message```
    - 승부 결과 및 에러 발생 case를 열거형으로 선언
  

## 🕹 Step 1 구현 결과

#### 가위바위보를 졌을 경우
![mukchipa1](https://user-images.githubusercontent.com/70251136/136902464-03327a4b-b726-4da6-baf3-1d0af0049885.gif)

#### 가위바위보를 비기거나 이겼을 경우
![mukchipa2](https://user-images.githubusercontent.com/70251136/136902457-4119a0e4-4cb2-4d36-90a9-6ce89fcd8156.gif)

## 🔍 Step 1 고민과 해결

```swift
func selectUserChoice() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    
    guard let inputUserChoice = readLine() else {
        print("\n"+Message.systemError.rawValue)
        return
    }
    
    if let userChoice = Int(inputUserChoice) {
        checkValidInput(userChoice: userChoice)
    } else {
        print(Message.wrongInput.rawValue)
        selectUserChoice()
    }
}
```

- ```if let userChoice = Int(inputUserChoice) {} else {}```

  - ```let userChoice = Int(inputUserChoice)```처럼 형변환을 할 경우 Optional 타입이 되기때문에 ```Optioanl Binding```과정이 필요하였습니다.

  - ```guard```를 이용한 ```Optioanl Binding```을 사용하려 했지만,  두개의 조건이 필요했기에 "nil이 들어오면?" 이란 조건만 있는 ```guard```보다 ```if```를 이용하여 ```Optioanl Binding```을 하는 것이 맞다고 생각하여 수정하였습니다.
  
  - nil이 들어온 경우, 입력값을 다시 받는 기능을 재귀를 이용해 구현하였습니다.
  
  - nil이 아닌 정상값이 들어온 경우, ```checkValidInput()```을 이용해 입력값의 유효성을 검증하였습니다.