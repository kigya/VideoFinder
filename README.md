
# VideoFinder

A simple application to search for videos on a clean Swfit UI




## Tech Stack

[Swift UI](https://developer.apple.com/xcode/swiftui/)\
[AVKit Framework](https://developer.apple.com/documentation/avkit)\
[Alamofire Library](https://github.com/Alamofire/Alamofire)


## Installation

To run the application, most likely you will have to configure pods.
First delete the existing Podfile:
```bash
  cd videofinder-project
  rm -rf Podfile
```

Сheck if you have installed CocoaPods:
```bash
  pod --version
```

If not, open terminal and type:
```bash
  sudo gem install cocoapods
```

After installation, there will be a lot of messages. Read them and if no error found, it means the CocoaPods installation is done. Next, you need to setup the CocoaPods master repository. Type in the terminal:

```bash
  pod setup
```

Then in the terminal, cd (go back) to your Xcode project root directory (where your .xcodeproj file resides) and type:
```bash
  pod init
```

Then in the terminal, cd (go back) to your Xcode project root directory (where your .xcodeproj file resides) and type:
```bash
  pod init
```


Then open your project's podfile by typing in terminal:
```bash
  open -a Xcode Podfile
```


Your Podfile will get open in text mode. Initially there will be some default commands in there. Here is where you add your project's dependencies. In the podfile type:
```bash
  pod 'Alamofire'
```

Then install pods into your project by typing in terminal:
```bash
  pod install
```

Now close your Xcode project. Then locate and open the .xcworkspace Xcode project file and start coding. (You should no longer open the xcodeproj file.)




## Demo

https://user-images.githubusercontent.com/73034324/166156079-b2d8d3fb-1a28-487f-b03a-32434a24c3bc.mov




