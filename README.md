<p align="center">
  <img src="https://github.com/delba/Sorry/raw/assets/Sorry@2x.png">
</p>

<p align="center">
  <a href="https://travis-ci.org/delba/Sorry"><img alt="Travis Status" src="https://img.shields.io/travis/delba/Sorry.svg"/></a>
  <a href="https://img.shields.io/cocoapods/v/Sorry.svg"><img alt="CocoaPods compatible" src="https://img.shields.io/cocoapods/v/Sorry.svg"/></a>
  <a href="https://github.com/Carthage/Carthage"><img alt="Carthage compatible" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"/></a>
</p>

**Sorry** exposes a unified API to request permissions on iOS. The library has been designed to be UI agnostic: while providing highly customizable UI elements, it does not constraint you to adopt a certain kind of interface.

> See [`PermissionScope`](https://github.com/nickoneill/PermissionScope) for a different approach.

<p align="center">
    <a href="#usage">Usage</a> • <a href="#example">Example</a> • <a href="#installation">Installation</a> • <a href="#license">License</a>
</p>

## Usage

#### Permission

```swift
let permission: Permission = .Contacts
```

> Supported permissions: `Bluetooth`, `Camera`, `Contacts`, `Events`, `Motion`, `Microphone`, `Notifications`, `Photos`, `Reminders`, `LocationAlways`, and `LocationWhenInUse`.

```swift
permission.request { status in
    switch status {
    case .Authorized:    print("authorized")
    case .Denied:        print("denied")
    case .Disabled:      print("disabled")
    case .NotDetermined: print("not determined")
    }
}
```

You might want to customize the alerts that are presented to the user when the permission was denied/disabled.  

```swift
let alert = permission.deniedAlert // or permission.disabledAlert

alert.title    = "Please allow access to your contacts"
alert.message  = nil
alert.cancel   = "Cancel"
alert.settings = "Settings"
```

#### Permission.Set

Use a `Permission.Set` to check the status of a group of `Permission` and to react whenever it changes.

```swift
let permissionSet = Permission.Set(.Contacts, .Camera, .Microphone, .Photos)
permissionSet.delegate = self

// ...

func permissionSet(permissionSet: Permission.Set, didRequestPermission permission: Permission) {
    switch permissionSet.status {
    case .Authorized:    print("all the permissions are granted")
    case .Denied:        print("at least one permission is denied")
    case .Disabled:      print("at least one permission is disabled")
    case .NotDetermined: print("at least one permission is not determined")
    }
}
```

#### Permission.Button

A `Permission.Button` requests the permission when tapped and updates itself when its status changes.

```swift
let button = Permission.Button(.Photos)
```

The `Permission.Button` are *very* customizable. All the getters and setters of `UIButton` have their equivalent.

```swift
button.setTitles([
    .Authorized:    "Authorized",
    .Denied:        "Denied",
    .Disabled:      "Disabled",
    .NotDetermined: "Not determined"
])

button.setAttributedTitles([:])
button.setTitleColors([:])
button.setBackgroundColors([:])
button.setAttributedTitles([:])

// etc.
```

## Example

```swift
class PermissionsViewController: UIViewController, PermissionSetDelegate {

    let label = UILabel()

    override func viewDidLoad() {
        let contacts   = Permission.Button(.Contacts)
        let camera     = Permission.Button(.Camera)
        let microphone = Permission.Button(.Microphone)
        let photos     = Permission.Button(.Photos)

        // ...

        let permissionSet = Permission.Set(contacts, camera, microphone, photos)
        
        permissionSet.delegate = self
        
        label.text = String(permissionSet.status)
    }

    func permissionSet(permissionSet: Permission.Set, didRequestPermission permission: Permission) {
        label.text = String(permissionSet.status)
    }
}
```

<img align="center" src="https://raw.githubusercontent.com/delba/Sorry/assets/sorry.gif" />

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Sorry into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "delba/Sorry"
```

### Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Sorry into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'Sorry'
```

## License

Copyright (c) 2015 Damien (http://delba.io)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.