//
//  ReusableLogin.swift
//  UIVIew_Reusable
//
//  Created by Solulab on 2/7/20.
//  Copyright © 2020 Solulab. All rights reserved.
//

import UIKit

//MARK: - ENUM
public enum ValidationName: String{
    case email
    case password
    case phonenumber
    case isEmpty
}

open class ReusableLogin: UIView {
    
    //MARK:- OUTLETS
    //MARK:- VARIABLES
    public var stackView = UIStackView()
    public var textFields = [CustomTextfield]()
    private let nibName = "ReusableLogin"
    private var leftImage: UIImage!
    private var leftViewSize: CGSize!
    private var leftViewPadding: CGFloat!
    private var rightViewPadding: CGFloat!
    private var datePicker : UIDatePicker!
    
    public var numberOfTextfields: Int?{
        didSet{
            dynamicTextfieldSetup()
        }
    }
    
    public var spacingForTextfields: CGFloat?{
        didSet{
            dynamicTextfieldSetup(txtHeight: textFieldHeight ?? 40)
        }
        willSet{
            stackView.spacing = newValue ?? 0
        }
        
    }
    
    public var textFieldHeight: CGFloat?{
        didSet{
            dynamicTextfieldSetup(txtHeight: textFieldHeight ?? 40)
        }
    }
    
    public var textFieldBackgroundColor: UIColor?{
        didSet{
            let _ = textFields.map{ $0.backgroundColor = textFieldBackgroundColor }
        }
    }
    
    // MARK: - Setup
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public func commonInit() {
        designStackView()
        stackView.addBackground(color: .clear)
    }
    
    public func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}


extension ReusableLogin{
    
    //MARK:- VOIDMETHODS
    
    public func designStackView(){
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let topConst = NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let leftConst = NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let rigthConst = NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let heightConst = NSLayoutConstraint(item: stackView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        NSLayoutConstraint.activate([topConst,leftConst,rigthConst,heightConst])
        
    }
    
    public func dynamicTextfieldSetup(txtHeight: CGFloat = 40){
        for i in 0..<numberOfTextfields! {
            if textFields.count > i{
                textFields[i].frame = CGRect(x: 0, y: 0, width: 0, height: txtHeight)
            }else{
                let customTextfield = CustomTextfield()
                customTextfield.frame = CGRect(x: 0, y: 0, width: 0, height: txtHeight)
                customTextfield.borderStyle = .roundedRect
                textFields.append(customTextfield)
                stackView.addArrangedSubview(customTextfield)
            }
        }
        
        let stackHeight = txtHeight * CGFloat(self.numberOfTextfields!) + stackView.spacing * CGFloat(self.numberOfTextfields!)        
        self.stackView.updateConstraint(attribute: .height, constant: stackHeight)
    }
    
    public func textfieldsPlaceholderAndColors(placeholders: [String], colors:[UIColor]){
        let zipArray = Array(zip(placeholders, colors))
        for (index, tuple) in zipArray.enumerated() {
            if textFields.count > index{
                textFields[index].changeTextfieldPlaceholderColor(tuple.0, placeholder: tuple.1)
            }
        }
    }
    
    public func textfieldsPlaceholderWithColor(placeholders: [String], color: UIColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)){
        for (index, placeholder) in placeholders.enumerated(){
            if textFields.count > index{
                textFields[index].changeTextfieldPlaceholderColor(placeholder, placeholder: color)
            }
        }
    }
    
    public func textfieldsIsEmpty() -> Bool{
        let arr = Array(Set(textFields.map{ $0.text == "" || $0.text == nil }))
        return arr.count == 1 ? arr.first! : false
    }
    
    public func textfieldsKeyboardType( keyboardTypes: [UIKeyboardType]){
        let _ = keyboardTypes.enumerated().map {
            if textFields.count > $0.offset{
                textFields[$0.offset].keyboardType = $0.element
            }
        }
    }
    public func validations(vc: UIViewController, validations: [ValidationName], validationMessage: [String], completionHanlder: ((String) -> Void)){
        var arrMessages = [String]()
        let zipArray = Array(zip(validations, validationMessage))
        
        for (index, tuple) in zipArray.enumerated(){
            if textFields.count > index{
                guard let strText = textFields[index].text else { return }
                let strMessage = validationMessage[index]
                
                switch tuple.0 {
                case .isEmpty:
                    arrMessages.append(strText.isEmpty ? strMessage : "")
                case .email:
                    arrMessages.append(strText.validateEmailId() ? "" : strMessage)
                case .password:
                    arrMessages.append(strText.validatePassword(mini: 8, max: 13) ? "" : strMessage)
                case .phonenumber:
                    arrMessages.append(strText.validatePhoneNumber() ? "" : strMessage)
                }
            }
        }
        
        arrMessages = arrMessages.filter{ $0 != "" }
        if arrMessages.count >= 1{
            vc.openAlert(title: "alert",
                         message: arrMessages.first!,
                         alertStyle: .alert,
                         actionTitles: ["Okay", "Cancel"],
                         actionStyles: [.default, .cancel],
                         actions: [{_ in }, {_ in }])
        }else{
            completionHanlder("success")
        }
        
    }
    
}


