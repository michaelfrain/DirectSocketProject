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
@property (nonatomic, weak) IBOutlet UILabel *labelConnectedServer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:NULL];
    self.socket.delegate = self;
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
    self.labelConnectedServer.text = [NSString stringWithFormat:@"Connected to server %@ on port %hu", host, port];
}
@end
