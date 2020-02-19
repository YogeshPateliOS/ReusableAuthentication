//
//  UIView + Extension.swift
//  Pods-reusableView
//
//  Created by Solulab on 2/19/20.
//

import Foundation
import UIKit

extension UIView {
    
    public func updateConstraint(attribute: NSLayoutConstraint.Attribute, constant: CGFloat) -> Void {
        if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
            constraint.constant = constant
            self.layoutIfNeeded()
        }
    }
}
