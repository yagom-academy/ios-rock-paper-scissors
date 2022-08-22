//
//  RockPaperScissors - main.swift
//  Created by Wonbi, mini.
// 

func fetchUserInput() -> Int? {
	print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
	guard let inputedValue = readLine(),
		  let inputedNumber = Int(inputedValue),
		  0...3 ~= inputedNumber else {
		print("잘못된 입력입니다. 다시 시도해주세요.")
		return nil
	}
	return inputedNumber
}

let value = fetchUserInput()
print(value)
