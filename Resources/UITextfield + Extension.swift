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
    
    private static var datePickerInstance: UIDatePicker!
    private static var dateStyle: DateFormatter.Style!
    var datePickerProperty:UIDatePicker {
        get {
            return UITextField.datePickerInstance
        }
        set(newValue) {
            UITextField.datePickerInstance = newValue
        }
    }
    
    
    public func changeTextfieldPlaceholderColor(_ placeholderString: String,  placeholder textColor:UIColor){
        self.attributedPlaceholder = NSAttributedString(string: placeholderString, attributes: [.foregroundColor: textColor])
    }
    
    public func openDatePicker(dateFormateStyle: DateFormatter.Style = .medium){
        UITextField.dateStyle = dateFormateStyle
        let screenWidth = UIScreen.main.bounds.width
        
        //Add DatePicker as inputView
        var datePicker = UITextField.datePickerInstance
        if datePicker == nil{
            datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
            UITextField.datePickerInstance = datePicker
        }
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(valueChanged(datepicker:)), for: .valueChanged)
        self.inputView = datePicker
        
        //Add Tool Bar as input AccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func donePressed(){
        self.text = formatter().string(from: UITextField.datePickerInstance.date)
        self.accessibilityLabel = self.text
        self.resignFirstResponder()
    }
    
    @objc
    func valueChanged(datepicker: UIDatePicker){
        UITextField.datePickerInstance = datepicker
        self.text = formatter().string(from: datepicker.date)
    }
    
    func formatter() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = UITextField.dateStyle
        return formatter
    }
    
    @objc func cancelPressed(){
        datePickerText()
        self.resignFirstResponder()
    }
    
    func datePickerText(){
        self.text =  self.accessibilityLabel
        UITextField.datePickerInstance.date = formatter().date(from: self.text ?? "") ?? Date()
    }
}




