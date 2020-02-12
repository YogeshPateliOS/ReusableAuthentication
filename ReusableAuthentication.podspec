
Pod::Spec.new do |s|
  s.platform = :ios
  s.name             = 'ReusableAuthentication'
  s.swift_versions = ['4.0','4.2', '5.0']
  s.version          = '0.7.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 s.requires_arc = true
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
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
