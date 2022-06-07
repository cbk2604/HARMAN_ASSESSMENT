//
//  StringCalculator.swift
//  harman-assessment
//
//  Created by Yashogna on 07/06/22.
//

import Foundation

class StringCalculator {
    public func add(numberFromString: String) -> Int {
        guard !numberFromString.isEmpty else {
            return 0
        }
        let charSet = CharacterSet(charactersIn: ",;\n")
        let numberArray = numberFromString.components(separatedBy: charSet)
        return numberArray.reduce(0) { partialResult, value in
            partialResult + (Int(value) ?? 0)
        }
    }
}
