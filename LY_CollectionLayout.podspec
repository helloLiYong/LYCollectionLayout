#
# Be sure to run `pod lib lint LY_CollectionLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LY_CollectionLayout'
  s.version          = '0.0.1'
  s.summary          = 'A short'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
自定义布局框架，自定义添加图片
                       DESC

  s.homepage         = 'https://github.com/helloLiYong/LY_CollectionLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '895825110@qq.com' => '895825110@qq.com' }
  s.source           = { :git => 'https://github.com/helloLiYong/LY_CollectionLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LY_CollectionLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LY_CollectionLayout' => ['LY_CollectionLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'LY_tool/LY_Category'

end
