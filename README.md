# TagsCollection
TagsCollection

<p align="center">
  <img src ="https://github.com/amrangry/TagsCollection/blob/main/logo.png?raw=true"/>
</p>

[![CI Status](https://img.shields.io/travis/amrangry/TagsCollection.svg?style=flat)](https://travis-ci.org/amrangry/TagsCollection)
[![Version](https://img.shields.io/cocoapods/v/TagsCollection.svg?style=flat)](https://cocoapods.org/pods/TagsCollection)
[![License](https://img.shields.io/cocoapods/l/TagsCollection.svg?style=flat)](https://cocoapods.org/pods/TagsCollection)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/amrangry/TagsCollection/blob/main/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/TagsCollection.svg?style=flat)](https://cocoapods.org/pods/TagsCollection)

[![Cocoapods compatible](https://img.shields.io/badge/Cocoapods-compatible-brightgreen.svg)](https://cocoapods.org/pods/TagsCollection) 

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) ![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/amrangry/TagsCollection?sort=semver)

![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)

![](https://img.shields.io/badge/Platform-iOS-orange) <img src="https://img.shields.io/badge/minimum%20iOS%20version-10-red"> 

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/amrangry/TagsCollection)
![GitHub last commit](https://img.shields.io/github/last-commit/amrangry/TagsCollection)
![GitHub forks](https://img.shields.io/github/forks/amrangry/TagsCollection?style=social)
![GitHub stars](https://img.shields.io/github/stars/amrangry/TagsCollection?style=social)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Screenshots

<!--<img src="https://github.com/amrangry/TagsCollection/blob/master/Screenshots/movie.gif" width="250" height="500">-->
 <img src="https://github.com/amrangry/TagsCollection/blob/main/Screenshots/Simulator_ScreenShot_iPhone14Pro.jpg?raw=true" width="250" height="500">
 
## Requirements

## Installation

TagsCollection is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TagsCollection'
```

### Swift Package Manager (SPM)
The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. To integrate using Apple's Swift package manager from xcode :

File -> Swift Packages -> Add Package Dependency...

enter package URL : https://github.com/amrangry/TagsCollection/.git , choose the latest release

### Manually
To install manually the TagsCollection classes in your app, just drag the Source class files (demo files and assets are not needed) into your project.

Add content of folder Source/* to your project

## How it works "Usage"

Setup in Interface Builder
In the Identity Inspector, set the layout object's custom class to TagsCollection.

Step 1. In the Identity Inspector, set the layout object's custom class to `TagsCollection`.

 ![](Screenshots/interfacebuilder.png)
 
Step 2. Import `TagsCollection` module to your `Swift` class
```swift
    import TagsCollection
```
Step 3. Connect View with IBOutlet to your `Swift` class

    ```Swift
    @IBOutlet weak var tagsCollection: TagsCollection?
    ```
Step 4. Enjoy :)

## Versioning

this project adheres to [Semantic versioning](https://semver.org/)

Given a version number MAJOR.MINOR.PATCH, increment the:

- MAJOR version when you make incompatible API changes,
- MINOR version when you add functionality in a backwards compatible manner, and
- PATCH version when you make backwards compatible bug fixes.

## TODO

* [x] Segregate UIKit & Foundation
* [ ] CI/CD 
* [ ] More test test test ... (and example)

## Contributing

We alway welcome your contributions :clap:

### Development

1. Fork (https://github.com/amrangry/TagsCollection) :tada:
1. Create a feature branch :coffee:
1. Run test suite with the `$ make test` command and confirm that it passes :zap:
1. Commit your changes :memo:
1. Rebase your local changes against the `main` branch :bulb:
1. Create new Pull Request :love_letter:

Bugs, feature requests and comments are more than welcome in the [issues](https://github.com/amrangry/TagsCollection/issues).

### Feedback

I would like to make `TagsCollection` a better tool.  
The goal is to be able to use in various projects.

Therefore, your feedback is very useful.  
I am very happy to tell you your opinions on Issues and PR :heart:

## **Author**

<div align="center">
  <img src="https://avatars.githubusercontent.com/u/2900952?s=400&u=41c504ca200e2f92638fc630e8361da78296b35c&v=4" width="180" alt="Amr Ahmed Elghadban"/>

  **Amr Ahmed Elghadban (AmrAngry)**

[![Email](https://img.shields.io/badge/Email-Contact%20Me-red?logo=gmail)](mailto:amr.elghadban@gmail.com) [![WhatsApp](https://img.shields.io/badge/GitHub-Profile-blue?logo=whatsapp)](https://api.whatsapp.com/send/?phone=00971543233227&text=Hi%20&app_absent=0) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin)](https://www.linkedin.com/in/amrelghadban/)

[![GitHub](https://img.shields.io/badge/GitHub-Profile-blue?logo=github)](https://github.com/amrangry) [![StackOverflow](https://img.shields.io/badge/StackOverflow-Profile-orange?logo=stackoverflow)](https://stackoverflow.com/users/1316779/amrangry)

[![Twitter (formerly Twitter)](https://img.shields.io/badge/Twitter-Profile-blue?logo=twitter)](https://x.com/intent/follow?screen_name=amr_elghadban) [![Facebook](https://img.shields.io/badge/Facebook-Profile-blue?logo=facebook)](https://facebook.com/amr.elghadban) [![Website](https://img.shields.io/badge/Website-Visit%20Me-blue?logo=globe)](https://amrangry.github.io/)
       <div align="center" >
	       <a href = "https://www.buymeacoffee.com/amrangry">
		    <img src = "https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=&slug=your-username&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"/>
                </a>
       </div>
  <!--  [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support%20Me-yellow?logo=buymeacoffee)](https://www.buymeacoffee.com/amrangry) -->
  <!--  [Email](mailto:amr.elghadban@gmail.com?subject=I%20checked%20your%20GitHub%20repo!): [amr.elghadban@gmail.com](mailto:amr.elghadban@gmail.com) -->
  <!-- [![Linkedin](https://img.shields.io/badge/Lets%20Connect%20via-LinkedIn-blue)](https://www.linkedin.com/in/amrelghadban/) -->
  <!-- [![X (formerly Twitter) Follow](https://img.shields.io/twitter/follow/amr_elghadban)](https://x.com/intent/follow?screen_name=amr_elghadban) -->
  
</div>

## **Contributing 🤘**

All your feedback and help to improve this project is very welcome. Please create issues for your bugs, ideas & enhancement requests, or better yet, contribute directly by creating a PR. 😎

When reporting an issue, please add a detailed instruction, and if possible a code snippet or test that can be used as a reproducer of your problem. 💥

When creating a pull request, please adhere to the current coding style where possible, and create tests with your code so it keeps providing an awesome test coverage level 💪

## **License**

<details>
<summary><strong>MIT License</strong></summary>
<p>
TagsCollection is distributed under the MIT License.  
For more information, see the <a href="[https://github.com/amrangry/iStarWars/blob/master/LICENSE](https://github.com/amrangry/TagsCollection/blob/master/LICENSE))" target="_blank">LICENSE</a> file.  

&copy; 2025 Amr Elghadban  
All rights reserved.
</p>
