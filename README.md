## iOS 커리어 스타터 캠프

## ✊✌️🤚 가위, 바위, 보 게임 

## 목차
#### 1. [소개-💁](#1.-소개)
#### 2. [팀원-⏰](#2.-팀원)
#### 3. [타임라인-⏰](#3.-타임라인)
#### 4. [실행 화면(기능 설명) 💻](#4.-실행-화면(기능-설명)-💻)
#### 5. [트러블 슈팅 ☄️](#5.-트러블-슈팅-☄️)
#### 6. [참고 링크 🔎](#6.-참고-링크-🔎)
---
### 1. 소개 💁
- 가위바위보 게임 메뉴를 출력해 사용자의 입력을 받고, 입력 결과에 따른 처리를 진행하는 코드입니다.
- 진행 방법: 사용자는 hand sign 선택을 위해 1부터 3까지의 숫자를 입력합니다. 정상적으로 입력 시 가위바위보 결과에 따라 묵찌빠 게임을 실행하며, 묵찌빠 게임에서도 정상적으로 1부터 3까지의 숫자 입력시 승자 판단문이 출력되며 종료됩니다.
--- 
### 2. 팀원 👥
| <center>Ash| <center>Jeremy |
| -------- | -------- |
| <a href="https://ibb.co/K6tWhrT"><img src="https://user-images.githubusercontent.com/88357373/186843567-7b59d8c6-8f37-4858-8cf7-6c47d58ba9b0.png" alt="Ash" border="0" width="200"></a>  | <a href="https://ibb.co/K6tWhrT"><img src="https://i.imgur.com/RbVTB47.jpg" border="0" width="200"></a>  |
| <center>*@ash-youu* |<center>*@yjjem* |  
  
---
  
