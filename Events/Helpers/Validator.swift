//
//  Validator.swift
//  Events
//
//  Created by Sarvad shetty on 9/5/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import Foundation
import UIKit

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case username
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .username: return UserNameValidator()
        }
    }
}

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

struct UserNameValidator: ValidatorConvertible {
    
    //17bce2463
    
    func validated(_ value: String) throws -> String {
        guard value.count == 9 else {
            throw ValidationError("Registration number must contain nine characters" )
        }
        //        guard value.count < 10 else {
        //            throw ValidationError("Registration number shoudn't conain more than 9 characters" )
        //        }
        
        do {
            if try NSRegularExpression(pattern: "^[0-9]{2}[A-Z]{3}[0-9]{4}$").firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid registration number, registration number must be in the format of XX(Branch)XXXX")
            }
        } catch {
            throw ValidationError("Invalid registration number, registration number must be in the format of XX(Branch)XXXX")
        }
        return value
    }
}

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
