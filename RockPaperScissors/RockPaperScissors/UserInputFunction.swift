//
//  userInputFunction.swift
//  RockPaperScissors
//
//  Created by 천승현 on 2022/12/27.
//

func choiceRockScissorsPaper(errorType: RockScissorsPaperError) -> Result<Int, RockScissorsPaperError> {
    let input: String? = readLine()
    guard let choice = input else {
        return .failure(errorType)
    }
    
    guard let userChoice = Int(choice), (0...3) ~= userChoice else {
        return .failure(errorType)
    }
    return .success(userChoice)
}
