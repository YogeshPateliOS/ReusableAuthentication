# ReusableAuthentication
ReusableAuthentication is a powerful, pure-Swift library for Reuse Your Login and Signup Page with UI and Validations. It provides you a chance to use a pure-Swift way to work with remote ReusableAuthentication in your next app.

## Features

- [x] Reuse UITextfield.
- [x] Change Color Properties of Textfield: Font-Color, Background-Color, Text-Color.
- [x] Add Customizable Placeholder text, left-right Image with Padding.
- [x] Validations: Email, Password, Phonenumber, Character Length Also you can add your regex or validation esaily.  
- [x] View extensions for `UIString`, `UITextfield` and `UIAlertController` to directly add validations and show alert.

### ReusableAuthentication
The simplest use-case is Drag UIView to your UIViewContrller in Interface and click on identity inspector add Custom Class `ReusableLogin`

<a href="https://ibb.co/J7Ltjsc"><img src="https://i.ibb.co/nc2mMLw/Screen-Shot-2020-02-12-at-3-29-36-PM.png" alt="Screen-Shot-2020-02-12-at-3-29-36-PM" border="0"></a>

Yeah! Now just bulid and run your project you find 6 Textfields there. right ? Yeah! Next step...
### Create IBOutlet for `ReusableLogin` UIView.
```@IBOutlet weak var reusableView: ReusableLogin!```

Now i want 3 textfields then use this:
```
reusableView.numberOfTextfields = 3
```

It gives you array UITextfields:
```
reusableView.textFields
```

If you want first textfields:
```
reusableView.textFields.first
```

Let's Add Placeholder text and color for our Textfield:
```
reusableView.textfieldsPlaceholderAndColors(placeholders: ["Hello Guys", "Reusable Authentication", "My Placeholder"], colors: [.red, .blue, .black])
```

Same color on all textfield placeholders:
```
reusableView.textfieldsPlaceholderWithColor(placeholders: ["Hello Guys", "Reusable Authentication", "My Placeholder"], color: .black)
```

Add Image in Textfield like adding key image in Password
```
reusableView.textFields[1].textfieldLeftImage = UIImage(named: "Your Image Name")
reusableView.textFields[1].leftPadding = 8
reusableView.textFields[1].rightPadding = 8
```

same check for 
```
fontName, fontSize,fontColor,customTextAlignment,borderColor,letterSpacing,cornerRadius ,customPlaceholer,horizontalInset,verticalInset,borderWidth,baseLineOffset

reusableView.textFields[1].fontSize = 18
```

### Validations

Let's check all textfields are empty or not
```
let isAllEmpty = reusableView.textfieldsIsEmpty()
print(isAllEmpty) // It gives you true or false...
```

Check Length for textfield
```
let charLength = reusableView.textFields.first?.text?.validateLength() // default length is mini = 8 and max = 18
//charlength return Bool 
```

add Your custom length for textfield
```
let _ = reusableView.textFields.first?.text?.validateLength(mini: 5, max: 13)
```

add Validation for all textfields and also you can add your custom text message..
if it not validate then it showing your message with alert..
if it validate then it gives success in your completion. :-)
```
reusableView.validations(vc: self, validations: [.email, .password, .phonenumber], validationMessage: ["Email is wrong", "Password is incorrect", "Please check your phonenumber once"]) { (str) in
            print(str) // success
        }
```

Seperate Validation for textfields
```
For Email:
reusableView.textFields.first?.text?.validateEmailId()
Password:
reusableView.textFields.first?.text?.validatePassword()
And Phonenumber        
reusableView.textFields.first?.text?.validatePhoneNumber()
```
please check more validations...on `String` extension.

add Your Alert and Actionsheet easily alongwith meassages:
```
self.openAlert(title: "Alert", message: "Please Validate All Textfields", alertStyle: .alert, actionTitles: ["Okay", "Cancel"], actionStyles: [.default, .cancel], actions: [{_ in }, {_ in }])
```
### Contact

Follow and contact me on [Twitter](https://twitter.com/yogeshpatelios) or [Youtube](https://www.youtube.com/YogeshPateliOS). If you find an issue, just [open a ticket](https://github.com/YogeshPateliOS/ReusableAuthentication/issues/new). Pull requests are warmly welcome as well.


## Requirements

- iOS 12.0+
- Swift 4.0+

### License

ReusableAuthentication is released under the MIT license. See LICENSE for details.

