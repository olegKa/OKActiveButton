#
# Be sure to run `pod lib lint OKActiveButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OKActiveButton'
  s.version          = '0.1.3'
  s.summary          = 'OKActiveButton subclass of UIButton'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: OKActiveButton extended subclass of UIButton. Set isActivity = YES.
                       DESC

  s.homepage         = 'https://github.com/olegKa/OKActiveButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'olegKa' => 'kalinin_oleg@list.ru' }
  s.source           = { :git => 'https://github.com/olegKa/OKActiveButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'OKActiveButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OKActiveButton' => ['OKActiveButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'CAHorizontalGradientLayer', '~> 0.1.0'
end
