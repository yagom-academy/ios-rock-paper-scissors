# README

## 1. 제목
### 묵찌빠 게임

## 2. 소개
- 사용자는 컴퓨터와 묵찌빠 게임의 선공을 결정하기 위한 가위바위보 게임을 먼저 진행 합니다.
- 가위바위보 게임에서 이긴 플레이어가 묵찌빠의 선공을 가져갑니다.
- 묵찌빠의 룰에 따라 게임을 진행하여 승패를 결정합니다.
- 
## 3. 팀원
|혜모리|무리|
|---|---|
|<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/hyemory.png" width="250">|<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/muri.jpeg" width="250">|

## 4. 타임라인
### STEP1
#### **2022.12.26**
- 프로젝트 시작
- 가위바위보 선택, 실행 함수 작업 완료
- STEP1 PR 작성
#### **2022.12.27**
- 한 함수에 하나의 기능만 하도록 함수 분리 / 파일 분리
- STEP1 Merge 완료
### STEP2
#### **2022.12.28**
- 게임 타입(부모 클래스), 가위바위보와 묵찌빠 타입(자식 클래스) 생성
- 게임종류 타입 추가
- STEP2 PR 작성
#### **2022.12.29**
- 접근제어 추가
- 가위바위보, 묵찌빠 실행을 묶은 게임매니저 타입 추가
#### **2022.12.30**
- 게임매니저 타입에 게임시작 메소드 추가

## 5. 시각화된 프로젝트 구조
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EB%AC%B5%EC%B0%8C%EB%B9%A0%EA%B2%8C%EC%9E%84.jpg" width="500">

## 6. 실행 화면

#### 6-1. 게임을 시작하게되면 사용자에게 가위바위보에 대한 입력을 받습니다.
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EA%B0%80%EC%9C%84%EB%B0%94%EC%9C%84%EB%B3%B4_%EC%8B%9C%EC%9E%91.png" width="400">

#### 6-2. 가위바위보에서 비기게 되면, 다시 한 번 가위바위보 게임을 진행합니다.
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EA%B0%80%EC%9C%84%EB%B0%94%EC%9C%84%EB%B3%B4_%EB%B9%84%EA%B9%80.png" width="400">

#### 6-3. 가위바위보에서 이기거나 지면, 승리한 유저의 턴으로 묵찌빠 게임을 시작합니다. 
- 유저 승
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EA%B0%80%EC%9C%84%EB%B0%94%EC%9C%84%EB%B3%B4_%EC%9C%A0%EC%A0%80%EC%8A%B9.png" width="400">

- 컴퓨터 승
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EA%B0%80%EC%9C%84%EB%B0%94%EC%9C%84%EB%B3%B4_%EC%BB%B4%ED%93%A8%ED%84%B0%EC%8A%B9.png" width="400">

#### 6-4. 묵찌빠 게임에서 턴을 가진 플레이어가 상대방과 비기게 되면 게임을 승리하며 종료합니다.
- 유저 승
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EB%AC%B5%EC%B0%8C%EB%B9%A0_%EC%82%AC%EC%9A%A9%EC%9E%90%EC%8A%B9.png" width="400">

- 컴퓨터 승
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EB%AC%B5%EC%B0%8C%EB%B9%A0_%EC%BB%B4%ED%93%A8%ED%84%B0%EC%8A%B9.png" width="400">

#### 6-5. 가위바위보 게임과 묵찌빠 게임에서 0을 입력하면 게임을 종료합니다.
- 가위바위보에서 종료
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EA%B0%80%EC%9C%84%EB%B0%94%EC%9C%84%EB%B3%B4_%EC%A2%85%EB%A3%8C.png" width="400">

- 묵찌빠에서 종료
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/step2/Image/%EB%AC%B5%EC%B0%8C%EB%B9%A0_%EC%A2%85%EB%A3%8C.png" width="400">
    
#### 6-6. 유저의 올바르지 않은 입력
- 가위바위보에서 올바르지 않은 입력을 했을 경우 다시 입력을 받습니다.
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/4f85a9197ec52aead2aea7a7051aab45a1fa2bb6/Image/%EA%B0%80%EC%9C%84%EB%B0%94%EC%9C%84%EB%B3%B4_%EC%9E%98%EB%AA%BB%EC%9E%85%EB%A0%A5.png" width="400">

