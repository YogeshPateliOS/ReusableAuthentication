//
//  CustomTextField.swift
//  UIVIew_Reusable
//
//  Created by Solulab on 2/7/20.
//  Copyright © 2020 Solulab. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class CustomTextfield: UITextField{
    
    @IBInspectable public var textfieldLeftImage: UIImage?{
        didSet{
            addLeftImage()
        }
    }
    
    @IBInspectable public var leftImagesize: CGFloat = 20{
        didSet{
            addLeftImage()
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat = 0{
        didSet{
            addLeftImage()
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat = 0{
        didSet{
            addLeftImage()
        }
    }
    
    
    @IBInspectable public var fontName: String? = "AvenirNext-Bold" {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 15 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var fontColor: UIColor? {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var customTextAlignment: Int = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.white {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var letterSpacing: CGFloat = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var customPlaceholder: String? = nil {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var horizontalInset: CGFloat = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var verticalInset: CGFloat = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var baseLineOffset: CGFloat = 0 {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var placeholderColor: UIColor? = nil {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var requiredColor: UIColor? = nil {
        didSet {
            setupDesigns()
        }
    }
    
    @IBInspectable public var requiredCharacter: String = "*"{
        didSet {
            setupDesigns()
        }
    }
    
    func setupDesigns() {
        // Setup border and corner radius
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        // Setup text style
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        switch customTextAlignment {
        case 2:
            paragraphStyle.alignment = .right
            break
        case 1:
            paragraphStyle.alignment = .center
            break
        default:
            paragraphStyle.alignment = .left
            break
        }
        var titleAttributes:[NSAttributedString.Key : Any] = [
            .foregroundColor: fontColor ?? UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22),
            .kern: letterSpacing,
            .baselineOffset: baseLineOffset,
            .paragraphStyle: paragraphStyle
        ]
        if let _ = fontName {
            titleAttributes[NSAttributedString.Key.font] = UIFont(name: fontName!, size: fontSize)
        }
        if let _ = customPlaceholder {
            var placeholderAttributes = titleAttributes
            if let _ = placeholderColor {
                placeholderAttributes[NSAttributedString.Key.foregroundColor] = placeholderColor
            }
            let attributedPlaceholder = NSMutableAttributedString(string: customPlaceholder!, attributes: placeholderAttributes)
            if let _ = requiredColor {
                let range = (customPlaceholder! as NSString).range(of: requiredCharacter)
                attributedPlaceholder.addAttribute(NSAttributedString.Key.foregroundColor, value: requiredColor!, range: range)
            }
            self.attributedPlaceholder = attributedPlaceholder
        }
        self.defaultTextAttributes = titleAttributes
    }
    
    func addLeftImage(){
        if let img = textfieldLeftImage{
            leftViewMode = .always
            let imgView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: leftImagesize, height: leftImagesize))
            imgView.image = textfieldLeftImage
            imgView.image = img
            let width = leftPadding + leftImagesize + rightPadding
            let imgSuperView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: leftImagesize))
            imgSuperView.addSubview(imgView)
            leftView = imgSuperView
        }else{
            leftViewMode = .never
        }
    }
    
}
