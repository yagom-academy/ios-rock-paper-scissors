//
//  Gameable.swift
//  Created by Wonbi, 미니
//

protocol Gameable {
    associatedtype GameType
    
    func fetchUserInput() -> Result<GameType, InputError>
    func checkValidity(of userInputResult: Result<GameType, InputError>) -> GameState
}
