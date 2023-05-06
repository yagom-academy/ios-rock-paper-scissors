## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

# 목차

1. [제목](#1.)
2. [소개](#2.)
3. [팀원](#3.)
4. [타임라인](#4.)
5. [실행 화면](#5.)
6. [팀 회고](#6.)

------

<a id="1."></a>
# 1. 제목: 묵찌빠 게임

<a id="2."></a>
# 2. 소개
        사용자에게 1,2,3을 입력받아 가위바위보 게임을 진행합니다.
        가위바위보 게임의 승자가 선으로 묵찌빠 게임을 진행하여 최종 승자를 결정합니다.
        사용자가 0을 입력하면 게임이 종료됩니다.

<a id="3."></a>
# 3. 팀원: kyungmin, kobe
| [](https://github.com/YaRkyungmin) | [](https://github.com/devKobe24) |
| :--------: | :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/admin.jpeg?raw=true" width="150"/>|  <Img src = "https://raw.githubusercontent.com/devKobe24/BranchTest/main/IMG_5424.JPG" width="150"/>|

<a id="4."></a>
# 4. 타임라인
### 23.05.01
- 사용자에게 입력값을 받는 함수 구현.
- 사용자의 입력 유효성 검증 함수 구현중.
- error case 열거형 선언.

### 23.05.02
- 사용자 입력 함수 구현.
- 임의의 수 생성 함수 구현.
- 게임 결과 열거형 구현.
- 묵찌빠 열거형 구현.
- 게임 결과 반환 함수 구현.
- 게임 실행 함수 구현.

### 23.05.03
- 네이밍 수정
- 함수 기능 분리 및 수정.

### 23.05.05
- 게임 로직 함수 구현.
- 열거형 타입 분리, 구현.
- 가위 바위 보 게임 함수 수정.
- 묵찌빠 게임에 필요한 함수들 구현.
- Mukjippa 파일명을 MukjiBba로 변경.
- 입력값을 받아오는 함수에서 동일한 기능을 하는 guard 구문을 결합.

### 23.05.06
- 네이밍 수정 및, 로직 단순화
- MukJjiBba, GameLogic, RockScissorsPaper 클래스 구현

<a id="5."></a>
# 5. 실행 화면
- 사용자로부터 메뉴 번호를 입력받아 가위바위보 게임을 실행한다.

| 사용자 입력 받는 화면 |
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-1.png?raw=true" width="500"/> |

| 가위바위보 사용자 승리 시 | 
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-2.png?raw=true" width="500"/> |
| **가위바위보 컴퓨터 승리 시** | 
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-3.png?raw=true" width="500"/> |

- 사용자와 컴퓨터가 비기면 다시 가위바위보를 진행한다.

| 가위바위보 사용자와 컴퓨터가 비길 시 | 
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-4.png?raw=true" width="500"/> |

- 가위바위보 게임 시 사용자가 잘못 입력한 경우 오류메세지 및 메뉴를 출력한다.

| 가위바위보 게임 시 잘못 입력한 경우 | 
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-5.png?raw=true" width="500"/> |
 
- 묵찌빠 게임 시 승자의 패와 동일한 경우 승자 판가름을 한다.

| 묵찌빠 사용자 승리 시 | 
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-6.png?raw=true" width="500"/> |
| **묵찌빠 컴퓨터 승리 시** | 
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-7.png?raw=true" width="500"/> |

- 묵찌빠 게임 시 사용자가 잘못 입력한 경우 턴이 컴퓨터에게 넘어가고, 메뉴를 출력한다.

| 묵찌빠 게임 시 잘못 입력한 경우 | 
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-8.png?raw=true" width="500"/> |

- 사용자가 종료 메뉴 선택 시 게임이 종료된다.

| 가위바위보 진행 중 종료 시 | 
| :--------: |
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-9.png?raw=true" width="500"/> |
| **묵찌빠 진행 중 종료 시** | 
| <Img src = "https://github.com/devKobe24/BranchTest/blob/main/img/mjp-10.png?raw=true" width="500"/> |


<a id="6."></a>
# 6. 팀 회고
## 우리팀이 잘한 점
- 프로젝트를 진행할때 시간 분배를 잘했습니다.
- 코드를 작성할때 기능분리를 하려고 노력했습니다.

## 우리팀 개선할 점
- 프로젝트 시작전에 객체지향적 사고를 하고 기능분리에 좀 더 신경을 썻으면 좋겠습니다.

## 서로에게 좋았던 점 피드백
- kyungmin에게
    - 배려심이 깊었습니다.
    - 함께 발전하려 하는 모습이 좋았습니다.
    - 항상 열정적입니다.
    - 밝은 모습으로 분위기를 밝게 만들어 주었습니다.
    - 끊임없는 노력으로 코드를 계속해서 깔끔하게 만들었습니다.
    - 시간 약속을 잘 지켜주었습니다.
  
- kobe에게
    - 상대방을 의사를 항상 물어보고 반영해줬어요.
    - 작은 것 하나에도 깊게 파고들어 학습하려는 자세가 돋보였습니다.
    - 프로젝트 할때 배우는 정보들을 잘 정리해둬요.

