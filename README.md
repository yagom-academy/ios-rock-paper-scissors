# 묵찌빠 게임 프로젝트

 ## 프로젝트 소개
 * 플레이어 1명이 참여하여 컴퓨터를 상대로 가위바위보 게임 및 묵찌빠 게임을 진행합니다.
 * 게임 규칙
   1. 가위바위보 게임을 위해 컴퓨터는 임의의 패를 생성합니다.
   1. 플레이어는 플레이어 패를 생성하기 위해 숫자 1~3 중 하나를 입력합니다. (숫자 1/2/3 = 가위/바위/보)
   1. 가위바위보 게임의 승패에 따라 묵찌빠 게임의 턴을 결정합니다. (만약 비기면 가위바위보 게임을 다시 합니다.)
   1. 묵찌빠 게임을 위해 컴퓨터는 임의의 패를 생성합니다.
   1. 플레이어는 플레이어 패를 생성하기 위해 숫자 1~3 중 하나를 입력합니다. (숫자 1/2/3 = 묵/찌/빠, 만약 잘못된 숫자를 입력하면 턴이 컴퓨터에게 넘어갑니다.)
   1. 묵찌빠 게임에서 승패가 결정되면, 결과를 출력하고 게임을 종료합니다.

 ## STEP 1
 ### Flow Chart
 ![211015_1800_묵찌빠STEP1 순서도_fin drawio](https://user-images.githubusercontent.com/70856586/137463144-7ca43ac3-16a8-4863-b4a0-8f33757ec7a4.png)

 ### 구현 내용
 * Hand 열거형을 생성한 이유 :   
  STEP1의 가위바위보 (숫자 1/2/3 순) 및 STEP2의 묵찌빠 (숫자 1/2/3 순)의 경우, 패 (손의 모양)과 숫자가 일치하지 않습니다. 손의 모양 (rock, paper, scissors)을 case로 가지는 Hand 열거형을 생성하고, 열거형 내부에 2개의 타입 메서드 (changeNumberToHandForRockPaperScissorsGame, changeNumberToHandForMukChiBaGame)를 생성했습니다. 그리고 플레이어의 입력값 (1~3)을 받아서 각 게임의 손의 모양에 해당하는 case를 할당하도록 했습니다.   
  이때, 열거형의 rawValue를 통해 패를 할당하는 방식을 사용하면, 가위바위보 게임용 열거형과 묵찌빠 게임용 열거형을 별개로 생성해야 하므로 rawValue를 사용하지 않았습니다.
 * 가위바위보 게임의 승패 판단 로직 :       
  플레이어/컴퓨터의 패를 비교하는 comparePlayerHandForRockPaperScissorsGame 함수를 통해 구현했습니다. 1) 플레이어의 패를 기준으로 플레이어가 이기기 위해 컴퓨터가 가져야 하는 패를 checkHandForPlayerToWin 메서드를 통해 로컬변수 handForPlayerToWin에 할당하고, 2) 컴퓨터의 패를 handForPlayerToWin와 비교하도록 했습니다.

 ### 고려사항
 1. 주요 변수
     - playerHand : 플레이어의 입력값을 담을 값을 전역변수로 선언함
     - computerHand : 컴퓨터가 생성한 임의의 수를 담을 값을 startGame()함수 내에서 지역상수로 선언함
 2. 주요 함수
     - receiveValidPlayerInput() : 플레이어 입력값을 받고, 입력값이 0 일 때 게임을 종료하는 함수
     - assignPlayerHandIfValidatedForRockPaperScissorsGame(with:) : 플레이어 입력값이 1~3 일 때 가위바위보 패로 변환 및 할당하는 함수
     - startRockPaperScissorsGame() : 가위바위보 게임을 시작하는 함수
     - createComputerHand() : 컴퓨터의 패를 생성하는 함수
     - comparePlayerHandForRockPaperScissorsGame(with:) : 컴퓨터/플레이어 패를 비교하여 가위바위보 게임의 결과를 판단하는 함수
     - checkHandForPlayerToWin() : 플레이어가 이기기 위해 컴퓨터가 가져야 할 패를 리턴하는 함수
     - startProgram() : 가위바위보 게임 및 묵찌빠 게임을 시작하는 함수를 호출하고, 전체 프로그램의 흐름을 관리하는 함수
 
 ### 출력 결과
 ![STEP_1_](https://user-images.githubusercontent.com/50446512/136161655-0434c906-da6c-4465-a9d4-cba4c9042eae.png)

 ## STEP 2
 ### Flow Chart
 ![211015_1800_묵찌빠STEP2 순서도_fin drawio](https://user-images.githubusercontent.com/70856586/137463108-dc1bf000-25f8-4ace-9fe7-0e9dccfaa153.png)
 
 ### 구현 내용
 * 재귀함수 오류을 방지하기 위해 while문으로 수정 :   
  재귀함수를 사용했더니 함수 내부에서 다른 함수를 호출한 뒤에 해당 함수가 제대로 종료되지 않아서, 잘못된 입력값을 받은 횟수만큼 런타임 Stack에 함수가 여러 개 쌓이게 되었습니다. 따라서 함수를 종료할 때마다 startRockPaperScissorsGame() 함수가 여러 번 호출되었습니다. 이러한 재귀함수의 부작용으로 인해 재귀함수 대신 while문을 사용하도록 수정했습니다.   
  while문을 통해 전체 함수의 흐름을 쉽게 확인 가능했습니다. 특히 while문에서 전역변수 playerHand 및 isEndOfGame을 사용하여 while문을 종료하거나 다음 반복으로 넘어가도록 흐름을 제어할 수 있었습니다.
   - 플레이어가 0 입력 시, isEndOfGame에 True를 할당하여 break문을 통해 while문을 종료했습니다.
   - 1,2,3 외의 값을 입력 시, playerHand에 nil을 할당하여 continue문을 실행했습니다.

### 고려사항
 1. 주요 변수
     - isEndOfGame : 플레이어가 0을 입력하여 프로그램을 종료하고자 할 때 true를 할당하고, while문 내부에서 isEndOfGame이 true일 때 break문을 실행함
     - rockPaperScissorsGameResult : STEP1 가위바위보 게임, 그리고 STEP2 묵찌빠 게임 내부에서 호출되는 가위바위보 게임의 결과를 할당함
     - isPlayerTurn : 현재 턴이 플레이어인지 또는 컴퓨터인지 할당함
 1. 주요 함수
     - changeNumberToHandForMukChiBaGame(number:) : 플레이어가 입력한 숫자(1/2/3)를 묵찌빠 패로 변환하는 함수
     - assignPlayerHandIfValidatedForMukChiBaGame(with:) : 플레이어 입력값이 1~3 일 때 묵찌빠 패로 변환 및 할당하는 함수 (이때, 잘못된 입력을 하면 게임의 턴이 컴퓨터로 넘어가므로 가위바위보 게임에서 컴퓨터가 이긴 셈이 됨)
     - changeTurn() : 가위바위보 게임에서 이긴 쪽에게 턴을 넘겨주는 함수
     - printMukChiBaGameResult() : 묵찌빠 게임의 승자를 출력하는 함수
     - startMukChiBaGame() : 묵찌빠 게임을 시작하며, 게임 관련 함수를 관리하는 함수
     
 ### 출력 결과
 ![STEP2 출력결과](https://user-images.githubusercontent.com/70856586/137463219-1cbcae6f-a71c-4a45-a4c9-542ac43167bd.png)
