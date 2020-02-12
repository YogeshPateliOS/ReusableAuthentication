
Pod::Spec.new do |s|
  s.name             = 'ReusableAuthentication'
  s.swift_versions = ['4.0','4.2', '5.0']
  s.version          = '0.4.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/YogeshPateliOS/ReusableAuthentication'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yogesh Patel' => 'yogeshp614@gmail.com' }
  s.source           = { :git => 'https://github.com/YogeshPateliOS/ReusableAuthentication.git', :tag => s.version }
  s.resource_bundles = {
'{ReusableAuthentication}' => ['{ReusableAuthentication}/*.xib']
}
  s.ios.deployment_target = '10.2'
  s.source_files = 'Resources/**/*'
 
end
