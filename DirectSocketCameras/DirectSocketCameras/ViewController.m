//
//  ViewController.m
//  DirectSocketCameras
//
//  Created by Michael Frain on 3/4/15.
//  Copyright (c) 2015 Michael Frain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textPort;
@property (nonatomic, weak) IBOutlet UITextField *textHostname;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:NULL];
}

- (IBAction)connect:(id)sender {
    NSError *error;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [self.socket connectToHost:self.textHostname.text onPort:[formatter numberFromString:self.textPort.text].integerValue error:&error];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GCDAsyncSocketDelegate methods

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    
}
@end
