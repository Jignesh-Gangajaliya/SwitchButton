## Switch On/Off Control

# Introduction

This class aims to make it super-easy to on/off event button, example, Check/Uncheck button, Radio Button On/Off, Switch On/Off.
**All you need is just On/Off Control Image.**

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


