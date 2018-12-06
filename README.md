KaiLib
======

KaiLib is My library for iOS app.

Add the following to the **Other Linker Flags** of **Build Settings**.
* -ObjC 
* -all_load

Also add the following framework, if necessary.
* QuartzCore.framework
* UIKit.framework
* CoreData.framework
* GLKit.framework
* Foundation.framework

To build. Header of KaiLib is copied to the project of this app.

# import header
* import header
  `#import "KaiLib/KaiLib.h`

* write test code
  `KaiLogInf(@"%d", [@"Apple" occurredCount:@"p"]);`



EOF




