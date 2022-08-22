//
//  RockPaperScissors - main.swift
//  Created by Wonbi, mini.
// 

func fetchUserInput() -> Int {
	print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
	guard let inputedValue = readLine(),
		  let inputedNumber = Int(inputedValue),
          0...3 ~= inputedNumber else { return 4 }
	return inputedNumber
}

func vaildate(at userInputed: Int) {
    switch userInputed {
    case 0:
        print("종료")
    case 1:
        print("가위")
    case 2:
        print("바위")
    case 3:
        print("보")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

while true {
    let a = fetchUserInput()
    vaildate(at: a)
}

