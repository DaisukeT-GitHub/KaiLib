#import "KaiGLShaderInput.h"

@implementation KaiGLShaderInput
{
    KaiGLShaderInputType _type;
    
    union
    {
        int textureUnit;
        float floatValue;
        GLKVector2 vector2;
        GLKVector3 vector3;
        GLKVector4 vector4;
        GLKMatrix2 matrix2;
        GLKMatrix3 matrix3;
        GLKMatrix4 matrix4;
    }primitive;
}
- (KaiGLShaderInputType)type
{
    return _type;
}
- (id)initWithTextureUnit:(int)unit
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeTextureSlot;
        primitive.textureUnit = unit;
    }
    return self;
}
- (id)initWithFloat:(float)floatValue
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeFloat;
        primitive.floatValue = floatValue;
    }
    return self;
}
- (id)initWithVector2:(GLKVector2)vector2
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeVector2;
        primitive.vector2 = vector2;
    }
    return self;
}
- (id)initWithVector3:(GLKVector3)vector3
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeVector3;
        primitive.vector3 = vector3;
    }
    return self;
}
- (id)initWithVector4:(GLKVector4)vector4
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeVector4;
        primitive.vector4 = vector4;
    }
    return self;
}
- (id)initWithMatrix2:(GLKMatrix2)matrix2
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeMatrix2;
        primitive.matrix2 = matrix2;
    }
    return self;
}
- (id)initWithMatrix3:(GLKMatrix3)matrix3
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeMatrix3;
        primitive.matrix3 = matrix3;
    }
    return self;
}
- (id)initWithMatrix4:(GLKMatrix4)matrix4
{
    if(self = [super init])
    {
        _type = KaiGLShaderInputTypeMatrix4;
        primitive.matrix4 = matrix4;
    }
    return self;
}

- (int)textureUnitValue
{
    return _type == KaiGLShaderInputTypeTextureSlot? primitive.textureUnit : 0;
}
- (float)floatValue
{
    return _type == KaiGLShaderInputTypeFloat? primitive.floatValue : 0.0f;
}
- (GLKVector2)vector2Value
{
    return _type == KaiGLShaderInputTypeVector2? primitive.vector2 : GLKVector2Make(0, 0);
}
- (GLKVector3)vector3Value
{
    return _type == KaiGLShaderInputTypeVector3? primitive.vector3 : GLKVector3Make(0, 0, 0);
}
- (GLKVector4)vector4Value
{
    return _type == KaiGLShaderInputTypeVector4? primitive.vector4 : GLKVector4Make(0, 0, 0, 0);
}
- (GLKMatrix2)matrix2Value
{
    return _type == KaiGLShaderInputTypeMatrix2? primitive.matrix2 : (GLKMatrix2){1, 0, 0, 1};
}
- (GLKMatrix3)matrix3Value
{
    return _type == KaiGLShaderInputTypeMatrix3? primitive.matrix3 : GLKMatrix3Identity;
}
- (GLKMatrix4)matrix4Value
{
    return _type == KaiGLShaderInputTypeMatrix4? primitive.matrix4 : GLKMatrix4Identity;
}
@end
