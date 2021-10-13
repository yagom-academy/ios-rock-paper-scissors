## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 

## Flow Chart
![스크린샷 2021-10-12 오후 3 06 03](https://user-images.githubusercontent.com/83689084/136900701-5df4dc0f-d773-42a7-b4a3-41b0fdf5e005.png)

## 고민한 점
- 파라메터에 함수를 직접 호출
    - Hand 타입의 rawValue 파라미터로 함수를 직접 호출했는데 아래와 같은 사용이 문법적으로 어색하지는 않은지 궁금합니다.
    
    ```swift
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return }
    ```
    
- 파라미터 이름 부분
    - 파라미터 네임과 아규먼트 레이블이 동일해도 되는지 궁금합니다.

    ```swift
    judgeRockPaperScissors(userHand: userHand, computerHand: computerHand)
    ```
- 내 자신이 호출? or 내가 사용하는 함수가 호출?
    - 프로젝트 진행중 의견이 달라서 저희가 생각한 부분을 정리해보았습니다.
    - 숲재의 생각
        
        ```swift
        func playRockPaperScissors(){
            .
        		.
        		.
            
            if inputedChoice == "0" { return }
            
            guard let integer = Int(inputedChoice) else { return }
            
            let gameResult = judgeRockPaperScissors(userInput: integer, randomNumber: makeRandomNumber())
            if gmaeResult = .draw { playRockPaperScissors() }
        }
        ```
        
        - judgeRockPaperScissors함수로 게임 결과에 대한 값을 받아오고, 그 결과값이 draw일때만 재귀호출하도록 구현하였습니다.
        - 자신의 하위 함수에서 자신을 재귀호출하게 되면, 코드의 가독성이 떨어지고 추후 유지보수 시 어려움이 발생할 것이라고 생각했습니다.
        - 본 함수에서 재귀호출이 제일 마지막 단에서 실행되기 때문에 실질적으로 while문과 동일한 동작을 하는 것이라고 생각하였습니다.
        - 해당 함수는 가위바위보 1판을 플레이 하는 함수이고, 비겼을때만 다시 가위바위보를 진행하게 되는것이 명시되어 있어, 현실의 가위바위보와 동일한 로직을 가지게 되어 직관적으로 이해하기도 쉽다고 생각했습니다.
    - Nicholas의 생각
        
        ```swift
        func playRockPaperScissors(){
            .
        		.
        		.
            
            if inputedChoice == "0" { return }
            
            guard let integer = Int(inputedChoice) else { return }
            
            judgeRockPaperScissors(userInput: integer, randomNumber: makeRandomNumber())
        }
        ```
        
        - 재귀 함수의 위험성
            - 함수가 정확히 언제 종료되는지에 대한 궁금합니다.
        - 가독성 및 함수의 논리
            - 현실에서 가위바위보 게임을 보자면, 나와 상대방이 패(?)를 내면 판단 과정을 거칩니다.
            - 현실에서도 판단후에는 승패가 결정되거나 비겼을 경우 다시 가위바위보 게임을 실행하게 됩니다.
            - 상위 근거로 해당 함수를 구현하는게 맞다고 생각했습니다.

