//
//  VEMobileSystem.m
//  https://github.com/abrahamvegh/VEMobileSystem
//

#import "UIDevice+VEMobileSystem.h"
#include <sys/types.h>
#include <sys/sysctl.h>

NSString * const kVEMobileSystemUUIDKey = @"VE_MobileSystem_UUID";

@implementation UIDevice (VEMobileSystem)

- (NSString *) platform
{
	size_t size;

	sysctlbyname("hw.machine", NULL, &size, NULL, 0);

	char *machine = malloc(size);

	sysctlbyname("hw.machine", machine, &size, NULL, 0);

	NSString *_platform = [NSString stringWithUTF8String: machine];

	free(machine);

	return _platform;
}

- (NSString *) anonymousUniqueIdentifier
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

	if ([defaults objectForKey: kVEMobileSystemUUIDKey] == nil)
	{
		NSString *uuidString = nil;
		CFUUIDRef uuid = CFUUIDCreate(NULL);

		if (uuid)
		{
			uuidString = (NSString *) CFUUIDCreateString(NULL, uuid);

			CFRelease(uuid);
		}

		[defaults setObject: uuidString forKey: kVEMobileSystemUUIDKey];
		[defaults synchronize];
	}

	return [defaults stringForKey: kVEMobileSystemUUIDKey];
}

@end
