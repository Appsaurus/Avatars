# Avatars

![Swift](http://img.shields.io/badge/swift-4.1-orange.svg)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![License](http://img.shields.io/badge/license-MIT-CCCCCC.svg)
## Description

Micro library that generates urls for remote avatar images.

Currently supports [Gravatar](https://www.gravatar.com) and [Adorable Avatars](http://avatars.adorable.io).

## Installation

**Avatars** is available through [Swift Package Manager](https://swift.org/package-manager/). To install, add the following to your Package.swift file.

```swift
let package = Package(
    name: "YourProject",
    dependencies: [
        ...
        .package(url: "https://github.com/Appsaurus/Avatars", from: "1.0.0"),
    ],
    targets: [
      .target(name: "YourApp", dependencies: ["Avatars", ... ])
    ]
)
```

**Avatars** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Avatars', :git => 'https://github.com/Appsaurus/Avatars'
```

**Avatars** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "Strobocop/Avatars"
```

**Avatars** can also be installed manually. Just download and drop `Sources` folders in your project.

## Usage

Usage description coming soon.

## Contributing

We would love you to contribute to **Avatars**, check the [CONTRIBUTING](github.com/Strobocop/Avatars/blob/master/CONTRIBUTING.md) file for more info.

## License

**Avatars** is available under the MIT license. See the [LICENSE](github.com/Strobocop/Avatars/blob/master/LICENSE.md) file for more info.
