# ⛺️iOS 커리어 스타터 캠프

# 목차
1. [Ground Rules](#️-ground-rules)
2. [가위바위보 게임 프로젝트](#️-가위바위보-게임-프로젝트)
3. [게임 규칙](#게임-규칙)
4. [Flow Chart](#flow-chart)
5. [STEP1 실행 영상](#step1-실행-화면)
6. [구현 내용](#구현-내용)
7. [피드백 수정](#피드백-받아서-수정)

</br>



## ⛺️ Ground Rules

- 프로젝트에 집중하는 시간: 10:00 ~ 23:00
- 밥먹는 시간: 12 ~ 14 / 18 ~ 19:30
- 공식적인 휴일: 주말

### 연락이 어려운 시간

- 로이: 연락 24시간 받을 수 있음. (금요일 : 오후 2시에  운동, 보통은  오전에 오픈하자마자 감 )
- 마이노: 연락 24시간 받을 수 있음.

> 유동적!

### TIL, 일일회고

- 끝나고 각자 작성

### 규칙

- 늦지 말자.
- 일이 생기면 미리 이야기하기
- 눈치보지 않고 편하게 서로 질문하기
- 공동 노션 사용하기
- 문서 읽고 프로젝트 시작하기
    - 사전에 시간을 두고 읽고 프로젝트 진행하기
- 요구사항 읽고 로드맵 작성한 후 코드 짜기
- 모르는 개념 나오면 그때 그때 정리하기
    - 트러블슈팅 기록하기
- 코딩 컨벤션
    - 카르마 스타일
    - 커밋 단위: 기능 단위 최대한 잘 지키기, 기능 잘 쪼개기
- 리드미 작성하기


</br>
</br>
</br>

## ⛺️ 가위바위보 게임 프로젝트 
🗓 기간 : 2022.02.14 ~ 2022.02.18(4d)</br>
🗓 팀원 : [로이](https://github.com/Roy-wonji), [마이노](https://github.com/Mino777)</br>
📝 설명 : 컴퓨터와 묵찌빠 게임(console app)</br>
🗓 피드백 주신분 : [lily](https://github.com/yeahg-dev), [수박](https://github.com/soo941226), 

</br>

### 게임 규칙
- 컴퓨터가 생성한 숫자와 유저가 입력한 숫자를 비교하여 같으면 비김, 두 값의 차이가 1 이거나 -2 인 경우 사용자 승리, 두값의 차이가 -1 이거나 2 인 경우 컴퓨터 승리
- 번호가 0...3이 아닌 수가 입력 되면 다시 메뉴로 돌아가게 구현 

</br>

### Flow Chart
<img src = "https://i.imgur.com/4Pvq7Kj.jpg" width="200px"></br>
</br>

### STEP1 실행 화면
<img src = "https://user-images.githubusercontent.com/54234176/154023942-56040465-d3c5-4be4-8364-db895dac103f.gif" width="250px" height="300"></br>


</br>

### Naming
1. `enum RockPaperScissorsType` : 가위바위보 타입 구현 
2. `enum GameResult` : 게임의 결과 및  타입 구현 
3. `startProgram()  : ` 가위바위보 시작하는 함수
4. `playSelectedMenu()`: 메뉴 선택 함수
5. `judgeGameResult` 가위바위 보 판별 하는 함수
</br>

## 구현 내용 
### Step1
1. Swift의 Optional 안전하게 처리하기
2.  if와 switch 조건문의 차이와 장단점 비교하면서  사용 
3. 순환함수(재귀함수)와 반복문의 장단점 비교
4. guard 구문의 이해와 활용을 해보면서  코드 구현 
</br>



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
</br>


### 함수의 기능
- `selectMenu()` 함수 메뉴선택 구현
- `receiveUserInputNumbers()` 사용자 입력을 받는 함수
- `saveConvertedNumbers()` 형 변환된 숫자 저장하는 함수
- `isHaveIntType()`숫자인지 검증 하는 함수
- `isHaveInRange()` 1 에서 9 까지 범위 확인 하는 함수
- `isHaveVerifiedNumbers()` 숫자 인지와 범위 안에 있는 확인하는 함수
</br>


### 고민했던점
- 어떤 경우에 class 와 struct를 적정하게 써야 되는지 고민을 많이 했습니다.
- switch 문에서 self가 동작하는 이유가 무엇인지 궁금합니다.
- 역시나 네이밍은 매번 어렵네요 😂
</br>


#### 매직 넘버도 피하도록 하자!

- 매직 넘버는 코드 중간에 갑자기 등장하는 상수를 의미한다. (문자의 경우 매직 리터럴이라고 한다.)
- 매직 넘버를 사용하게 되면 코드를 알아보기도, 유지보수하기도 힘들어진다.
 </br>
 

#### 재귀 함수

- [컴퓨터 과학](https://ko.wikipedia.org/wiki/%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99)에 있어서 재귀(再歸, Recursion)는 자신을 정의할 때 자기 자신을 재참조하는 방법을 뜻하며, 이를 프로그래밍에 적용한 재귀 호출(Recursive call)의 형태로 많이 사용된다.
> [재귀 - 위키백과](https://ko.wikipedia.org/wiki/%EC%9E%AC%EA%B7%80_(%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99))

- 반복문을 사용하는 것보다 코드가 짧고 간결해진다는 장점이 존재한다.
- 함수를 호출하는 과정에서 오버헤드가 계속 발생하고, 스택오버플로우의 위험이 존재한다.
- 스택프레임을 구성하고 해제하는 시간이 추가적으로 필요하므로 일반적인 반복문보다 느리다는 단점이 있다.
</br>

#### 함수는 최대한 쪼개도록 하자!

- 사용자에게서 입력을 받거나 콘솔에 출력하는 아주 간단한 함수라고 하더라도 가독성, 확장성을 고려한다면 별도의 함수로 감싸서 작성하는 것이 좋다. (의미면에서도 더 명확할 것이다.)
</br>

### 피드백 받아서 수정
1. if 문으로 exit 조건문을 -> guard 문으로 변환 
2. 네이밍을 userOption에서 option으로 변경 
3. value로 따로 처리 한값을  rawValue를 통해서 수정 
