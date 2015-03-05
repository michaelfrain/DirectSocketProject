#import <UIKit/UIKit.h>
#import "HTTPServer.h"


@interface iPhoneHTTPServerViewController : UIViewController {

}

@property (nonatomic, weak) IBOutlet UILabel *labelPort;
@property (nonatomic, weak) IBOutlet UILabel *labelServerName;
@property (nonatomic, strong) HTTPServer *currentServer;

@end

