## On/Off Custom Control

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/matteocrippa/awesome-swift)
[![Platform](https://img.shields.io/badge/Language-Swift_5.0-orange.svg)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/)
![Xcode](https://img.shields.io/badge/Xcode-11.5-blue.svg)


![Demo](https://github.com/JackyGajjar/SwitchButton/blob/master/switch_button.gif?raw=true)


# Introduction

This class aims to make it super-easy to on/off event button, example, Check/Uncheck button, Radio Button On/Off, Switch On/Off.
**All you need is just images of On/Off.**

**You can also get the button click event using confirming the SwitchButtonDelegate Protocol**


## Usage

Create a IBOutlet in ViewController
```Swift
@IBOutlet weak var btnCheckMark: SwitchButton!
```

How to set On/Off value:

```Swift
btnCheckMark.setStatus(true) // Set the on/off bool value
```

Get the status of button:

```Swift
print(btnCheckMark.status) // 
```

Get the Click Event When tap on button, For click event method you have to confirm the protocol. 

```Swift
btnCheckMark.delegate = self

extension YourClassName: SwitchButtonDelegate {
    func valueChangeEvent(isOn: Bool) {
        print(isOn)
    }
}
```

<details>
<summary>📑 Complete Example of `SwitchButton`</summary>

```swift
class MyViewController: UIViewController: SwitchButtonDelegate {
  @IBOutlet weak var btnCheckMark: SwitchButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(btnCheckMark.status) // Get the current status of switch button
    btnCheckMark.setStatus(true) // Set the on/off bool value
    btnCheckMark.delegate = self // Confirm the delegate to get the click event of button
  }
  
  func valueChangeEvent(isOn: Bool) {
      print(isOn)
  }
}
```
</details>


