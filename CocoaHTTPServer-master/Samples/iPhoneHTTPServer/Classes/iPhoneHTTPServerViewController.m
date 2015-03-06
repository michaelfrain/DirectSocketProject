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
    self.labelServerName.text = [self.currentServer domain];
    self.labelPort.text = [NSString stringWithFormat:@"%hu", [self.currentServer listeningPort]];
}

@end
