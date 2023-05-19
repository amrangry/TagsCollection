#
# Be sure to run `pod lib lint TagsCollection.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TagsCollection'
  s.version          = '0.1.0'
  s.summary          = 'TagsCollection is a collection view which is render dynamic cell size (tags)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This collection view is to out of box and easy use for a better usability and user experience for selections.
                       DESC

  s.homepage         = 'https://github.com/amrangry/TagsCollection'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'amrangry' => 'amr.elghadban@gmail.com' }
  s.source           = { :git => 'https://github.com/amrangry/TagsCollection.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/amr_elghadban'
  #s.documentation_url = 'https://clockwise.github.io'
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "12.0"
  }
  s.source_files = 'TagsCollection/Classes/**/*'
  s.resources = 'TagsCollection/Assets/*'
  # s.resource_bundles = {
  #   'TagsCollection' => ['TagsCollection/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
