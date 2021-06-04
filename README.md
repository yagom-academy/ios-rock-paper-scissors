# 묵찌빠 프로젝트 

해당 프로젝트는 step1, step2 로 나뉘어 묵찌빠 프로그램을 구현합니다.
step1의 경우 가위,바위,보 게임을 구현하여 누가 이겼는지 판별합니다.
step2의 경우 step1 에 나온 결과에 따라 순서를 갖고 묵찌빠를 진행합니다.
현재 step1까지 구현완료되었습니다.


## flow chart

![image](https://user-images.githubusercontent.com/73944268/120442105-3d07f180-c3c0-11eb-9af9-1b012249f26b.jpeg)


## step1 함수설계

* 전역변수
userCard: readLine()을 통해 받은 string을 Int로 캐스팅하여 받은 값

* 함수
* startGame() : 전체적인 게임흐름을 구현한 함수
* userInput() : 사용자의 입력값을 받는 함수(Int타입으로 옵셔널 바인딩)
* end() : 게임을 종료하는 함수
* returnResult() : 사용자의 입력값에 따라 종료, compareNumber(), 재귀함수 를 구분하여 소환하는 함수
* generateComputerCard() : 컴퓨터의 패를 결정할 랜덤한 숫자를 리턴하는 함수
* compareCard() : 사용자와 컴퓨터의 패를 비교하여 결과를 판정하는 함수

## flow chart

![image](https://user-images.githubusercontent.com/52707151/120448792-dfc36e80-c3c6-11eb-9e71-951590cd5cdb.png)

