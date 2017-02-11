#
# Be sure to run `pod lib lint CircleLoading.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CircleLoading'
  s.version          = '0.1.0'
  s.summary          = 'CircleLoading view for waiting request from internet.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'CircleLoading view for waiting request from internet. Using in storyboard or view programmatically.'
  
  s.homepage         = 'https://github.com/goldmoment/CircleLoading'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'goldmoment' => 'nguyenvanvienqn@gmail.com' }
  s.source           = { :git => 'https://github.com/goldmoment/CircleLoading.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CircleLoading/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CircleLoading' => ['CircleLoading/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
