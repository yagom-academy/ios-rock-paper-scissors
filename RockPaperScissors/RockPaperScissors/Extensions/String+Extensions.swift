//
//  String+Extensions.swift
//  RockPaperScissors
//
//  Created by Derrick kim, ZZBAE on 2022/04/18.
//

import Foundation

extension String {
    func convertAsInt() -> Int? {
        return Int(self)
    }
    
    func printSelf() {
        print(self, terminator: " ")
    }
    
    func chooseValue() -> Int? {
        let value: String = readLine()?.replacingOccurrences(of: " ", with: "") ?? "4"
        return value.convertAsInt()
    }
}
