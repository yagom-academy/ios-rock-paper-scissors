//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

print("가위(1), 바위(2), 보(3)!<종료 : 0> :", terminator: " ")

func inputUserNumber() -> Int {
	guard let input = readLine(), let input = Int(input) else {
		return inputUserNumber()
	}
	
	guard (0...3).contains(Int(input)) else {
		return inputUserNumber()
	}
	
	return input
}

