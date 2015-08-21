static BOOL isEnabled = YES;
static CGFloat customAlpha = 1.f;

@interface PHVideoCallVideoGroupView : UIView
@end

static PHVideoCallVideoGroupView* videoGroupView = nil;

#define appID CFSTR("com.sassoty.ftfacewindowopacity")

static void reloadPrefs() {
	CFPreferencesAppSynchronize(appID);
	CFPropertyListRef customAlphaRef = CFPreferencesCopyAppValue(CFSTR("CustomAlpha"), appID);
	customAlpha = (customAlphaRef ? [(__bridge NSNumber*)customAlphaRef floatValue] : 1.f);
	Boolean exists = NO;
	Boolean isEnabledRef = CFPreferencesGetAppBooleanValue(CFSTR("Enabled"), appID, &exists);
	isEnabled = (exists ? isEnabledRef : YES);
	// Update alpha
	if(isEnabled && videoGroupView) {
		NSLog(@"[FTFaceWindowOpacity] updating opacity %f", customAlpha);
		[UIView animateWithDuration:0.2 animations:^{
			videoGroupView.alpha = customAlpha;
		}];
	}
}

%hook PHVideoCallVideoGroupView

- (id)initWithFrame:(CGRect)frame {
	videoGroupView = %orig;
	if(isEnabled) {
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
			[UIView animateWithDuration:0.2 animations:^{
				self.alpha = customAlpha;
			}];
		});
	}
	return videoGroupView;
}

%end

%ctor {
	reloadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL,
        (CFNotificationCallback)reloadPrefs,
        CFSTR("com.sassoty.ftfacewindowopacity.prefschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}