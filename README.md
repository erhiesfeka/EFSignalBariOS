# EFSignalBariOS
An iOS 11 style Signal bar. Could be used to display Recieved Signal Strength in applications

## Preview
![alt tag](https://media.giphy.com/media/YxTSAbwiRGzG8/giphy.gif)

## Installation

SignalStrength is available through [CocoaPods](http://cocoapods.org). Deployment Target is iOS 10 or greater. To install
it, simply add the following line to your Podfile:

```ruby
pod 'EFSignalBariOS'
```
## Usage
Import the project as shown:
```swift
import EFSignalBariOS
```
Drag a UIView to your storyboard and change it's class to EFSignalBariOS. The view will update to show the signal bars and the following properties can be changed from the storyboard's Attribute inspector:
1. Base Color: The background color of the signal bar when not highlighted
2. Low Signal Color
3. Moderate signal color
4. Excellent signal Color

### There is also a signal Strength Enum defined as follows:
```swift
  public enum SignalStrength: String {
        
        case Excellent = "Excellent"
        case VeryGood = "VeryGood"
        case Good = "Good"
        case Low = "Low"
        case VeryLow = "VeryLow"
        case Unknown = "Unknown"
        
    }
  ```
