//
//  StringCalculator.swift
//  harman-assessment
//
//  Created by Yashogna on 07/06/22.
//

import Foundation

enum StringCalculatorErrors: Error {
    case ContainsSignedNumbers(numbers: [Int])
}

class StringCalculator {
    public func add(numberFromString: String) throws -> Int {
        guard !numberFromString.isEmpty else {
            return 0
        }
        let numberArray = extractNumbersFromString(input: numberFromString)
        do {
            try validateSignedNumbers(numbers: numberArray)
            return calculateNumbers(numbers: numberArray)
        } catch StringCalculatorErrors.ContainsSignedNumbers(let signedNumbers) {
            print("negatives not allowed - \(signedNumbers)")
        } catch {
            print("unknown error - \(error)")
        }
        return 0
    }
    
    private func extractNumbersFromString(input: String) -> [Int] {
        let charSet = CharacterSet(charactersIn: ",;\n")
        let numberArray = input.components(separatedBy: charSet)
        return numberArray.map{Int($0) ?? 0}
    }
    
    private func validateSignedNumbers(numbers: [Int]) throws {
        let signedNumbers = numbers.filter{$0 < 0}
        if signedNumbers.count > 0 {
            throw StringCalculatorErrors.ContainsSignedNumbers(numbers: signedNumbers)
        }
    }
    
    private func calculateNumbers(numbers: [Int]) -> Int {
        return numbers.reduce(0) { partialResult, value in
            if value > 1000 {
                return partialResult
            }
            return partialResult + value
        }
    }
}
