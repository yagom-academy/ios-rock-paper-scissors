//
//  CommonFunctions.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

enum Player: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

protocol CommonFunctions {
    func filterUserInput() -> Int?
}

extension CommonFunctions {
    func filterUserInput() -> Int? {
        if let input = readLine(),
           let userNumber = Int(input.replacingOccurrences(of: " ", with: "")),
           0...3 ~= userNumber {
            return userNumber
        }
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
}
