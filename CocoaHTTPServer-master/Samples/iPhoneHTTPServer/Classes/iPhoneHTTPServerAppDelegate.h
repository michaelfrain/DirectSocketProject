#import <UIKit/UIKit.h>

@class iPhoneHTTPServerViewController;
@class HTTPServer;
@class HTTPConfig;
@class HTTPConnection;

@interface iPhoneHTTPServerAppDelegate : NSObject <UIApplicationDelegate>
{
	HTTPServer *httpServer;
	
	UIWindow *window;
	iPhoneHTTPServerViewController *viewController;
    
    HTTPConfig *currentConfig;
    HTTPConnection *connection;
    
}

@property (nonatomic) IBOutlet UIWindow *window;
@property (nonatomic) IBOutlet iPhoneHTTPServerViewController *viewController;

@end

