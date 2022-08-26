//
//  Gameable.swift
//  Created by Wonbi, 미니
//

protocol Gameable {
    associatedtype GameType
    
    func fetchUserInput() -> Int?
    func convertUserInput(number: Int?) -> Result<GameType, InputError>
    func checkValidity(of userInputResult: Result<GameType, InputError>) -> GameState
}
