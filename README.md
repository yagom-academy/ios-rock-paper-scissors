# 묵찌빠 게임

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [실행화면](#-실행-화면)
6. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
7. [참고링크](#-참고-링크)


## 👋 소개
[Kyo](https://github.com/KyoPak)와 [Aaron](https://github.com/Hashswim)이 구현한 가위바위보 후, 묵찌빠를 하는 게임입니다.


## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()


## 🧑 팀원
[Kyo](https://github.com/KyoPak), [Aaron](https://github.com/Hashswim)
  

## 🕖 타임라인
[Commit History](https://github.com/KyoPak/ios-rock-paper-scissors/commits/step-2)

## 💻 실행 화면
|실제 Play|확인용 Play|
|------|-------|
|![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/59204352/186831035-aaafa43a-86f0-44f1-a129-e7ce9c1695ca.gif)|![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/59204352/186832104-3148f246-27aa-4dc3-81d1-4502270b6fce.gif)|







## 🎯 트러블 슈팅 및 고민
 - 가위바위보 로직에 대한 고민
     - if문만을 사용해서 가위바위보, 묵찌빠의 결과를 도출 해낸다면 간단하고 명료하지만, 코드의 양이 매우 늘어날 것이라고 판단.
     - 가위: 1, 바위: 2, 보: 3 / 묵:1 찌:2 빠:3 이었고 각각 열거형 타입을 선언하여 사용자와 컴퓨터가 낸 손모양에 해당하는 RawValue의 차이가 가위바위보 게임시 1, -2 묵찌빠 게임시 -1, 2라면 사용자가 승리한 것이라는 로직을 발견하였다. 
     - ```decideWin()```메서드에서 게임Type에 따라서 WinNumber를 다르게 하여 승패 도출 로직을 구현하였다. 
         - RPS(가위바위보)게임 WinNumber : 1, -2
         - MZB(묵찌빠)게임 WinNumber : -1, 2

 - git push 명령시 local 저장소의 branch들과 remote 저장소의 branch들이 각각 매칭되지 않아 파일이 충돌하는 문제

    - > error: failed to push some refs to 'https://github.com/KyoPak/~'
    -  remote 저장소와 파일이 일치하게 local 저장소에 branch 똑같이 생성하여 remote저장소와 local 저장소의 branch를 맞춰서 해결
     

  - 가위바위보의 승패를 확인하는 함수에서 파라미터 타입을 설정하는 문제

    - ```swift    
        func decideWin(_ gameName: String, _ userHands: MukZiBa, _ computerHands: MukZiBa) -> Bool {
        -> func decideWin(_ gameName: String, _ userHands: Int?, _ computerHands: Int?) -> Bool {
        ```
    - 유저로 부터 입력받은 값들을 해당하는 enum 타입으로 변경하여 사용하려 했으나 승패 판정 로직을 수행하는 부분에서 복잡해져 미리 Int타입으로 판정을 한 이후 해당하는 enum 타입으로 변경해 해결

  - 함수의 기능과 리턴타입에 맞지 않는 함수명 
     ```swift    
        func decideWinLose() -> Bool
        -> func decideWin() -> Bool
    ```
        
    ```swift    
        func getComNum() -> Int
        -> func generateComputerNumber() -> Int
    ```
    - [Swift API Design Guideline](https://www.swift.org/documentation/api-design-guidelines/)에 따라 컨벤션을 맞춰 기능과 목적에 알맞게 네이밍 수정



## 📚 참고 링크
- [Swift API Design Guideline](https://www.swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Optional, nil, Optional Binding](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Swift Language Guide - Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
