//
//  KaiLib.h
//  KaiLib
//

#ifndef ___KAILIB_H_
#define ___KAILIB_H_

// Apple frameworks header
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <GLKit/GLKit.h>



// KaiLib config switch
#ifdef DEBUG
#define KAI_DEBUG
#endif


#import "KaiTypes.h"

// KaiLib category extension
#import "KaiCategory/KaiCategory.h"



// KaiLib header
#import "KaiCommon.h"
#import "KaiSingleton.h"
#import "KaiSysLogManager.h"
#import "KaiThread.h"
#import "KaiRandomManager.h"
#import "KaiWeb.h"
#import "KaiArchiveManager.h"
#import "KaiDBManager.h"
#import "KaiImage.h"
#import "KaiFPSCountManager.h"
#import "KaiLocale.h"
#import "KaiApplicationDelegateNotificationCenter.h"
#import "KaiViewControllerProtocol.h"
#import "KaiTableViewStyleDefaultCell.h"
#import "KaiTableViewStyleValue1Cell.h"
#import "KaiTableViewStyleValue2Cell.h"
#import "KaiTableViewStyleSubtitleCell.h"
#import "KaiTextFieldTableViewCell.h"



// KaiGL header
#import "KaiGL/KaiGL.h"



#endif	// ___KAILIB_H_

