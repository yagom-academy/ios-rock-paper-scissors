# ✊✌️✋묵찌빠 게임 프로젝트 저장소
> 프로젝트 기간 2022.02.08 ~ 2022.02.11 </br>
팀원 : [@mmim](https://github.com/josh0318) [@Red](https://github.com/cherrishRed) / 리뷰어 : [@chacha](https://github.com/ChaminLee)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [순서도](#순서도)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [그라운드 룰](#그라운드-룰)


## 프로젝트 소개

야곰과 묵! 찌! 빠!

<img width="430" alt="2022-02-18_10 47 04" src="https://user-images.githubusercontent.com/88810018/154695736-27fdf3ba-939d-4da2-b94e-7091e0308eee.png">

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## 순서도
<img width="2976" alt="rockSissor_PaperFlowChart" src="https://user-images.githubusercontent.com/88810018/153987254-9eca7d89-f9bb-4676-a477-058f257e0f40.png">

## 키워드

## [STEP 1]

### 고민한 점
* 에러 핸들링
* class vs structure
* enum 타입 사용에 대해서


### 배운 개념

#### 에러 타입을 꼭 throw 로 처리할 필요 없다.
필수적으로 에러를 던져야하는 상황이 아니라면은 nil을 활용해 에러를 던지는 상황 자체를 피해주는 선택을 할 수도 있다. 
```swift
func convertStringToInt(stringValue: String) ->  Int? {
    guard let intValue = Int(stringValue) else {
        return nil
    }
    return intValue
}

func playGame() {
    guard let intValue = convertStringToInt(stringValue: "1") else {
        return 
    }
}
```

#### enum 타입의 다양한 활용

**연산 프로퍼티**
enum 타입에서도 연산 프로퍼티를 사용 가능하다. 이를 이용하면 case 의 값들을 위한 String 값을 지정 할 수 있다. 
```swift
enum MatchResult {
    case win
    case lose
    case draw
    
    var printMessage: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다"
        case .draw:
            return "비겼습니다"
        }
    }
}
```
이를 활용하면 rawValue를 사용하지 않고도 case 를 통해 특정 값에 접근할 수 있다. 
rawValue 라는 키워드는 호출부에서 어떤 종류의 value 를 호출하는 것인지 알기 어렵기 때문에 연산 프로퍼티를 활용하는 것이 좋다.

**extension**
연산 프로퍼티에도 새로운 추가사항이 있을 때 extension 을 사용할 수 있다. 위에서 만든 enum 타입의 case 와 연산 프로퍼티를 분리해 주는 작업이 가능하다. 

**CaseIterable Protocol**

CaseIterable 이라는 프로토콜로 열거형에서 채택 선언 하면, 자동으로 구현을 제공해 준다. 
CaseIterable 을 채택하면 self.allCases 를 사용할 수 있으며, 이는 Direction 타입으로(일기전용) 사용이 가능하다.

#### 깃허브 projects / issue 사용법
프로젝트가 커짐에 따라 그 관리가 복잡하고 팀의 소통이 원활해야 한다. 따라서 깃허브에서는 여러가지 기능을 통해 그 소통을 돕는다. 
1. projects 사용
   - projects 탭을 통해 현재 진행 중인 project 목록을 확인할 수 있다.
   - `New project` 로 새로운 project를 추가할 수 있다.(`Basic kanban`템플릿을 사용하면 더 편리하다.)
   -  `Basic kanban`을 이용하여 project를 생성하면 `To do`, `In prodress', 'Done' column을 볼 수있다.( column을 추가할 수도 있다.)
   - `To do`, `In prodress', 'Done'을 말그대로 해야할 일, 진행중인 일, 끝난일을 담는 colum이다.
   - `To do`에 해야할 일을 등록할 수 있고, 자동으로 issue에 전달할 수도 있다.
   - 드래그&드랍으로 각 column에 목록을 이동할 수 있다.
   - 상황에 따라 `To do`, `In prodress', 'Done' 작업의 상태를 표현할 수 있다.
   
2. issue 사용
   - issue 탭을 통해 현재 등록된 이슈를 확인할 수 있다.
   - 각 상태는 'Open' 과 'Closed' 로 나뉜다.
   - `New issue`를 통해 새로운 이슈를 등록할 수있고, 이슈의 Author, Label, Projects, Milestones, Assignee를 설정해줄 수있다.
   - 새로운 이슈를 등록하면 설정해준 Projects의 `To do` column에 자동으로 등록된다.
   - 이슈 목록에서 상세보기를 하면 등록할 때 설정한 프로젝트에서 진행도를 확인할 수 있다.
   - 이슈 목록에서 상세보기를 하면 댓글을 통해 팀원과 이슈에 대한 소통을 할 수 있다.
    


#### guard let 코드의 일관성 
일관성의 유지를 위해 return 구문이 짧더라도, return 이 긴 메서드가 생길 수 도 있기 때문에, return 구문을 아래로 내리는 것이 좋다.


## [STEP 2]

### 고민한 점
* return 이 있는 함수의 호출
* 문자열을 관리하는 방법
* 옵셔널 타입의 관리
* 재귀 함수 안의 return 값이 밖에 전달되지 않아 생기는 문제 

### 배운 개념

#### discardableResult
@discardableResult
return 값이 있는 함수를 호출하지만 return 값을 활용하지 않을 수도 있는 표기.

#### Inheritance(상속)
- class는 다른 class의 메서드, 프로퍼티, 기타 특성을 상속할 수 있다. 
- 한 클래스가 다른 클래스에서 상속할 때 상속하는 클래스를 상위 클래스라고 하고 상속받은 클래스를 하위 클래스라고 한다.
- Overriding
   - 하위 클래스는 인스턴스 메소드, 타입 메소드, 인스턴스 프로퍼티, 타입 프로퍼티 Overriding할 수 있고, 또한 이를 통해 사용자 정의를 하여 활용할 수 있다.
- Preventing Overrides(오버라이드 방지)
   - final 키워드를 사용하여 오버라이드를 막을 수 있다. ( final class A)

#### 객체지향 SOLID 

입증된 객체 지향 디자인 원리들 중 하나이다.
| ||설명|
|---|---|---|
| S | SRP | 단일 책임 원칙 - 하나의 클래스는 하나의 책임만 가져야 한다. |
| O | OCP | 개방 패쇄 원칙 - 소프트 웨어 요소는 확장에는 열려 있으나 변경에는 닫혀 있어야 한다. |
| L | LSP | 프로그램의 인스턴스는 프로그램의 정확성을 깨뜨리지 않으면서 하위 타입의 인스턴스로 바꿀 수 있어야 한다. |
| I | ISP | 특정 클라이언트를 위한 인터페이스 여러 개가 범용 인터페이스 하나 보다 낫다.|
| D | DIP | 의존관계 역전 원칙 - 프로그래머는 추상화에 의존해야지,구체화에 의존하면 안된다.|

클래스를 다루면서 LSP 개념에 대해서 공부하게 되었다. 

부모 클래스의 인스턴스가 자식 클래스의 인스턴스로 변경 된다고 하더라도 기능을 그대로 수행할 수 있어야 한다. 

---

##  그라운드 룰

### ✏️ 스크럼
> 스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
* 매일 아침 10시, 디스코드에서 진행
* 어제의 활동 리뷰
* 오늘 활동 예정 사항 / 목표
* 자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
* 컨디션 공유 😰
* 공유하고 싶은 이슈, 꿀팁 공유
* 스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
* 상황에 따라 조정 가능

### 🪧 프로젝트
프로젝트 협업 관련된 규칙 ( 지속적으로 업데이트 예정 ) / 야곰캠프에 있는 규칙을 기본으로 🤓

#### **Commit 규칙**
> 커밋 제목은 최대 50자 입력
> 본문은 한 줄 최대 72자 입력

#### **Commit 제목 규칙**
- [chore] : 코드 수정, 내부 파일 수정
- [feat] : 새로운 기능 구현
- [style] : 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- [add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- [fix] : 버그, 오류 해결
- [del] : 쓸모없는 코드 삭제
- [docs] : README나 WIKI 등의 문서 개정
- [mod] : storyboard 파일,UI 수정한 경우
- [correct] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- [move] : 프로젝트 내 파일이나 코드의 이동
- [rename] : 파일 이름 변경이 있을 때 사용합니다.
- [improve] : 향상이 있을 때 사용합니다.
- [refactor] : 전면 수정이 있을 때 사용합니다
- [merge]: 다른브렌치를 merge 할 때 사용합니다.

#### **Commit Body 규칙**
- 제목 끝에 마침표(.) 금지
- 한글로 작성

#### **태그 이름 규칙**
ex) STEP-start, STEP-PR 

