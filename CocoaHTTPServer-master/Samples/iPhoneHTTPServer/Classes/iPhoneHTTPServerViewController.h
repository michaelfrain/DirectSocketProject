#import <UIKit/UIKit.h>
#import "HTTPServer.h"
#import "GCDAsyncSocket.h"


@interface iPhoneHTTPServerViewController : UIViewController<GCDAsyncSocketDelegate> {

}

@property (nonatomic, weak) IBOutlet UILabel *labelPort;
@property (nonatomic, weak) IBOutlet UILabel *labelServerName;
@property (nonatomic, weak) IBOutlet UILabel *labelNumberOfConnections;
@property (nonatomic, strong) HTTPServer *currentServer;
@property (nonatomic, strong) GCDAsyncSocket *acceptedSocket;

@end

