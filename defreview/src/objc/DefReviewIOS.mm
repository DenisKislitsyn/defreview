#include <dmsdk/sdk.h>

#if defined(DM_PLATFORM_IOS)
#include "DefReviewIOS.h"
#include <StoreKit/StoreKit.h>

NSString *minVersion = @"10.3";
NSString *openAppStoreVersion = @"13.0";

bool DefReview_isSupported() {
    BOOL status = NO;
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(minVersion)){
        status = YES;
    }
    return status == YES;
}

void DefReview_requestReview() {
	if (DefReview_isSupported()) {
	    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(openAppStoreVersion)) {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/app/id1458095497?action=write-review"]];
        } else {
			[SKStoreReviewController requestReview];
        }
    }
}
#endif
