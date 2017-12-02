# EFSignalBariOS
An iOS 11 style Signal bar. Could be used to display Recieved Signal Strength in applications

## Preview
![alt tag](https://media.giphy.com/media/xUOxfkAdGpvH28fIpW/giphy.gif)

## Installation

EFSignalBariOS is available through [CocoaPods](http://cocoapods.org). Deployment Target is iOS 10 or greater. To install
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
        case Good = "Good"
        case Low = "Low"
        case VeryLow = "VeryLow"
        case Unknown = "Unknown"
        
    }
  ```
 1. Create an outlet from the Slider View on the story board to your View controller.
 ```swift
 @IBOutlet weak var signalView: EFSignalBarView!
  ```
 2. The signal Strength can be supplied to the signal view as follows:
  ```swift
 signalView.signal = EFSignalBarView.SignalStrength(rawValue: "Excellent")! //or Good, or Low ...
   ```
 3. You can create a function that converts to Signal Strength:
 ```swift
       func convertToSignalStrength(value: Float) -> String{
        
        if value > 0.0 && value <= 0.3 {
            return "VeryLow"
        }else if value > 0.3 && value <= 0.5 {
            return "Low"
        }else if value > 0.5 && value <= 0.7 {
            return "Good"
        }else if value > 0.7 && value <= 1 {
            return "Excellent"
        }else{
            return "Unknown"
        }
      }
```
## Author

Erhies Feka, erhiesfeka@yahoo.com

## License
EFSignalBariOS is available under the MIT license. 
