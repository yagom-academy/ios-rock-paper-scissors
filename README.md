## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

#### 참고링크
* [그라운드룰](https://github.com/FIIIIN/ios-rock-paper-scissors/wiki/%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C%EB%A3%B0)
* [Step-1 Flow Chart](https://user-images.githubusercontent.com/25794814/136899729-bc3cb8fc-4c7d-4cb5-aa8e-fa23ad8b5d08.jpeg)

---

#### Step 1 구현 세부단계 설정

[1단계]
* 사용자의 입력받는 함수 (입력 검증까지 진행)
* 컴퓨터의 임의의 패를 정하는 함수
* 사용자와 컴퓨터의 패를 비교하는 함수(반환값을 아래의 switch로 연결)

[2단계]
* 경우 enum을 어떻게 처리할지 받아주는 swtich
* 출력 메세지를 담는 enum (rawValue 외의 방법 구상하기)
* 게임 실행 함수 -> while? if?

[3단계]
* 오류처리
* 리팩토링

---

#### 고민한 지점
1. ``do-catch를 게임 실행 함수 안에 적는다`` 와 ``do-catch에 함수를 호출한다.`` 각각의 특징 -> 생각 1: do-catch를 외부에 적을 경우, 이후 추가되는 함수의 오류를 처리할 수 있기 때문에 오류처리의 확장성이 좋아진다.
2. ``unknown 케이스를 정의하여 매칭되지 않는 상황`` 에 대해 ``swift enum 문법 중 rawValue를 사용한 enum 인스턴스 생성을 통해 매칭되지 않는 상황을 옵셔널로 처리`` 해보고 싶은데 알맞은 접근법인지 궁금
```swift
enum RockPaperScissorsJudgement {
    case win
    case loose
    case draw
    case unknown
    
    mutating func matchResult(with number: Int) {
        switch number {
        case -2, 1:
            self = .win
        case 2, -1:
            self = .loose
        case 0:
            self = .draw
        default:
            self = .unknown
        }
    }
}
```
3. ``깔끔한 커밋을 위하여 오류처리를 한 번에 진행하는 방법`` 와 ``에러를 담는 enum을 처음부터 작성하는 방법`` 각각의 특징
