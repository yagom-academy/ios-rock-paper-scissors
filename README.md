## iOS 커리어 스타터 캠프

## ✊✌️🖐 묵찌빠 게임 프로젝트
> 기간: 2022-02-14 ~ 2022-02-18
> 
> 팀원: [Doogie](https://github.com/doogie97), [Eddy](https://github.com/kimkyunghun3) / 리뷰어: [Ari](https://github.com/leeari95)

## 🎉 프로젝트 소개
가위 바위 보! 묵 찌 빠~!

## Step1 FlowChart

![doogie,eddy flowchart](https://user-images.githubusercontent.com/82325822/153981447-fc85ea43-feb8-4d46-a326-8c117f766875.png)

## Step2 FlowChart

![Doogie,Eddy Step2 Flowchart](https://user-images.githubusercontent.com/82325822/154202817-ad6b4795-0e36-43dd-b4a5-c849ef01daa0.png)


## 최종 실행 화면
![ezgif com-gif-maker](https://user-images.githubusercontent.com/82325822/154443974-6bd14d8e-32bc-4062-b536-0631a748e432.gif)

## 로직 구현
### ✨ 주요 기능을 담당하는 함수
#### [enum]
- *`GameOptions`* : 게임 진행 중 나올 수 있는 옵션 모음
- *`GameResult`* : 게임 결과 값 모음
- *`StepOneResultTexts & StepTwoResultTexts`* : 각 게임 결과에 따른 처리 모음
#### [func]
- *`showStepOneMenu`* : 가위바위보 게임 선택지 출력 및 게임 실행 함수
- *`showStepTwoMenu`* : 묵찌빠 게임 선택지 출력 및 게임 실행 함수
- *`matchedStepOneHand & matchedSteTwoHand`* : 사용자 및 컴퓨터 패 매칭 함수
- *`compareStepOne & compareStepTwo`* : 사용자 및 컴퓨터 패 비교 함수
- *`showStepOneResult & showStepTwoResult`* : 게임 결과에 따라 *`StepOneResultTexts & StepTwoResultTexts`* 호출 함수
- *`receiveNumber`* : 사용자 값 입력받는 함수
- *`makeRandomNumber`* : 임의의 수 생성 함수

### ✏️ 고민한 점
- enum 사용 및 초기화 구현
- static 사용
- 코드 간략화에 대한 고민(함수병합, nil-coalescing)
- 네이밍에 대한 고민(...은 평생 할듯)

### ✏️ 해결 방법
#### [enum & static]
- 공통적으로 사용되는 키워드를 enum으로 묶어서 사용하게 되면 가독성도 높이고 반복되는 코드를 줄일 수 있다고 생각
- enum내에 있는 case 사용 시 함수를 구현하게 되면 이 case를 중복적으로 호출해야되는 문제가 생겨 이를 초기화를 통해 enum내부에서 해결 할 수 있게 구현
- 위와 같은 이유로 enum내부에서 사용한 상수 혹은 함수를 enum 외부에서 사용할 때 초기화를 거치지 않고 사용하기 위해 static으로 선언
#### [코드 간략화]
- 같은 기능을 하고는 있으나 사용하는 변수가 다른 함수를 하나의 함수로 만들고 싶어 고민했으며 의외로 간단하게 매개변수를 통해 해결
- optional binding을 하는 과정에서 guard let 문을 사용 했으나 이를 통해 만들어진 상수를 사용하지 않는 optional 값들은 nil-coalescing을 통해 간략화 시켰다.
```swift
func receiveNumber() -> String {
    let receivedNumber = readLine()
    guard let receivedNumber = receivedNumber else { return }
    return receivedNumber
}
// 위 코드를 nil-coalescing으로 구현
func receiveNumber() -> String {
    return readLine() ?? " "
}
```
- but, 무조건 적인 함수 병합은 오히려 가독성을 떨어뜨릴 수 있음!(ex. *`showRockScissorPaperResult`*함수와 *`showMukChiBaResult`* 함수를 병합했을 때 네이밍적인 문제가 크게 발생)
#### [네이밍]
- 어떤 이름을 짓던지 고민을 하며 지었고 평생 고민해야 할 부분이지만 이 프로젝트에서 가장 고민을 많이 하고 또 지금도 해결되지 않은 것은 가위바위보와 묵찌빠를 영어로 어떻게 구분해 주어야 하는가 이다. 
- 현재는 가위바위보는 stepOne으로 묵찌빠는 stepTwo로 구현되어 있으며 고민은 현재진행형...
### ✏️ 깨달은 점
- RAEDME를 미리미리 작성하자!
- 설계를 처음부터 꼼꼼하게 진행하자 (하다보면 되겠지 NO!)

### 🏷️ Commit 규칙
##### 최대한 기능 단위로, 짝 프로그래밍
- feat: 새로운 기능 추가 혹은 구현
- refactor: 네이밍 수정, 위치 조정 등 기능에 영향을 끼치지 않는 수정
- chore: 어떠한 기능도 하지 않는 것에 대한 수정(ex. print 함수)
- fix: 버그 수정
- docs: 문서 추가
