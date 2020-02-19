//
//  ViewController.swift
//  reusableView
//
//  Created by Solulab on 2/13/20.
//  Copyright © 2020 YogeshPatel. All rights reserved.
//

import UIKit
import ReusableAuthentication
class ViewController: UIViewController {

    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var reView: ReusableLogin!

    var datePicker = UIDatePicker()
    var txtDate = UITextField()

    lazy var txtEmail: CustomTextfield = {
        reView.textFields[0]
    }()

    lazy var txtPassword: CustomTextfield = {
        reView.textFields[1]
    }()

    lazy var txtBirthDate: CustomTextfield = {
        reView.textFields[2]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationReusableView()
        self.hideKeyboardWhenTappedAround()
        reView.textFields[2].delegate = self
    }

    private func configurationReusableView(){
        // Init...
        reView.numberOfTextfields = 3
        reView.textFieldHeight = 50
        reView.spacingForTextfields = 5
        viewHeight.constant = reView.stackView.bounds.height
        reView.clipsToBounds = true
        reView.textFieldBackgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
        reView.textfieldsPlaceholderWithColor(placeholders: ["Email", "Password", "Birthdate"])

        txtPassword.textfieldLeftImage = UIImage(named: "india_flag.png")
        txtPassword.leftImagesize = 30
        txtPassword.leftPadding = 8
        txtPassword.rightPadding = 8
        txtPassword.isSecureTextEntry = true

        reView.textfieldsKeyboardType(keyboardTypes: [.emailAddress, .default, .numbersAndPunctuation])
    }

    @IBAction func btnSignInClick(_ sender: UIButton) {
        reView.validations(vc: self, validations: [.email, .phonenumber], validationMessage: ["Please Enter Email", "Please Enter Password"]) { (str) in
            print(str)
        }
    }
}

extension ViewController: UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.reView.textFields[2].openDatePicker()
    }

}

