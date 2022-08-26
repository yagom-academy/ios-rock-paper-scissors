//
//  MukZiBa.swift
//  RockPaperScissors
//
//  Created by Kyo,Aaron on 2022/08/24.
//

import Foundation

class HandlingInput {
    func generateComputerInput() -> Int {
        let computerInput = Int.random(in: 1...3)
        return computerInput
    }

    func bringUserInput() -> String? {
        let input = readLine()
        return input
    }

    func checkUserInput(input: String?) throws -> Bool {
        let errorSentence: String = "잘못된 입력입니다. 다시 시도해주세요."

        guard let input = Int(input ?? "") else { throw InputError.numberError(message: errorSentence) }

        if 0...3 ~= input {
            return true
        } else {
            throw InputError.rangeError(message: errorSentence)
        }
    }

    func castingUserInput(input: String?) -> Int {
        guard let input = Int(input ?? "") else { return 0 }
        
        return input
    }

    func handlingInputError(input: String?) -> Bool {
        do {
            let isCheck = try checkUserInput(input: input)
            return isCheck
        } catch InputError.numberError(let message) {
            print(message)
            return false
        } catch InputError.rangeError(let message) {
            print(message)
            return false
        } catch {
            return false
        }
    }
}

