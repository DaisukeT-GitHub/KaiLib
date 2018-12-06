#import "KaiGL.h"

typedef NS_ENUM(int, KaiGLShaderInputType)
{
    KaiGLShaderInputTypeNone = 0,
    KaiGLShaderInputTypeTextureSlot,
    KaiGLShaderInputTypeFloat,
    KaiGLShaderInputTypeVector2,
    KaiGLShaderInputTypeVector3,
    KaiGLShaderInputTypeVector4,
    KaiGLShaderInputTypeMatrix2,
    KaiGLShaderInputTypeMatrix3,
    KaiGLShaderInputTypeMatrix4,
};

/**
 * @brief Shader への入力クラス
 */
@interface KaiGLShaderInput : NSObject
- (id)initWithTextureUnit:(int)unit;
- (id)initWithFloat:(float)floatValue;
- (id)initWithVector2:(GLKVector2)vector2;
- (id)initWithVector3:(GLKVector3)vector3;
- (id)initWithVector4:(GLKVector4)vector4;
- (id)initWithMatrix2:(GLKMatrix2)matrix2;
- (id)initWithMatrix3:(GLKMatrix3)matrix3;
- (id)initWithMatrix4:(GLKMatrix4)matrix4;

- (KaiGLShaderInputType)type;

- (int)textureUnitValue;
- (float)floatValue;
- (GLKVector2)vector2Value;
- (GLKVector3)vector3Value;
- (GLKVector4)vector4Value;
- (GLKMatrix2)matrix2Value;
- (GLKMatrix3)matrix3Value;
- (GLKMatrix4)matrix4Value;
@end
