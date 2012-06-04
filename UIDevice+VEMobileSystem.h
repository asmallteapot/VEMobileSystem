//
//  VEMobileSystem.h
//  https://github.com/abrahamvegh/VEMobileSystem
//

#import <UIKit/UIKit.h>

extern NSString * const kVEMobileSystemUUIDKey;

@interface UIDevice (VEMobileSystem)

// A string containing the current device type and version (e.g., iPhone1,1)
@property (nonatomic, readonly) NSString *platform;

// An anonymous unique identifier stored in the user defaults
@property (nonatomic, readonly) NSString *anonymousIdentifier;

@end


