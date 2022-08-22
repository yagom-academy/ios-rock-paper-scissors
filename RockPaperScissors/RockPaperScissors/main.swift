//
//  RockPaperScissors - main.swift
//  Created by Wonbi, mini.
//

enum InputError: Error {
	case invalidNumber
}

func generateComputerCard() -> Int {
	let randomCard = Int.random(in: 1...3)
	return randomCard
}

func fetchUserInput() -> Result<Int, InputError> {
	print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
	guard let inputedValue = readLine(),
		  let inputedNumber = Int(inputedValue),
		  0...3 ~= inputedNumber else { return .failure(.invalidNumber) }
	return .success(inputedNumber)
}

func validate(at userInputedResult: Result<Int,InputError>) {
	switch userInputedResult {
	case .success(let userInput):
		print("userInput \(userInput)")
	case .failure:
		print("잘못된 입력입니다. 다시 시도해주세요.")
	}
}

while true {
    let a = fetchUserInput()
	validate(at: a)
}

