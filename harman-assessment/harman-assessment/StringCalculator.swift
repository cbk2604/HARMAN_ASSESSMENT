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
        let numberArray = extractNumbersFromString(input: numberFromString)
        return numberArray.reduce(0) { partialResult, value in
            if value > 1000 {
                return partialResult
            }
            return partialResult + value
        }
    }
    
    private func extractNumbersFromString(input: String) -> [Int] {
        let charSet = CharacterSet(charactersIn: ",;\n")
        let numberArray = input.components(separatedBy: charSet)
        return numberArray.map{Int($0) ?? 0}
    }
}
