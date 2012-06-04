//
//  VEMobileSystem.h
//  https://github.com/abrahamvegh/VEMobileSystem
//

#import <UIKit/UIKit.h>

@interface VEMobileSystem : NSObject
{
}

@property (nonatomic, readonly) NSString *platform;
@property (nonatomic, readonly) NSString *version;
@property (nonatomic, readonly) NSString *uuid;

@end

#define kVEMobileSystemUUIDKey @"VE_MobileSystem_UUID"
