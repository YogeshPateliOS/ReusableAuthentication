//
//  UITextfield + Extension.swift
//  UIVIew_Reusable
//
//  Created by Solulab on 2/10/20.
//  Copyright © 2020 Solulab. All rights reserved.
//

import Foundation
import UIKit

//MARK:- EXTENSIONS
extension UITextField{
    func changeTextfieldPlaceholderColor(_ placeholderString: String,  placeholder textColor:UIColor){
        self.attributedPlaceholder = NSAttributedString(string: placeholderString, attributes: [.foregroundColor: textColor])
    }
}
