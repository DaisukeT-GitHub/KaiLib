//
//  KaiImage.m
//  KaiLib
//

#import "KaiImage.h"



@implementation KaiImage

/**
 * @brief UIImage -> RGBA8Bitmap へ変換する
 */
+ (unsigned char *) convertUIImageToBitmapRGBA8:(UIImage *) image {
	
	CGImageRef imageRef = image.CGImage;
	
	// Create a bitmap context to draw the uiimage into
	CGContextRef context = [self newBitmapRGBA8ContextFromImage:imageRef];
	
	if(!context) {
		return NULL;
	}
	
	size_t width = CGImageGetWidth(imageRef);
	size_t height = CGImageGetHeight(imageRef);
	
	CGRect rect = CGRectMake(0, 0, width, height);
	
	// Draw image into the context to get the raw image data
	CGContextDrawImage(context, rect, imageRef);
	
	// Get a pointer to the data
	unsigned char *bitmapData = (unsigned char *)CGBitmapContextGetData(context);
	
	// Copy the data and release the memory (return memory allocated with new)
	size_t bytesPerRow = CGBitmapContextGetBytesPerRow(context);
	size_t bufferLength = bytesPerRow * height;
	
	unsigned char *newBitmap = NULL;
	
	if(bitmapData) {
		newBitmap = (unsigned char *)malloc(sizeof(unsigned char) * bytesPerRow * height);
		
		if(newBitmap) {	// Copy the data
			// memcpy で高速化?
			for(int i = 0; i < bufferLength; ++i) {
				newBitmap[i] = bitmapData[i];
			}
		}

		KAI_SAFEFREE(bitmapData);
	} else {
		KaiLogErr(@"Error getting bitmap pixel data");
	}
	
	CGContextRelease(context);
	
	return newBitmap;
}

/**
 * @brief ImageRef から Context を作成する
 */
+ (CGContextRef) newBitmapRGBA8ContextFromImage:(CGImageRef) image {
	CGContextRef context = NULL;
	CGColorSpaceRef colorSpace;
	uint32_t *bitmapData;
	
	size_t bitsPerPixel = 32;
	size_t bitsPerComponent = 8;
	size_t bytesPerPixel = bitsPerPixel / bitsPerComponent;
	
	size_t width = CGImageGetWidth(image);
	size_t height = CGImageGetHeight(image);
	
	size_t bytesPerRow = width * bytesPerPixel;
	size_t bufferLength = bytesPerRow * height;
	
	colorSpace = CGColorSpaceCreateDeviceRGB();
	
	if(!colorSpace) {
		KaiLogErr(@"Error allocating color space RGB");
		return NULL;
	}
	
	// Allocate memory for image data
	bitmapData = (uint32_t *)malloc(bufferLength);
	
	if(!bitmapData) {
		KaiLogErr(@"Error allocating memory for bitmap");
		CGColorSpaceRelease(colorSpace);
		return NULL;
	}
	
	// Create bitmap context
	context = CGBitmapContextCreate(bitmapData,
									width,
									height,
									bitsPerComponent,
									bytesPerRow,
									colorSpace,
                                    kCGBitmapByteOrderDefault);	// RGBA
	
	if(!context) {
		KAI_SAFEFREE(bitmapData);
		KaiLogErr(@"Bitmap context not created");
	}
	
	CGColorSpaceRelease(colorSpace);
	
	return context;
}

/**
 * @brief RGBA8Bitmap -> UIImage へ変換する
 */
+ (UIImage *) convertBitmapRGBA8ToUIImage:(unsigned char *) buffer
								withWidth:(int) width
							   withHeight:(int) height {
	
	
	size_t bufferLength = width * height * 4;
	CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer, bufferLength, NULL);
	size_t bitsPerComponent = 8;
	size_t bitsPerPixel = 32;
	size_t bytesPerRow = 4 * width;
	
	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
	if(colorSpaceRef == NULL) {
		KaiLogErr(@"Error allocating color space");
		CGDataProviderRelease(provider);
		return nil;
	}
	CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
	CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
	
	CGImageRef iref = CGImageCreate(width,
									height,
									bitsPerComponent,
									bitsPerPixel,
									bytesPerRow,
									colorSpaceRef,
									bitmapInfo,
									provider,	// data provider
									NULL,		// decode
									YES,			// should interpolate
									renderingIntent);
	
	uint32_t* pixels = (uint32_t*)malloc(bufferLength);
	
	if(pixels == NULL) {
		KaiLogErr(@"Error: Memory not allocated for bitmap");
		CGDataProviderRelease(provider);
		CGColorSpaceRelease(colorSpaceRef);
		CGImageRelease(iref);
		return nil;
	}
	
	CGContextRef context = CGBitmapContextCreate(pixels,
												 width,
												 height,
												 bitsPerComponent,
												 bytesPerRow,
												 colorSpaceRef,
                                                 bitmapInfo);
	
	if(context == NULL) {
		KaiLogErr(@"Error context not created");
		CGDataProviderRelease(provider);
		CGColorSpaceRelease(colorSpaceRef);
		CGImageRelease(iref);
		KAI_SAFEFREE(pixels);
		return nil;
	}
	
	UIImage *image = nil;
	if(context) {
		
		CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, width, height), iref);
		
		CGImageRef imageRef = CGBitmapContextCreateImage(context);
		
		// Support both iPad 3.2 and iPhone 4 Retina displays with the correct scale
		if([UIImage respondsToSelector:@selector(imageWithCGImage:scale:orientation:)]) {
			float scale = [[UIScreen mainScreen] scale];
			image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
		} else {
			image = [UIImage imageWithCGImage:imageRef];
		}
		
		CGImageRelease(imageRef);
		CGContextRelease(context);
	}
	
	CGColorSpaceRelease(colorSpaceRef);
	CGImageRelease(iref);
	CGDataProviderRelease(provider);
	
	KAI_SAFEFREE(pixels);

	return image;
}

@end
