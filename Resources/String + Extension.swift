//
//  String + Extension.swift
//  UIVIew_Reusable
//
//  Created by Solulab on 2/10/20.
//  Copyright © 2020 Solulab. All rights reserved.
//

import Foundation

extension String{
    
    // Length be 18 characters max and 3 characters minimum, you can always modify.
    public func validateLength(mini: Int = 8, max: Int = 18) ->Bool {
        let nameRegex = mini > max ? "^\\w{\(mini),}$" : "^\\w{\(mini),\(max)}$"
        return applyPredicateOnRegex(regexStr: nameRegex)
    }
    
    // + or 00 and 5 to 13 characters
    public func validatePhoneNumber(mini: Int = 5, max: Int = 13) -> Bool {
        var phoneRegex = ""
        if mini > max{
            phoneRegex = "^((\\+)|(00))[0-9]{\(mini),}$"
        }else{
            phoneRegex = "^((\\+)|(00))[0-9]{\(mini),\(max)}$"
        }
        return applyPredicateOnRegex(regexStr: phoneRegex)
    }
    
    public func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    
    public func validatePassword(mini: Int = 8, max: Int = 8) -> Bool {
        //Minimum 8 characters at least 1 Alphabet and 1 Number:
        var passRegEx = ""
        if mini >= max{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }else{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
    public func validateAnyOtherTextField(regexStr: String) -> Bool {
        applyPredicateOnRegex(regexStr: regexStr)
    }
    
    public func applyPredicateOnRegex(regexStr: String) -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
