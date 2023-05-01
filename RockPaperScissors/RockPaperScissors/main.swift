//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 
enum UserError: Error {
    case invalidConvertType
    case invalidNumber
    case nilValue
}
print("가위(1), 바위(2), 보(3)!<종료 : 0> :", terminator: " ")

func inputUserNumber() throws -> Int {
	guard let input = readLine(), let input = Int(input) else {
        throw UserError.invalidConvertType
	}
	
	guard (0...3).contains(input) else {
        throw UserError.invalidNumber
	}
	
	return input
}

func validationNumber() -> Int? {
    var input: Int?
    
    do {
        input = try inputUserNumber()
    } catch UserError.invalidConvertType {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    } catch UserError.invalidNumber {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    } catch {
        print(error)
    }
    
    return input
}
