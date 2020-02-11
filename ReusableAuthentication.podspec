
Pod::Spec.new do |s|
  s.name             = 'ReusableAuthentication'
s.swift_versions = ['4.0','4.2']
  s.version          = '0.1.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/YogeshPateliOS/ReusableAuthentication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yogesh Patel' => 'yogeshp614@gmail.com' }
  s.source           = { :git => 'https://github.com/YogeshPateliOS/ReusableAuthentication.git', :tag => '0.1.0' }
 
  s.ios.deployment_target = '13.2'
  s.source_files = 'Resources/**/*'
 
end