- 묵찌빠에서 올바르지 않은 입력을 했을 시 턴은 컴퓨터에게 넘어갑니다.
<img src="https://github.com/hyemory/ios-rock-paper-scissors/blob/4f85a9197ec52aead2aea7a7051aab45a1fa2bb6/Image/%EB%AC%B5%EC%B0%8C%EB%B9%A0_%EC%82%AC%EC%9A%A9%EC%9E%90%ED%84%B4%EC%9E%98%EB%AA%BB%EC%9E%85%EB%A0%A5%EC%8B%9C.png" width="400">

## 7. 트러블 슈팅
### 재귀함수에 nil이 입력되어 런타임 오류가 발생
다른 클래스에서 사용하는 변수에 `static`키워드를 붙여 사용하는 방법을 생각했습니다.
객체지향 프로그래밍에서는`static`키워드를 지양하기때문에 다른 방법을 고민해보았습니다.
클래스 타입의 프로퍼티와 함수의 매개변수를 이용하는 방법을 사용하기로 했습니다.

### 의존도? 결합도?
STEP1을 진행 한 후에 STEP1에서 사용한 코드를 가지고 STEP2를 진행했을때 서로 다른 타입의 메소드들이 서로 의존도가 높다는 피드백을 받았습니다.
낮은 의존도를 가지는 모듈을 구성하는데에 어려움을 겪고있습니다...
~~조금 더 겪어보며.. 공부해보아야할것같아요....!~~

### 요구사항에서 가위바위보와 묵찌빠를 표현하는 숫자가 다른 점
기존 가위바위보 기능만 있었을 땐 각 가위, 바위, 보 원시값에 맞는 번호를 넣어주었는데 묵찌빠 게임에서는 가위, 바위, 보의 번호가 달라 고민을 해보았습니다.
HandSign에서 번호를 기준으로 각각의 GameType타입에 맞는 가위, 바위, 보를 리턴하도록 만들었습니다.
HandSign Type내에 Game Type에 따라 숫자를 변환하게 만들어주는 함수를 만들어 사용했습니다.

### HandSign, GameResult 타입 메소드 만들기 (static)
HandSign, GameResult 타입을 굳이 인스턴스로 만들지 않고 바로convertHandSignType, compareHandSigns 함수를 호출하기 위해 함수를 타입 메서드로 만들어주는 static 키워드를 사용했습니다. 
class 키워드로도 타입 메서드를 만들 수 있으나, 추후 다른 곳에서 재정의할 일이 없으므로 static으로 정하였습니다.

## 8. 참고 링크
 - [switch문 튜플 비교](https://nightohl.tistory.com/entry/Swift-%EA%B8%B0%EC%B4%88-switch-case-%EB%AC%B8)
 - [line-wrapping](https://google.github.io/swift/#line-wrapping)
 - [재귀함수, 반복문 차이](https://hazel-developer.tistory.com/173)
 - [재귀함수, 반복문 차이2](https://yeonjewon.tistory.com/80)
 - [접근제어자](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
 - [타입메소드](https://sujinnaljin.medium.com/swift-static과-class-method-property-효과적으로-사용하기-b336311a923c)

--- 

# 팀 회고

## 우리팀이 잘한 점
- 의사소통과 의견교환이 원활했습니다.
- 함께 프로젝트에 투자한 시간이 길었습니다.
- 리뷰어의 코멘트와 피드백에 대한 고민을 많이 해보았습니다.

## 우리팀 개선할 점
- 아직까지도 네이밍을 어려워합니다. 항상 네이밍에 대한 코멘트가 있었습니다.

## 팀원 서로 칭찬하기 부분
- 혜모리 -> 무리
1. 성격이 나이스하셔서 편안하게 제가 다르게 생각하는 부분을 솔직하게 전부 얘기할 수 있었습니다.
2. 상대방이 이야기하는 것을 끝까지 잘 들어주십니다.
3. 꼼꼼하고 생각이 깊으셔서 틀린 부분을 빨리 캐치할 수 있었습니다.
4. 공부했던 내용을 정말 잘 적용하십니다. (이해력 짱)

- 무리 -> 혜모리
1. 에너지가 넘쳐요! 혜모리와 길게 이야기해본게 처음이였는데 아주 재밌었습니다 :) 
2. 아이디어가 샘솟습니다! 이런 저런 방법으로 시도해보는 모습이 아주 멋있어요!
3. 짝프로그래밍중에 모르는 개념이 나오면 친절하게 설명해주셨습니다! 감사해요!!
