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
    case success
    case isEmpty
}

open class ReusableLogin: UIView {

    //MARK:- OUTLETS
    @IBOutlet weak public var stackView: UIStackView!
    @IBOutlet public var textFields: [customTextfield]!

    //MARK:- VARIABLES
    private let nibName = "ReusableLogin"
    private var spacing: CGFloat!
    private var leftImage: UIImage!
    private var leftViewSize: CGSize!
    private var leftViewPadding: CGFloat!
    private var rightViewPadding: CGFloat!

   public var numberOfTextfields: Int?{
        willSet{
            if textFields.count > newValue!{
            let _ = Array(newValue!..<textFields.count).map{ textFields[$0].isHidden = true }
            }
        }
    }

   public var spacingForTextfields: CGFloat?{
        didSet{
            stackView.spacing = spacing
        }
        willSet{
            spacing = newValue
        }
    }

    //MARK:- VOIDMETHODS
   public func textfieldsPlaceholderAndColors(placeholders: [String], colors:[UIColor]){
        let zipArray = Array(zip(placeholders, colors))
        for (index, tuple) in zipArray.enumerated() {
            textFields[index].changeTextfieldPlaceholderColor(tuple.0, placeholder: tuple.1)
        }
    }

   public func textfieldsPlaceholderWithColor(placeholders: [String], color: UIColor){
        for (index, placeholder) in placeholders.enumerated(){
        textFields[index].changeTextfieldPlaceholderColor(placeholder, placeholder: color)
        }
    }

   public func textfieldsIsEmpty() -> Bool{
        let arr = Array(Set(textFields.map{ $0.text == "" || $0.text == nil }))
        return arr.count == 1 ? arr.first! : false
    }

   public func validations(vc: UIViewController, validations: [ValidationName], validationMessage: [String], completionHanlder: ((String) -> Void)){
        var str = ""
        let zipArray = Array(zip(validations, validationMessage))
        for (index, tuple) in zipArray.enumerated(){
            guard let strText = textFields[index].text else { return }
            switch tuple.0 {
            case .isEmpty:
                str = strText.isEmpty ? "Please check again" : tuple.1
            case .email:
                if str == ""{
                    str = strText.validateEmailId() ? "" : tuple.1
                }
            case .password:
                if str == ""{
                    str = strText.validatePassword(mini: 8, max: 13) ? "" : tuple.1
                }
            case .phonenumber:
                if str == ""{
                    str = strText.validatePhoneNumber() ? "" : tuple.1
                }
            case .success:
                if str == ""{
                    str = "success"
                }
            }
        }
        str = str == "" ? "Please check again" : str
        if str == "success"{
            completionHanlder("success")
        }else{
            vc.openAlert(title: "alert",
            message: str,
            alertStyle: .alert,
            actionTitles: ["Okay", "Cancel"],
            actionStyles: [.default, .cancel],
            actions: [{_ in }, {_ in }])
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
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

  public func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
