//
//  UIStackView + Extension.swift
//  Pods-reusableView
//
//  Created by Solulab on 2/19/20.
//

import Foundation
import UIKit

extension UIStackView {
    public func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
