## ⛺️iOS 커리어 스타터 캠프

### 가위바위보 게임 프로젝트 저장소
🗓 기간 : 2022.02.14 ~ 2022.02.18(4d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [마이노](https://github.com/Mino777)</br>
📝 설명 : 컴퓨터와 묵찌빠 게임(console app)

### 게임 규칙
- 컴퓨터가 생성한 숫자와 유저가 입력한 숫자를 비교하여 같으면 비김, 두 값의 차이가 1 이거나 -2 인 경우 사용자 승리, 두값의 차이가 -1 이거나 2 인 경우 컴퓨터 승리
- 번호가 0...3이 아닌 수가 입력 되면 다시 메뉴로 돌아가게 구현 

### Flow Chart
<img src = "https://i.imgur.com/4Pvq7Kj.jpg" width="200px"></br>

### STEP1 실행 화면
<img src = "https://user-images.githubusercontent.com/54234176/154023942-56040465-d3c5-4be4-8364-db895dac103f.gif" width="250px" height="300"></br>



### Naming
1. `enum RockPaperScissorsType` : 가위바위보 타입 구현 
2. `enum GameResult` : 게임의 결과 및  타입 구현 
3. `startProgram()  : ` 가위바위보 시작하는 함수
4. `playSelectedMenu()`: 메뉴 선택 함수
5. `judgeGameResult` 가위바위 보 판별 하는 함수

## 구현 내용 
### Step1
1. `printUserInterface() 함수` 사용자 입력 받는 함수 구현 
2. `selectedMenu() 함수 ` 사용자 입력 받는 함수 생성
3. `generatedComputerNumber(numberRange: ClosedRange<Int> = ComputerOption.numberRange) -> Int 함수` 랜덤으로 가위바위보 함수 생성  
4. `verifyUserInput()   검증 함수` 감증 하는 함수 
5. `printGameOver() && printErrorMessage() 출력 함수` 게임 종료 함수 & 에러 메세지 함수  
6. `playSelectedMenu() 함수` 메뉴를 선택 하는 함수 
7. `judgeGameResult(userSelectedNumber: Int)`  가위 바위 보 판단 하는 함수
8. 비긴 경우 다시 최초 실행 상태로 복귀 기능 추가 



### 로직구현  
- final class RockPaperScissorsGame
   - `private enum RockPaperScissorsType: Int`
   - `private enum GameResult: String`
   - `func startProgram()`: 프로그램을 시작하는 함수
   -  `private func playSelectedMenu()`: 선택된 메뉴에 따른 게임 실행 함수
   - `private func judgeGameResult(userSelectedNumber: Int)`: 결과를 판단해주는 함수
  - `private func printUserInterface()`: 사용자 인터페이스를 출력해주는 함수
  - `private func printGameOver()`: 게임 종료를 출력해주는 함수
  - `private func printErrorMessage()`: 에러 메세지를 출력해주는 함수
  - `private func printGameResut(gameResult: GameResult)`: 게임의 결과를 출력 하는 함수 
- struct User
  - `enum UserOption
func selectedMenu() -> Int`: 가위바위보 메뉴 선택 함수 
  - `private func verifyUserInput(userInput: Int) -> Bool`: 사용자의 입력 검증 하는 함수 
- struct Computer
  - `func generatedComputerNumber(numberRange: ClosedRange<Int> = GameOption.computerNumberRange) -> Int`: 컴퓨터의 난수를 생성해주는 함수
- enum GameOption


### 함수의 기능
- `selectMenu()` 함수 메뉴선택 구현
- `receiveUserInputNumbers()` 사용자 입력을 받는 함수
- `saveConvertedNumbers()` 형 변환된 숫자 저장하는 함수
- `isHaveIntType()`숫자인지 검증 하는 함수
- `isHaveInRange()` 1 에서 9 까지 범위 확인 하는 함수
- `isHaveVerifiedNumbers()` 숫자 인지와 범위 안에 있는 확인하는 함수



### 고민했던점
- 어떤 경우에 class 와 struct를 적정하게 써야 되는지 고민을 많이 했습니다.
- switch 문에서 self가 동작하는 이유가 무엇인지 궁금합니다.
- 역시나 네이밍은 매번 어렵네요 😂


#### 매직 넘버도 피하도록 하자!

- 매직 넘버는 코드 중간에 갑자기 등장하는 상수를 의미한다. (문자의 경우 매직 리터럴이라고 한다.)
- 매직 넘버를 사용하게 되면 코드를 알아보기도, 유지보수하기도 힘들어진다.
 

#### 재귀 함수

- [컴퓨터 과학](https://ko.wikipedia.org/wiki/%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99)에 있어서 재귀(再歸, Recursion)는 자신을 정의할 때 자기 자신을 재참조하는 방법을 뜻하며, 이를 프로그래밍에 적용한 재귀 호출(Recursive call)의 형태로 많이 사용된다.
> [재귀 - 위키백과](https://ko.wikipedia.org/wiki/%EC%9E%AC%EA%B7%80_(%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99))

- 반복문을 사용하는 것보다 코드가 짧고 간결해진다는 장점이 존재한다.
- 함수를 호출하는 과정에서 오버헤드가 계속 발생하고, 스택오버플로우의 위험이 존재한다.
- 스택프레임을 구성하고 해제하는 시간이 추가적으로 필요하므로 일반적인 반복문보다 느리다는 단점이 있다.

#### 함수는 최대한 쪼개도록 하자!

- 사용자에게서 입력을 받거나 콘솔에 출력하는 아주 간단한 함수라고 하더라도 가독성, 확장성을 고려한다면 별도의 함수로 감싸서 작성하는 것이 좋다. (의미면에서도 더 명확할 것이다.)


###  피드백 받아서 수정 한 사항 
1. if 문으로 exit 조건문을 -> guard 문으로 변환 
2. 네이밍을 userOption에서 option으로 변경 
3. value로 따로 처리 한값을  rawValue를 통해서 수정 

