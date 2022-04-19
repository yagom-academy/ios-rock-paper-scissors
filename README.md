# 가위바위보 게임
> 프로젝트 기간 2022.04.18~2022.04.22 팀원: @Groot-94, @yeton /리뷰어: @Red
## step1 기능 구현
- UserChoice 타입 구현
- GameMessage 타입 구현
- GameResult 타입 구현
- RockPaperScissorsGame 타입 구현
- 메세지 출력 함수(printGameMessage)
- rawValue 추출 함수(convertUserChoiceToNumber)
- 게임 실행 함수(executeRockPaperScissors) : 게임실행에 필요한 함수들을 호출하는 함수
- 사용자의 입력을 받는 함수(inputUserSelect)
- 사용자의 입력값과 컴퓨터의 입력값 비교하는 함수(compareChoice)
    - 사용자의 입력(가위, 바위, 보)에 따라 비교하여 .win, .lose, .draw 를 반환하는 함수(compareToScissorsOfUser, compareToPaperOfUser, compareToRockOfUser)
- 게임결과를 출력하는 함수(printGameResult)
  
## 고민했던 것들

- 은닉화, 캡슐화의 기준
- 매직 넘버, 매직 스트링을 사용하지 않고 가독성을 위해 enum을 사용하는 방법의 장단점 
- 구조체에서 모든 것을 정의하는 방법의 장단점
- while문과 재귀호출의 차이점

## 배운 개념

- 열거형 rawValue에선 중복값이 불가능
- 열거형 rawValue에선 literal 사용불가, rawValue는 enum 자체를 수정하는 게 아닌이상 다른 방식으로 수정이 불가함
- switch문을 이용한 옵셔널 추출
- switch에서 비교하는 값이 case에 모두 해당되면 default를 사용하지 않는다
- if문에서의 함수호출
- enum을 사용하여 매직 넘버, 매직 스트링을 관리할 때 유지보수가 쉽다. 하지만, 가독성이 떨어질 수도 있다.

## PR 후 개선사항
