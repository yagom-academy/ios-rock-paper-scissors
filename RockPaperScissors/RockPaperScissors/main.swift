var userPick: String = ""
var computerPick: String = ""
var matchResult: result = .draw
// 초기화는 뭘로 해둬야 적절하지?

func userInput() {
    guard let input = readLine() else {
        print("잘못된 입력값입니다. 다시 시도해주세요.")
        return
    }
    
    switch input {
    case "0":
        userPick = "종료"
    case "1":
        userPick = "묵"
    case "2":
        userPick = "찌"
    case "3":
        userPick = "빠"
    default :
        print("잘못된 입력값입니다. 다시 시도해주세요.")
    }
}

func computerChoice() {
    let ableToPick = ["묵", "찌", "빠"]
    guard computerPick == ableToPick.randomElement() else {
        print("컴퓨터가 무엇을 낼지 고르지 못하고 있습니다..")
        return
    }
}

enum result {
    case userWin
    case computerWin
    case draw
    case exit
}
