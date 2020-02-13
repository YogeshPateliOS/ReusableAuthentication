
Pod::Spec.new do |s|
  s.platform = :ios
  s.name             = 'ReusableAuthentication'
  s.swift_versions = ['4.0','4.2', '5.0']
  s.version          = '0.7.0'
  s.summary          = 'ReusableAuthentication is a powerful, pure-Swift library for Reuse Your Login and Signup Page with UI and Validations.'
  s.requires_arc = true
  s.description      = <<-DESC
                       ReusableAuthentication is a powerful, pure-Swift library for Reuse Your Login and Signup Page with UI and Validations.
                       * Reuse UITextfield.
                       * Change Color Properties of Textfield: Font-Color, Background-Color, Text-Color.
                       * Add Customizable Placeholder text, left-right Image with Padding.
                       * Validations: Email, Password, Phonenumber, Character Length Also you can add your regex or validation easily.
                       * View extensions for UIString, UITextfield and UIAlertController to directly add validations and show alert. 
                       DESC

  s.framework = 'UIKit'
  s.homepage         = 'https://github.com/YogeshPateliOS/ReusableAuthentication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yogesh Patel' => 'yogeshp614@gmail.com' }
  s.source           = { :git => 'https://github.com/YogeshPateliOS/ReusableAuthentication.git', :tag => s.version }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Resources/**/*.{swift}'
  s.resources = 'Resources/**/*.{xib}'

  
end
