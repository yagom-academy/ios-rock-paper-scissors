## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

![2022-04-18_7 06 26](https://user-images.githubusercontent.com/40224884/163794115-27ae548b-6773-43e2-9d55-d49eada839dd.png)

## 📖 함수 목록 및 역할

- printUserOption()
    - “가위, 바위, 보, 종료”  출력
- makeComputerRandomNumber() -> Int
    - 1이상 3이하의 랜덤한 수를 반환
- inputUserNumber() -> Int
    - printUserOption()을 기본적으로 출력하고
    - 사용자로부터 입력받은 후 checkUserInputNumber를 통해 입력에 해당하는 숫자를 반환
- checkUserInputNumber(userInput: String) -> Int
    - 문자열을 입력 받고 스위치문을 통해 분기 처리 및 값 반환
- printErrorMessage()
    - “잘못된 입력입니다. 다시 시도해주세요.” 출력
- compareTwoNumbers (userInput: Int, computerInput: Int) -> Int
    - 사용자가 이기는 케이스를 선언.
    - 사용자와 컴퓨터가 비기는 케이스, 사용자가 이기는케이스, 사용자가 지는 케이스를 검사 후 해당 값 반환.
- printResult(matchResult: Int)
    - 매개변수로 받은 matchResult에 따라 스위치문으로 분기 처리 후 해당 문구 출력
- startGame()
    - 게임을 시작하는 함수
    - 먼저 컴퓨터의 숫자를 입력 받고
    - 무한 루프를 돌면서 사용자 입력이..
        - -1 인 경우 다시 입력 요구.
        - 0 인 경우 종료.
        - 1에서 3사이의 값은 컴퓨터의 숫자와 비교
            - 이기거나 지는경우는 게임종료.
            

## 📖 궁금한점

- 스타트게임을 조금 더 세분화 하고싶은데 좋은 방법을 알려주시면 감사하겠습니다!
- 변수명과 함수명을 많은 시간을 들여 작성했지만, 잘 썼는지 궁금합니다!
- enum을 사용해서
