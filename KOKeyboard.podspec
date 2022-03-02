#
# Be sure to run `pod lib lint KOKeyboard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KOKeyboard'
  s.version          = '0.1.0'
  s.summary          = 'KOKeyboard is an iOS drop-in component that adds a new row of keys to the default on-screen keyboard.'

#  s.description      = <<-DESC
#
#                       DESC

  s.homepage         = 'https://github.com/andy380743909/KOKeyboard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andy' => 'andy380743909@gmail.com' }
  s.source           = { :git => 'https://github.com/andy380743909/KOKeyboard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '9.0'

  s.source_files = 'KOKeyboard/Classes/**/*'
  s.resources = "KOKeyboard/Assets/*.png",
#  s.resource_bundles = {
#    'KOKeyboard' => ['KOKeyboard/Assets/*.png']
#  }
   
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  
end
