## 묵찌빠 게임✊🏻✌🏻✋🏻

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [순서도](#4-순서도)
5. [실행화면(기능 설명)](#5-실행화면기능-설명)
6. [트러블 슈팅](#6-트러블-슈팅)
7. [참고 링크](#7-참고-링크)
8. [팀 회고](#8-팀-회고)

## 1. 소개
> 가위, 바위, 보를 실행하여 해당 결과에 따라 턴을 정하고
> 묵찌빠 게임을 시작합니다. 
> 패가 같을 경우 턴을 쥐고 있는 쪽이 승리합니다.

## 2. 팀원
|**Toy**|**Charles**|
|-----|-----|
|[Toy 깃헙](https://github.com/woohyeon3382)|[Charles 깃헙](https://github.com/Charl-es)|


## 3. 타임라인
**2023.09.04**
- 순서도 작성

**2023.09.05**
- 가위바위보의 정보를 담을 수 있는 `enum` 타입을 선언과 가위바위보의 게임을 관리하는 `struct` 타입 선언.
- 유저에게 보여줄 메뉴를 출력하는  함수와 유저에게 받은 입력값의 옵셔널을 바인딩 하는 함수 구현
- 컴퓨터 패와 유저의 패를 비교하여 결과값을 출력하는 함수 구현. 컴퓨터 패와 유저 패를 저장하는 속성 추가.
- 속성, 메서드 은닉화와 논리구조 수정
- 불필요한 `import`와 조건문의 조건 수정
- 들여쓰기 제약사항 관련 수정
- 함수명과 아규먼트 레이블 수정

**2023.09.07**
- PR 피드백 수정
  - 프로젝트 파일 이름 변경
  - 구조체 네이밍 변경
  - `inputUserNumber`함수의 아규먼트 레이블과 파라미터 이름 변경
  - `comparevalues` 함수안의 `if`문 조건 나열 방식 수정
  - `private`키워드 추가
- `inputUserNumber`함수의 오류처리
- 에러타입 제거 및 `inputUserNumber`함수 수정
- 함수명 수정 및 기능분리
  - `palyGame` 함수명을 `startGame` 함수명으로 변경
  - `startGame`의 분기처리 로직을 새로운 함수를 정의하여 기능 분리

## 4. 순서도
<img src="https://github.com/Charl-es/ios-rock-paper-scissors/assets/124643367/6df60695-df46-420c-a4d1-e8cf15c8d40e" width="400px" height="800px">

## 5. 실행화면(기능 설명)
- 메뉴 선택

|0을 눌렀을 때| 
| :--------: |
|<img width="359" src="https://github.com/Charl-es/ios-rock-paper-scissors/assets/124643367/212db311-7231-499a-998c-2dd2297b9b95">|
|**잘못된 입력값이 들어갔을때**| 
|<img width="359" src="https://github.com/Charl-es/ios-rock-paper-scissors/assets/124643367/e21a86dd-57f3-4626-924e-7006e0024a84">|

- 게임 실행 및 결과

|게임 실행 화면| 
| :--------: |
|<img width="349" src="https://github.com/Charl-es/ios-rock-paper-scissors/assets/124643367/b217e92a-9911-41cc-9e54-8c7ddb1d7724">|

## 6. 트러블 슈팅
### 1️⃣반환값에서의 매직넘버 처리에 대한 고민

**수정 전**
- 사용자의 입력을 받은 값을 옵셔널 바인딩 한 후 그 값을 리턴하는 부분에 있어 매직넘버를 사용함.
```swift
private func inputUserNumber(number: String?) -> Int {
    guard let number = number, let number = Int(number) else { return 4 }
        
    return number
}
```

**수정 후**
- 사용자 입력을 `while`문으로 무한루프를 주어 일정 조건을 만족할 때 빠져 나가도록 수정함.
```swift
private func inputUserNumber() -> Int {
    while true {
        let stringNumber = readLine()
                
        if let stringNumber = stringNumber, let number = Int(stringNumber) {
            return number
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            printMenu()
        }
    }
}
```



## 7. 참고 링크
- [재귀함수와 반복문의 차이](https://hazel-developer.tistory.com/173)

## 8. 팀 회고
**😁 우리팀이 잘한점**
- 서로의 의견을 조율을 잘하여 코드를 구현하였음.


**😅 우리팀의 아쉬운 점**
- 첫 스텝 수정에 많은 시간이 소모되어 다음 스텝을 진행에 있어 코드 구현을 진행할 때 여러 코드에 대한 피드백을 받는 것에 대한 시간적 부담이 커져 좀 더 다양한 시도를 해보지 못한 아쉬움이 있음.