### 3. 타임라인 ⏰
- **[STEP1 구현]** 
![](https://i.imgur.com/vqapOuU.png)
![](https://i.imgur.com/c6PEy72.png)

- **[STEP2 구현]**
![](https://i.imgur.com/19sMGJ2.png)
![](https://i.imgur.com/CbA3tfA.png)
---
### 4. 실행 화면(기능 설명) 💻
    
- 가위, 바위, 보 게임의 잘못된 입력 처리
<img width="344" alt="틀린 선택" src="https://user-images.githubusercontent.com/88357373/186843398-29c792d2-a9f2-4de3-9241-6c0084e46ae4.png">
<img width="385" alt="틀린 선택 문자열" src="https://user-images.githubusercontent.com/88357373/186843267-e6a8745e-18f2-4ed2-aacd-04fa1e9fb322.png">

- 묵찌빠 게임의 잘못된 입력 처리
<img width="414" alt="묵찌빠 틀린 선택" src="https://user-images.githubusercontent.com/88357373/186843309-b1fb1f34-cf14-49e3-b614-06a481021378.png">

    
- 가위, 바위, 보 및 묵찌빠 게임 정상 실행화면
<img width="414" alt="묵찌빠 정상 실행" src="https://user-images.githubusercontent.com/88357373/186843294-e864d2a1-f260-41fa-8f6f-d93e9235bced.png">
 
---
  
### 5. 트러블 슈팅 ☄️
**5-1. 프로젝트를 진행하며 고민했던 점 🤔** 
- **Step 1**
    - **if와 switch 구문 사용에 대한 고민** 
가위바위보 게임에서 user의 승패를 확인할 때, ` userNumber - computerNumber ` 를 기준으로 확인을 했습니다.
해당 수를 기준으로 user가 승인 경우, 그 차이값이 1인 경우 2가지와 -2인 경우 1가지가 있었습니다.
그래서 승패를 판단할 때, 둘 중 어느 조건문을 사용할지 고민했습니다.
        - **if** 사용: if문으로 `userNumber` 가 1이고, `computerNumber` 가 3인 경우면 user의 승리, else if문으로 그것이 아니라면 `userNumber - computerNumber` 값이 1일 때 승리하는 것으로 처리
        - **switch** 사용: `userNumber - computerNumber` 값이 -2 혹은 1이면 승리하는 것으로 처리

        if문은 두가지의 경우를 모두 확인해야 하는 상황이었고, switch문으로 구현하는 경우에는 기준값에 따라 해당하는 케이스의 코드로 처리되기 때문에 if문보다 간결한 작업처리를 할 수 있다고 생각했습니다.
    
    - **함수 기능에 따른 코드 분리 기준에 대한 고민**
처음에는 `startGame()` 함수내에 모든 기능을 포함하여 구현했습니다.
이후에 step2 까지 고려하면 기능 분리가 불가피하다고 생각되어 하나의 함수에서 한가지 기능만을 가질 수 있게 refactoring 하였습니다.

- **Step 2**
    - **높은 코드 중복도에 대한 고민**
    가위바위보 게임 이후 묵찌빠 게임의 구현을 고민하던 도중 두 게임에서 중복되는 함수가 많다는 생각을 하였습니다.
이에 Game 클래스를 만들어 일반화하는 방식으로 코드를 수정했습니다.
    
    - **Fuction Override 시 프로퍼티를 변경하지 못하는 점에 대한 고민**
    함수는 프로퍼티까지 동일하지 않으면, 같은 함수라고 인식하지 않아 override가 불가하여 처음에는 자식클래스에서 함수명만 동일한 함수를 새로 정의하는 방식으로 코드를 구현했었습니다.
하지만, 동일한 코드를 클래스화 하여 중복도를 줄이는 것이 기존 목표였기에 함수의 파라미터로 받아오려 했던 인자를 타입 프로퍼티로 선언해 파라미터를 통일하는 것으로 수정하였습니다.
####
**5-2. Git 관련 트러블 슈팅**
- **git push 시 [rejected] non-fast-forward 오류**
    
    **[문제 상황]**
     1. 로컬에서 git reset <커밋id> 를 작성해 <커밋id> 이후의 커밋 내역 삭제
     2. 디렉토리에 있는 수정 파일을 다시 add, commit까지 진행
     3. 원격저장소에 push 명령어 사용시 non-fast-forward 로 인해 push가 rejected 되었다는 경고문구 출력

    **🔍 fast-forward 란?**
최신 커밋 파일이 이전 커밋의 history를 전부 포함하여 가지고 있는 상황

    **🔍 non-fast-forward 란?**
fast-forward의 반대 상황으로 현재 commit하려는 순간이 이전 commit의 history를 전부 가지고 있지 못하다는 이야기이다.
    
    **[문제 발생 원인]**
remote 저장소와 local 저장소의 커밋 로그가 일치하지 않아 non-fast-forward 상황 발생
git은 git log가 2개인 로컬 저장소 보다는 git log가 3개 남아있는 원격저장소를 최신 커밋 상황이라고 자동적으로 계산하게 된다.
그래서 git에서는 원격저장소의 history를 포함하고 있지 않은 로컬저장소의 상황을 push할 수 없다고 reject를 하는 것
    
    **🌟 해결법: `git reset --force`**
git의 계산을 무시하고 사용자 임의로 해당 명령어를 사용해 로컬 저장소의 내용을 원격저장소로 강제 push하여 해결할 수 있습니다.
---
      예시를 참고해주세요.
![](https://i.imgur.com/fcHxQad.gif "non-fast-forward 상황 예시")
  
      터미널 reject 문구 예시
![](https://i.imgur.com/t7DKsup.png)

    

  
---
### 6. 참고 링크 🔎 
- [누구나 쉽게 이해할 수 있는 Git-입문 - 발전편](https://backlog.com/git-tutorial/kr/stepup/stepup1_4.html)
- [Swift Language Guide - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Swift Language Guide - Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html)
- [Swift Language Guide - Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Swift Language Guide - Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Swift Language Guide - Methods](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
    
