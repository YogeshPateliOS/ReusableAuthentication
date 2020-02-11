
Pod::Spec.new do |s|
  s.name             = 'ReusableAuthentication'
  s.version          = '0.1.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/YogeshPateliOS/ReusableAuthentication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yogesh Patel' => 'yogeshp614@gmail.com' }
  s.source           = { :git => 'https://github.com/YogeshPateliOS/ReusableAuthentication.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '13.2'
  s.source_files = 'ReusableAuthentication/Resources/**/*'
 
end