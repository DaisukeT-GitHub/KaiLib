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

import header
  `#import "KaiLib/KaiLib.h`

write test code
  `KaiLogInf(@"%d", [@"Apple" occurredCount:@"p"]);`



EOF




