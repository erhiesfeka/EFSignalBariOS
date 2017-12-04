# EFSignalBariOS
A recieved signal strength indicator view, inpired by iOS 11 cellular signal indicator

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
    @objc public enum SignalStrength: Int {
        
        case Excellent = 4
        case Good = 3
        case Low = 2
        case VeryLow = 1
        case Unknown = 0
    }
    
  ```
 1. Create an outlet from the Slider View on the story board to your View controller.
 ```swift
 @IBOutlet weak var signalView: EFSignalBarView!
  ```
 2. The signal Strength can be supplied to the signal view as follows:
  ```swift
 signalView.signal = EFSignalBarView.SignalStrength(rawValue: 4 )! //or 3, 2, 1, 0
   ```
 3. You can create a function that converts to Signal Strength:
 ```swift
         func convertToSignalStrength(value: Float) -> Int{
        
        if value > 0.0 && value <= 0.3 {
            return 1
        }else if value > 0.3 && value <= 0.5 {
            return 2
        }else if value > 0.5 && value <= 0.7 {
            return 3
        }else if value > 0.7 && value <= 1 {
            return 4
        }else{
            return 0
        }
    }

```
## Author

Erhies Feka, erhiesfeka@yahoo.com

## License
EFSignalBariOS is available under the MIT license. 
