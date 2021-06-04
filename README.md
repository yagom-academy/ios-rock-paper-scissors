# 묵찌빠 프로젝트 

해당 프로젝트는 step1, step2 로 나뉘어 묵찌빠 프로그램을 구현합니다.
step1의 경우 가위,바위,보 게임을 구현하여 누가 이겼는지 판별합니다.
step2의 경우 step1 에 나온 결과에 따라 순서를 갖고 묵찌빠를 진행합니다.
현재 step1까지 구현완료되었습니다.






## step1 함수설계


## step1 flow chart

![image](https://user-images.githubusercontent.com/73944268/120442105-3d07f180-c3c0-11eb-9af9-1b012249f26b.jpeg)


### 전역변수

userCard: readLine()을 통해 받은 string을 Int로 캐스팅하여 받은 값

### 함수

* startGame() : 전체적인 게임흐름을 구현한 함수
* userInput() : 사용자의 입력값을 받는 함수(Int타입으로 옵셔널 바인딩)
* end() : 게임을 종료하는 함수
* returnResult() : 사용자의 입력값에 따라 종료, compareNumber(), 재귀함수 를 구분하여 소환하는 함수
* generateComputerCard() : 컴퓨터의 패를 결정할 랜덤한 숫자를 리턴하는 함수
* compareCard() : 사용자와 컴퓨터의 패를 비교하여 결과를 판정하는 함수





## step2 함수 설계


## step2 flow chart

![image](https://user-images.githubusercontent.com/73944268/120785021-aece6f80-c567-11eb-9c23-2891f3abf7b2.jpeg)


### 전역변수  

userNumber :  (refactor: userCard -> userNumber)
userTurn :  사용자의 턴인지 확인할수 있는 Bool 타입 변수
computreTurn : 컴퓨터의 턴인지 확인할수 있는 Bool 타입 변수
mookJjiBbaMode : 묵찌빠 모드 인지 확인할수 있는 Bool 타입 변수

### 함수

* printWhichModeSetting() : 묵찌빠 모드인지 가위바위보 모드인지 확인하여 모드에 맞는 print문 출력

* wrongInputAction() : 묵찌빠 모드인지 가위바위보 모드인지 확인하여 잘못된 입력값을 받을경우 입력값 다시 받거나, 턴을 넘김

* isMookJjiBba() : 묵찌빠 모드인지 가위바위보 모드인지 확인하여 모드에 맞게 모듈이 실행되도록 확인하는 함수

* judgeMookJjiBbaResult(): 묵찌빠 모드일 때에 승,패,무승부 결과를 판정 후 턴도 넘기는 함수     

* judgeRockScissorsPaperResult(): 가위바위보 모드일 때 해당 결과를 판정하고 묵찌빠로 넘어간다면 그에 맞는 세팅을 함   

* rockScissorsPaperProcessSeparator(): 가위바위보를 할 때 들어온 숫자에 따라 어떤 작업을 수행할 것인지 결정해줌 

* mookJjiBbaProcessSeparator(): 묵찌빠를 할 때 들어온 숫자에 따라 어떤 작업을 수행할 것인지 결정해줌



