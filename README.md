# ✊✌️🖐️ 묵찌빠 게임
> 가위바위보 중 한 가지를 입력받아 컴퓨터와 비교하여 승패 결과를 얻어
> 이후로 묵찌빠 게임을 진행하여 승리하는 게임입니다.

## 📚 목차
1. [팀원](https://github.com/devjoon/ios-rock-paper-scissors/blob/step2_branch/README.md#%EF%B8%8F-%ED%8C%80%EC%9B%90)
2. [타임 라인](🗓️-타임라인)
3. [시각화된 프로젝트 구조](📈-시각화된-프로젝트-구조)
4. [실행화면](⚙️-실행-화면(기능-설명))
5. [트러블 슈팅](🔍-트러블-슈팅)
6. [참고 링크](🍎-참고-링크)
7. [팀 회고](🤼‍-팀-회고)

## 🙋‍♂️ 팀원
|Kiseok|Morgan|
|:---:|:---:|
<img src="https://github.com/devjoon/IOS_Weekend_Study_10th_GroupB/assets/101351216/7ba2fc8c-c3f9-4df3-ab1e-72a66363c9b2" width="200" height="200"/>|<img src="https://avatars.githubusercontent.com/u/101351216?v=4" width="200" height="200"/>
|[Kiseok(GitHub)](https://github.com/carti1108)|[Morgan(GitHub)](https://github.com/devjoon)|

## 🗓️ 타임라인
> 시간 순으로 프로젝트의 주요 진행 척도를 표시

|날짜|내용|
|---|---|
|9월4일|팀 그라운드룰 정하기, step1 기능 구현 파악, step1 플로우차트 제작, 개인 기본 문법 공부|
|9월5일|짝 프로그래밍 진행, step1 Pull Request 진행|
|9월6일|리뷰어 피드백 답변 및 요구사항 수정, step2 기능 구현 파악|
|9월7일|step2 플로우차트 제작, 짝 프로그래밍 진행, step2 Pull Request 진행|
|9월8일|리뷰어 피드백 답변 및 요구사항 수정, READ ME 작성|

## 📈 시각화된 프로젝트 구조
> Flow Chart

<img src="https://github.com/devjoon/ios-rock-paper-scissors/assets/101351216/c475c4c3-cf37-4fca-ad78-adf45749577d" width="450" height="1000"/>



## ⚙️ 실행 화면(기능 설명)
>실행시 보여지는 화면입니다

|정상실행|잘못된 입력시 컴퓨터 턴 전환|게임 종료|
| --- | --- | --- |
![](https://github.com/devjoon/ios-rock-paper-scissors/assets/101351216/9e4a5d57-0d66-4d42-878e-9c4a234fbe7b))|![](https://github.com/devjoon/ios-rock-paper-scissors/assets/101351216/93e5c8cc-7f7e-4182-8d8f-bec41ced6d42)|![](https://github.com/devjoon/ios-rock-paper-scissors/assets/101351216/5d19a7c0-a1c5-441c-a0bf-a06451a9fe00)|


## 🔍 트러블 슈팅
#### 0~3 사이 숫자가 아닌 다른 숫자나 잘못된 입력을 한 경우 게임을 진행했을때 출력이 여러번 나오던 문제
>재귀함수를 사용하는 과정에서 게임결과 출력함수가 여러번 실행되는 부분 발견 후 호출하는 함수를 변경하여 문제를 해결하였습니다.

```swift
mutating func generateUserHand() {
        do {
            let userInput = try readUserInput()
            try convertToUserHand(user: userInput)
        } catch {
            print("잘못된 입력입니다. 다시 시도해주세요")
            // 이 부분에서 다른 함수를 호출하고 있었습니다.
            generateUserHand()
        }
    }
```

## 🍎 참고 링크
[🍎 Swift 공식문서 CaseIterable](https://developer.apple.com/documentation/swift/caseiterable)<br>
[🍏 Swift 공식문서 Enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/)<br>
[🍎 Swift 공식문서 StructAndClass](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/)<br>

## 🤼‍♂️ 팀 회고
<details> 
<summary> 😆 우리팀 잘한 점 </summary>

팀원 사이에 의견 충돌이 있더라도 서로 끝까지 듣고 조율하는 모습을 보였습니다.
서로 모르는 부분이 있다면 서로 알려주려고 하고 배우려고 하는 모습을 보였습니다.
서로 생각했던점이 일치하는 부분이 많아 제작하는것에 있어서 많은 트러블이 발생하지 않았습니다.
</details>

<details>
<summary> 🥹 우리팀 개선할 점 </summary>

아직도 코딩 컨벤션에 대한 완벽한 숙지가 부족하고 네이밍 부분에서 버벅이는 부분들이 많았습니다
조금더 공식문서와 스스로 생각해보는 시간을 가지고 성장해 나가면 더욱 좋을것 같습니다.
</details>

<details>
<summary> 🤩 서로에게 좋았던 점 </summary>
Morgan🐻: Kiseok의 경우 전반적인 이해가 뛰어나셔서 같이 작업하는것에 있어서 큰 어려움을 느끼지 못했습니다 모르는 것이 있으면 Kiseok이 충분히 잘 설명해 주어서 코드를 전반적으로 파악하는데 많은도움이 되었습니다.<br>
Kiseok🐶: 플로우 차트나 리드미 작성 부분에서 많이 어려웠는데, Morgan이 깔끔하게 작성하고 정리해주신 덕분에 잘 진행되었습니다.
</details>

<details>
<summary> 😔 서로에게 아쉬웠던 점 </summary>
Morgan🐻: 저만 보내고 모각코 안오셨습니다.<br>
Kiseok🐶: 저만 빼고 모각코를 가셨습니다.
</details>





