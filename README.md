묵찌빠 프로젝트 저장소
=====

- 프로젝트 기간 2022.04.18 ~ 2022.04.22
- 팀원: unchain123, borysarang 
- 리뷰어: eddy
###### tags: README

## 목차
- [순서도](#순서도)
- [STEP1 기능 구현](#STEP1)
    * [기능](#기능)
    * [고민한 점 / 배운 점](#고민한점-/-배운-점)
    * [PR 내용](#PR-내용)
- [STEP2 기능 구현](#STEP2)
    * [기능](#STEP2-기능)
    * [고민한 점 / 배운 점](#STEP2-고민한-점-/-배운-점)
    * [PR 내용](#STEP2-PR-내용)

## 프로젝트 제약사항
- 코드 들여쓰기 두번 금지
- 짝 프로그래밍
- 주석 없이도 이해할 수 있는 코드 작성하도록 하기

## 순서도
### STEP1 Flowchart
![](https://i.imgur.com/wfITZ4t.png)

### STEP2 Flowchart
![](https://i.imgur.com/fVSofGc.png)

## STEP1
### 기능
- `startMenu` 최초 게임 시작을 하기 위한 함수, 유저 인풋을 받기위한 startMenu 함수 호출
- `choiceMenu` 사용자에게 0,1,2,3중 한가지를 입력받아 가위바위보를 진행
- `getComputerNumber` 컴퓨터의 가위바위보 값을 랜덤으로 생성
- `checkUserInput` 사용자 입력값이 정상적인지(0,1,2,3 중 하나) 확인하는 함수
- `compare` 사용자 입력값과 랜덤으로 생성된 컴퓨터의 가위바위보 값을 비교한다. 비길 경우 재귀적으로 다시 startMenu 함수 호출

**열거형 타입**
가위바위보의 결과값을 나타내기 위해 Rock-Scissors-Paper의 약자인 RPS라는 namespace를 생성하여 사용 했습니다.

### 고민한점 / 배운 점
**Naming**
가위-바위-보 라는 개념을 담은 enum 열거형을 만들어서 활용하려고 했는데 사용자의 입력, 컴퓨터의 랜덤생성된 값, number와 choice의 차이 등 최대한 의미를 담는 변수명을 지으려고 노력했습니다.

**위키, 백과사전 활용** 
위키에 네이밍에 필요한 개념을 검색하면 의외로 정확한 영어 네이밍을 얻을 수 있었습니다. 이 외에도 [curioustore](https://www.curioustore.com/#!/util/naming) 같은 페이지를 찾아 볼 수 있었습니다. 실제 개발자들이 사용중인 변수명을 보면서 아이디어를 얻을 수 있어서 참고가 되었습니다.

### PR 내용
**좀 더 명확한 Naming**
최대한 알맞는 의미를 담으려고 고민을 했으나 PR에서 인지하지 못한 내용들에 대해서 에디가 다시 한번 리뷰해주었습니다. 유저가 선택한 가위바위보를 choice로 표현했거나 컴퓨터의 값을 받아오는 과정에서 get으로 함수명을 지정한것 등등 다시한번 네이밍할 때 고민하게 되었습니다. 

**namespace 활용**
결과를 출력 할 때도 함수로 묶거나 namespace로 출력문을 관리하면 추후에 재사용성이 높아지는걸 알았습니다. 특히 코드를 전체적으로 짜고 다시 읽어보니 무의식적으로 매직넘버를 참 많이 사용했다는 것을 알 수 있었습니다. 이부분도 namespace를 활용하여 해결하였습니다.

## STEP2

### STEP2 기능
- `startMukChiBaGame`: 최초 가위바위보로 승자가 정해진 후 묵찌빠를 실행시키는 함수
- `playMukChiBaGame`: 묵찌빠를 진행하기 위해 사용자 입력을 검증하고 compareMukChiba를 실행 시키는 함수
- `compareMukChiBa`: 사용자와 컴퓨터의 가위바위보 값과 턴을 받아서 결과를 도출하는 함수, 승리가 나지 않는다면 재귀적으로 다시 startMukChiBaGame을 실행시킨다.
- `Winner`: 승자가 턴을 가져오므로 누가 승자인지 넘겨주기 위한 열거형 타입

### STEP2 고민한 점 / 배운 점

최초에 진행하는 가위바위보와 이후의 묵찌빠 로직중 어느부분을 다르게 해야 정상적으로 작동할지에 대해서 이야기를 많이 나누었습니다. 가위바위보값을 이용한다는 점은 같지만 묵찌빠로 넘어가게 되면 비겨야 이기는 점, 묵찌빠에서는 다시 최초의 가위바위보 상태로 돌아가지 않고 턴을 계속 가지고 간다는 점 등 분기에 관련해서 고민을 많이 했었고 플로우차트를 그리면서 한번에 잘 작동하도록 단계를 나누었었습니다. 
다행히 생각했던 내용을 코드로 구현하니 잘 동작했었습니다. 

**저장 타입 프로퍼티**
열거형에서 String을 직접 비교하기 위해 저장 타입 프로퍼티의 형태로 초기값을 지정하여 사용했었습니다. 다만 이 부분에서 단지 static을 안붙이면 동작하지 않기에 일단 넣고 작성을 했었는데, 에디가 이부분에 대해서 사용한 이유와 장점에 대해 물어보았습니다. 

**1. namespace로 연관 있는 항목끼리 사용하기 위해**

**2. namespace끼리 비교하기 위해 초기값을 할당**

이렇게 두가지 이유로 저희는 열거형을 사용했지만 이 외에도 공부를 해보니 전역변수로 선언하게 되면 메모리 할당에서 좋지 않은 영향을 끼칠수도 있었고, 싱글톤 객체처럼 사용을 하여 불필요한 메모리 사용을 줄일 수 있다는 것을 추가로 알 수 있었습니다.

### STEP2 PR 내용

**switch의 tuple사용**
기존에는 묵찌빠 게임의 비교하는 로직을 `if - else` 구문으로 작성하였습니다. 그렇다 보니 나의 가위바위보 값과 컴퓨터의 가위바위보 값을 일일이 비교하기 위해 `||` 논리 연산자를 사용했었습니다. 

```swift
func compare(myHandDesign: RPS, computerHandDesign: RPS) {
    ...
    else if myHandDesign == RPS.rock && computerHandDesign == RPS.scissors ||
                myHandDesign == RPS.scissors && computerHandDesign == RPS.paper ||
                myHandDesign == RPS.paper && computerHandDesign == RPS.rock 
    ...
}
```
실제로 코드를 직접 짠 우리가 봐도 나중에 다른 부분을 작업하다가 다시 이 코드를 읽으면 의미는 명확했으나 한눈에 들어오지 않는 것 같았다. 

이후에 에디가 switch 문에서 tuple형식으로 비교가 가능하다고 힌트를 주어 이부분을 찾아 보았고 아래처럼 리팩토링 할 수 있었다.

```swift=
func compare(myHandDesign: RPS, computerHandDesign: RPS) {
    switch (myHandDesign, computerHandDesign){}
    ...
    case (RPS.scissors, RPS.paper), (RPS.paper, RPS.rock), (RPS.rock, RPS.scissors):
    ...
    }
}
```
같은 로직이지만 좀 더 깔끔해진 코드를 만들어 낼 수 있었다. 
