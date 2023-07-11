//
//  main.swift
//  evaluate
//
//  Created by Ts SaM on 11/7/2023.
//

import Foundation

func evaluate(_ expression: String) -> Int {
    if let number = Int(expression) {
        return number
    }

    var parenthesesCount = 0
    var operatorIndex = 0
    var operatorSymbol: Character?

    for (index, character) in expression.enumerated() {
        if character == "(" {
            parenthesesCount += 1
        } else if character == ")" {
            parenthesesCount -= 1
        } else if parenthesesCount == 0 && (character == "+" || character == "*") {
            operatorSymbol = character
            operatorIndex = index
            break
        }
    }

    if operatorIndex == 0 {
        return evaluate(String(expression[expression.index(after: expression.startIndex)..<expression.index(before: expression.endIndex)]))
    }

    let leftResult = evaluate(String(expression[..<expression.index(expression.startIndex, offsetBy: operatorIndex)]))
    let rightResult = evaluate(String(expression[expression.index(after: expression.index(expression.startIndex, offsetBy: operatorIndex))...]))

    if operatorSymbol == "+" {
        return leftResult + rightResult
    } else if operatorSymbol == "*" {
        return leftResult * rightResult
    }
    
    return 0
}



print(evaluate("7"))
print(evaluate("(2+2)"))
print(evaluate("(1+(2*4))"))
print(evaluate("((1+3)+((1+2)*5)+(1*2))"))


