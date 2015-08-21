#import <Preferences/Preferences.h>

@interface FTFaceWindowOpacityListController: PSListController {
}
@end

@implementation FTFaceWindowOpacityListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FTFaceWindowOpacity" target:self] retain];
	}
	return _specifiers;
}
- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/Sassoty"]];
}
@end

// vim:ft=objc
