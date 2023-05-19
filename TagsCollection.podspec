#
# Be sure to run the following command
# $>>  pod lib lint TagsCollection.podspec
# Or
# $>>  pod lib lint TagsCollection.podspec --allow-warnings
# to ensure this is a valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#


# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

Pod::Spec.new do |s|
    s.name             = 'TagsCollection'
    s.version          = '1.1.0'
    s.summary          = 'TagsCollection is a collection view which is render dynamic cell size (tags)'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    This collection view is to out of box and easy use for a better usability and user experience for selections.
    DESC
    
    # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Licensing your code is important. See http://choosealicense.com for more info.
    #  CocoaPods will detect a license file if there is a named LICENSE*
    #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
    #
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
    
    # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Specify the authors of the library, with email addresses. Email addresses
    #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
    #  accepts just a name if you'd rather not provide an email address.
    #
    #  Specify a social_media_url where others can refer to, for example a twitter
    #  profile URL.
    #
    
    s.author           = { 'amrangry' => 'amr.elghadban@gmail.com' }
    # Or just: s.author    = "pengshaowu"
    # s.authors            = { 'amrangry' => 'amr.elghadban@gmail.com'  }
    s.social_media_url = 'https://twitter.com/amr_elghadban'
    
    s.homepage         = 'https://github.com/amrangry/TagsCollection'
    s.screenshots      = 'https://raw.githubusercontent.com/amrangry/TagsCollection/main/Screenshots/Simulator_ScreenShot_iPhone14Pro.jpg'
    #s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    #s.documentation_url = 'https://clockwise.github.io'
    
    
    
    # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If this Pod runs only on iOS or OS X, then specify the platform and
    #  the deployment target. You can optionally include the target after the platform.
    #
    
    s.swift_version = '5.0'
    
    # s.platform     = :ios
    # s.platform     = :ios, "8.0"
    s.platforms = {
        "ios": "12.0"
    }
    
    s.ios.deployment_target = '13.0'
    #  When using multiple platforms
    # s.ios.deployment_target = "8.0"
    # s.osx.deployment_target = "10.7"
    # s.watchos.deployment_target = "2.0"
    # s.tvos.deployment_target = "9.0"
    
    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Specify the location from where the source should be retrieved.
    #  Supports git, hg, bzr, svn and HTTP.
    #
    
    s.source           = { :git => 'https://github.com/amrangry/TagsCollection.git', :tag => s.version.to_s }
    
    # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  CocoaPods is smart about how it includes source code. For source files
    #  giving a folder will include any swift, h, m, mm, c & cpp files.
    #  For header files it will include any header in the folder.
    #  Not including the public_header_files will make all headers public.
    #
    
    # s.exclude_files = "Classes/Exclude"
    # s.source_files  = 'TagsCollection/*.{h,m}'
    #s.source_files = 'TagsCollection/Classes/**/*'
    s.source_files = 'TagsCollection/Classes/*'
    
    # s.public_header_files = "Classes/**/*.h"
    # s.public_header_files = 'Pod/Classes/**/*.h'
    
    # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  A list of resources included with the Pod. These are copied into the
    #  target bundle with a build phase script. Anything else will be cleaned.
    #  You can preserve files from being cleaned, please don't preserve
    #  non-essential files like tests, examples and documentation.
    #
    
    # s.resource  = "icon.png"
    # s.resources = "Resources/*.png"
    # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
    
    # s.resources = 'TagsCollection/Assets/*'
    # s.resource_bundles = {
    #   'TagsCollection' => ['TagsCollection/Assets/*.png']
    # }
    
    
    # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Link your library with frameworks, or libraries. Libraries do not include
    #  the lib prefix of their name.
    #
    
    # s.framework  = "SomeFramework"
    # s.frameworks = 'Foundation', 'UIKit', 'MapKit'
    
    # s.library   = "iconv"
    # s.libraries = "iconv", "xml2"
    
    
    # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If your library depends on compiler flags you can set them in the xcconfig hash
    #  where they will only apply to your library.
    #  If you depend on other Podspecs
    #  you can include multiple dependencies to ensure it works.
    
    s.requires_arc = true
    
    # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
    
    # s.dependency "JSONKit", "~> 1.4"
    # s.dependency 'AFNetworking', '~> 2.3'
    
end
