#import <UIKit/UIKit.h>
#import "HTTPServer.h"
#import "GCDAsyncSocket.h"
#import "HTTPConnection.h"


@interface iPhoneHTTPServerViewController : UIViewController<GCDAsyncSocketDelegate> {

}

@property (nonatomic, weak) IBOutlet UILabel *labelPort;
@property (nonatomic, weak) IBOutlet UILabel *labelServerName;
@property (nonatomic, weak) IBOutlet UILabel *labelNumberOfConnections;
@property (nonatomic, strong) HTTPServer *currentServer;
@property (nonatomic, strong) GCDAsyncSocket *acceptedSocket;
@property (nonatomic, strong) HTTPConfig *currentConfig;
@property (nonatomic, strong) HTTPConnection *connection;

@end

