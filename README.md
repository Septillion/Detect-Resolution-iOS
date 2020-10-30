# Detect-Resolution-iOS

A sister project to [Detect-Resolution-Android](https://github.com/Septillion/Detect-Resolution-Android). It works as a tiny app to read Display Resolution information off of an iOS device. This app is written in SwiftUI.

![img](https://raw.githubusercontent.com/Septillion/Detect-Resolution-iOS/main/1BCE525B-0823-4F6A-BC2C-BC4F198BE0D2.jpeg)

## How to

Clone this repository `git clone https://github.com/Septillion/Detect-Resolution-iOS.git` Or download a ZIP file of the code.

Open the Xcode Project, connect your iOS device, and hit run. (You need to log in to your Apple ID but doesn't necessarily have to be registered in the developer program).

I'll try to submit this app to the App Store, but given how little function it offers, I doubt it'll ever make it past the review process. Fingers crossed.

## A few points worth mentioning
- Methods of sideloading apps on iOS devices aren't as easy, so currently I'm not providing an IPA file. I'll reconsider when the demand is high enough.
- The pure red background on the Android app is replaced with a default white/black one (depending on your Dark Mode settings) because the original intent of making it easy to check the color accuracy isn't as necessary on an Apple device.
- It is possible to port this app to Mac Catalyst, but you need Xcode beta 12.2 in order to build it to a macOS 11 target. Building to macOS 10.15 doesn't yet work.
- But if you have a Mac with Apple Silicon, it just runs natively as an iOS app. Though, the Color Gamut value may be incorrect because UIKit on macOS reports anything other than sRGB as P3.
