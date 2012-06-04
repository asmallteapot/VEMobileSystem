//
//  VEMobileSystem.h
//  https://github.com/abrahamvegh/VEMobileSystem
//

#import <UIKit/UIKit.h>

extern NSString * const kVEMobileSystemUUIDKey;

@interface UIDevice (VEMobileSystem)
@property (nonatomic, readonly) NSString *platform;
@property (nonatomic, readonly) NSString *uuid;
@end


