//
//  String+Extensions.swift
//  RockPaperScissors
//
//  Created by 변재은 on 2022/04/18.
//

import Foundation

extension String {
    func convertAsInt() -> Int? {
        return Int(self)
    }
    
    func inputValue() -> Int? {
        print(self, terminator: " ")
        let value: String = readLine()?.replacingOccurrences(of: " ", with: "") ?? "0"
        
        return value.convertAsInt()
    }
}
