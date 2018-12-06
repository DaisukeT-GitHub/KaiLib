//
//  KaiGLCommon.h
//  KaiLib
//

#import "KaiGL.h"



// macros
#define STRINGIZE(x) #x
#define STRINGIZE2(x) STRINGIZE(x)
#define SHADER_STRING(text) @ STRINGIZE2(text)



/**
 * KaiGL の共通機能
 */
@interface KaiGLCommon : NSObject

+ (GLKVector2)convertPointLUtoGLWithPoint:(GLKVector2)point viewSize:(GLKVector2)viewSize;
+ (void)makeVertexArray:(GLKVector2 *)array
			   position:(GLKVector2)position
				   size:(GLKVector2)size
			   viewSize:(GLKVector2)viewSize;

@end
