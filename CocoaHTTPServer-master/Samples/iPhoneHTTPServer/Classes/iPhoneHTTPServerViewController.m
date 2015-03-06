#import "iPhoneHTTPServerViewController.h"
#import "iPhoneHTTPServerAppDelegate.h"

@interface iPhoneHTTPServerViewController()

- (IBAction)refreshInfo:(id)sender;

@end

@implementation iPhoneHTTPServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)refreshInfo:(id)sender {
//    [self.currentServer setNewDelegate:self];
    self.labelServerName.text = [NSString stringWithFormat:@"%@.%@", [self.currentServer name], [self.currentServer domain]];
    self.labelPort.text = [NSString stringWithFormat:@"%hu", [self.currentServer listeningPort]];
    self.labelNumberOfConnections.text = [NSString stringWithFormat:@"%i", [self.currentServer numberOfHTTPConnections]];
    if ([self.currentServer numberOfHTTPConnections] > 0) {
        
    }
}

@end
