# 숫자야구 프로젝트 저장소
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
### 배운 개념


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

