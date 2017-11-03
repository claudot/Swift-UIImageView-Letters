#
# Be sure to run `pod lib lint Letters.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Letters'
  s.version          = '2.1.1'
  s.summary          = 'Extension of UIImageView to set an image with a given name'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Excellent placeholder for app user profil photo. This extension of UIImageView can allow you to have a placeholder in one line of code
                       DESC

  s.homepage         = 'https://github.com/claudot/Swift-UIImageView-Letters'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul-Anatole CLAUDOT' => 'paul.claudot@gmail.com' }
  s.source           = { :git => 'https://github.com/claudot/Swift-UIImageView-Letters.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

end
