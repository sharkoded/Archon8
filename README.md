<<<<<<< HEAD
# Archon8

## Overview

The purpose of this project is to demonstrate (and remember) how to create a Swift framework for iOS that in turn uses Objective-C code.  Then, this framework is used by two different iOS apps -- one Swift and one Objective-C.

## Creating the Framework

1. Create a new Xcode project.
1. Create a new Cocoa Touch framework target using Swift.
2. Create a new Objective C Cocoa Touch class named `OurClass` as a subclass of `NSObject`.
3. Select `OurClass.h` and make sure its Target Membership is `Archon8` _and_ "Public". Turns out this is _critical_.
3. Add the following code to `OurClass.h`:

 ```
 -(void) printMessage:(NSString *) message;

 ```

1. Add the following code to `OurClass.m`:

 ```
-(void) printMessage:(NSString *) message {
  NSLog(@"The message is %@", message);
}

 ```

1. Create a new Swift class named `MyClass` as a subclass of `NSObject` and add the following code to `MyClass.swift`. Note the usage of `public` in front of the class, the initializer, and the `printMessage` method. This makes the class and methods available to those who consume the framework.

 ```
public class MyClass: NSObject {
  
  var message: String
  var object: OurClass = OurClass()
  
  public init(_ newMessage: String) {
    self.message = newMessage
  }
  
  public func printMessage() {
    object.printMessage(self.message)
  }
}
 ```
1. When you created the framework target, Xcode automatically created `Archon8.h` for you. Add the following to that file:

 ```
#import "OurClass.h"
 ```

## Consuming the Framework from a Swift app

1. Create a new single-view iOS app target in the project and name it `SwiftApp` and use Swift.
2. Select the new target and go to the `General` settings.  Under `Embedded Binaries`, click the `+` and add `Archon8.framework`.
3. In the `ViewController.swift` file that was created, add the following line at the top:

 ```
 import Archon8
 ```
 
 and the following method should replace the existing `viewDidLoad`:
 
 ```
  override func viewDidLoad() {
    super.viewDidLoad()
    let sc = MyClass("Hello Swift framework from Swift!!!")
    sc.printMessage()
  }
```

## Consuming the Framework from an Objective-C app
1. Create a new single-view iOS app target in the project and name it `ObjCApp` and use Objective C.
2. Select the new target and go to the `General` settings.  Under `Embedded Binaries`, click the `+` and add `Archon8.framework`.
3. Under the `Build Settings` for the target, find the setting for `Embedded Content Contains Swift Code` and set it to `Yes`.
4. In the ViewController.m file that was created, add the following line at the top:

 ```
 @import Archon8;
 ```
 
 and the following method should replace the existing `viewDidLoad`:
 
 ```
- (void)viewDidLoad {
  [super viewDidLoad];
  MyClass *sc = [[MyClass alloc] init:@"Hello Swift framework from Objective C!!!"];
  [sc printMessage];
}
```

=======
# Archon8
>>>>>>> 8f0dd372f1f1395e7b731a0778d91a669f3497f0
