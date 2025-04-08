#
# Be sure to run `pod lib lint UIOverlayView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIOverlayView'
  s.version          = '0.1.2'
  s.summary          = 'UIOverlayView is a subclass of UIView used to achieve application gray screen effect.（UIOverlayView是一个UIView的子类，用以实现应用灰屏效果。）'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UIOverlayView also provides 16 rendering modes in the form of enumeration, and default mode is `saturationBlendMode`, default background color is `lightGray`, you can try to customize the effect you want with different combinations. UIOverlayView alse offers instance setting methods for rendering modes and background colors for easy customization, the superView of UIOverlayView defaults to keyWindow, but you can also customize it.(UIOverlayView以枚举的形式提供了16种渲染模式，默认为`saturationBlendMode`，默认背景色为`lightGray`，你可以尝试用不同的组合自定义所需的效果。同时还提供了渲染模式和背景颜色的实例设置方法，UIOverlayView的父视图默认为keyWindow，但你也可以对其进行自定义。)
                       DESC

  s.homepage         = 'https://github.com/Sfh03031/UIOverlayView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sfh03031' => 'sfh894645252@163.com' }
  s.source           = { :git => 'https://github.com/Sfh03031/UIOverlayView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_versions   = '5'
  s.ios.deployment_target = '12.0'

  s.source_files = 'UIOverlayView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UIOverlayView' => ['UIOverlayView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
