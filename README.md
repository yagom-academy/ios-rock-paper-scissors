## ⛺️iOS 커리어 스타터 캠프

### 가위바위보 게임 프로젝트 저장소
🗓 기간 : 2022.02.14 ~ 2022.02.18(4d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [마이노](https://github.com/Mino777)</br>
📝 설명 : 컴퓨터와 묵찌빠 게임(console app)

### 게임 규칙

- 컴퓨터가 생성한 숫자와 유저가 입력한 숫자를 비교하여 같으면 비김, 두 값의 차이가 1 || -2 인 경우 사용자 승리, 두값의 차이가 -1 || 2 인 경우 컴퓨터 승리
- 번호가 0...3이 아닌 수가 입력 되면 다시 메뉴로 돌아가게 구현 

### Flow Chart
<img src = "https://i.imgur.com/4Pvq7Kj.jpg" width="200px"></br>

### STEP1


<img src = "https://user-images.githubusercontent.com/54234176/154023942-56040465-d3c5-4be4-8364-db895dac103f.gif" width="250px" height="300"></br>



### Naming
1. `enum RockPaperScissorsType` : 가위바위보 타입 구현 
2. `enum GameResult` : 게임의 결과 및  타입 구현 
3. `startProgram()  : ` 가위바위보 시작하는 함수
4. `playSelectedMenu()`: 메뉴 선택 함수
5. `judgeGameResult` 가위바위 보 판별 하는 함수
6.  



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
   - `func startProgram()`
   -  `private func playSelectedMenu()` 
   - `private func       judgeGameResult(userSelectedNumber: Int)`
  - `private func printUserInterface()`
  - `private func printGameOver()`
  - `private func printErrorMessage()`
  - `private func printGameResut(gameResult: GameResult)`
- struct User
  - `enum UserOption
func selectedMenu() -> Int`
  - `private func verifyUserInput(userInput: Int) -> Bool`
- struct Computer
  - `func generatedComputerNumber(numberRange: ClosedRange<Int> = GameOption.computerNumberRange) -> Int`
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

