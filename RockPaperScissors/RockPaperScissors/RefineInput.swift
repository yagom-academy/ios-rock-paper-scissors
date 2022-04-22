//
//  RefineInput.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct RefineInput {
    static func requestUserInput() -> String {
        return readLine()?.trimmingCharacters(in: .whitespaces) ?? ""
    }
    
    static func verifyUserInput(of userChoiceCard: String) -> Bool {
        let cardList = ["1","2","3"]
        
        if cardList.contains(userChoiceCard) {
            return true
        } else {
            return false
        }
    }
}
