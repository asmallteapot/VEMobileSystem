//
//  VEMobileSystem.h
//  https://github.com/abrahamvegh/VEMobileSystem
//

#import <UIKit/UIKit.h>

extern NSString * const kVEMobileSystemUUIDKey;

@interface VEMobileSystem : NSObject
@property (nonatomic, readonly) NSString *platform;
@property (nonatomic, readonly) NSString *version;
@property (nonatomic, readonly) NSString *uuid;
@end


