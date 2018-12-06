KaiLib
======

KaiLib is My library for iOS app.
Following steps to use.

# Add KaiLib to app project
![image](https://cloud.githubusercontent.com/assets/7778091/3454152/bad54da4-01cd-11e4-9517-467ae5d98130.png)
![image](https://cloud.githubusercontent.com/assets/7778091/3454153/bb3be942-01cd-11e4-9499-6de6d9bfd9c6.png)

# Edit Scheme
Add KaiLib to Scheme.
![image](https://cloud.githubusercontent.com/assets/7778091/3454159/c17b8bd2-01cd-11e4-93ed-79e74e8a588f.png)
![image](https://cloud.githubusercontent.com/assets/7778091/3454156/c1792068-01cd-11e4-80ff-70f9287074af.png)
![image](https://cloud.githubusercontent.com/assets/7778091/3454155/c15d5db0-01cd-11e4-9ad5-bdae54cf2a03.png)

# Edit Build Setting
Add the following to the **Other Linker Flags** of **Build Settings**.
* -ObjC 
* -all_load
![image](https://cloud.githubusercontent.com/assets/7778091/3454158/c17aaff0-01cd-11e4-8c06-24114c788cda.png)

# Edit Build Phases
Add **libKaiLib.a** to **Link Binary With Libraries** of **Build Phases**.
![image](https://cloud.githubusercontent.com/assets/7778091/3454154/c12da692-01cd-11e4-8553-a2e435632d11.png)
Also add the following framework, if necessary.
* QuartzCore.framework
* UIKit.framework
* CoreData.framework
* GLKit.framework
* Foundation.framework
![image](https://cloud.githubusercontent.com/assets/7778091/3454157/c17a91c8-01cd-11e4-95f6-ba83837da8c1.png)

# Build
To build. Header of KaiLib is copied to the project of this app.

# import header
* import header
  `#import "KaiLib/KaiLib.h`

* write test code
  `KaiLogInf(@"%d", [@"Apple" occurredCount:@"p"]);`



EOF




