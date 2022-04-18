//
//  String+Extensions.swift
//  RockPaperScissors
//
//  Created by 변재은 on 2022/04/18.
//

import Foundation

extension String {
    func inputValue() -> String? {
        print(self, terminator: " ")
        
        return readLine()?.replacingOccurrences(of: " ", with: "")
    }
}
