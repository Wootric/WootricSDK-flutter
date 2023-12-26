#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wootricsdk_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'wootricsdk_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Wrapper around Wootric SDK.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://inmoment.com/wootric/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'InMoment, Inc' => 'vijay.radake@inmoment.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'WootricSDK', '0.27.0'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
