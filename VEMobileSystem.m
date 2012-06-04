//
//  VEMobileSystem.m
//  https://github.com/abrahamvegh/VEMobileSystem
//

#import "VEMobileSystem.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation VEMobileSystem

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

- (NSString *) version
{
	return UIDevice.currentDevice.systemVersion;
}

- (NSString *) uuid
{
	NSUserDefaults *d = [NSUserDefaults standardUserDefaults];

	if ([d objectForKey: kVEMobileSystemUUIDKey] == nil)
	{
		NSString *uuidString = nil;
		CFUUIDRef uuid = CFUUIDCreate(NULL);

		if (uuid)
		{
			uuidString = (NSString *) CFUUIDCreateString(NULL, uuid);

			CFRelease(uuid);
		}

		[d setObject: uuidString forKey: kVEMobileSystemUUIDKey];
		[d synchronize];
	}

	return [d stringForKey: kVEMobileSystemUUIDKey];
}

@end
