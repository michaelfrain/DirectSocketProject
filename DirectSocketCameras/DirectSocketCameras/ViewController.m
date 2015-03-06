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

@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *pullSendButtons;

@property (nonatomic, weak) IBOutlet UIButton *buttonPullVideo;
@property (nonatomic, weak) IBOutlet UIButton *buttonSendVideo;
@property (nonatomic, weak) IBOutlet UIButton *buttonPullPhoto;
@property (nonatomic, weak) IBOutlet UIButton *buttonSendPhoto;
@property (nonatomic, weak) IBOutlet UIButton *buttonPullJSON;
@property (nonatomic, weak) IBOutlet UIButton *buttonSendJSON;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.socket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    dispatch_queue_t main = dispatch_get_main_queue();
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:main];
//    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:main];
//    self.socket.delegate = self;
}

- (IBAction)connect:(id)sender {
    NSError *error;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:self.textPort.text];
    BOOL connection = [self.socket connectToHost:self.textHostname.text onPort:number.integerValue error:&error];
    if (connection) {
        for (UIButton *button in self.pullSendButtons) {
            self.labelConnectedServer.text = [NSString stringWithFormat:@"Connected to server %@ on port %li", self.textHostname.text, (long)number.integerValue];
            button.enabled = YES;
        }
    }
}

- (IBAction)pullItem:(UIButton *)sender {
    if ([sender isEqual:self.buttonPullVideo]) {
        
    }
    
    if ([sender isEqual:self.buttonPullPhoto]) {
        
    }
    
    if ([sender isEqual:self.buttonPullJSON]) {
        
    }
}

- (IBAction)sendItem:(UIButton *)sender {
    if ([sender isEqual:self.buttonSendVideo]) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *filePath = [bundle pathForResource:@"229-x6hu" ofType:@"mp4"];
        NSData *video = [[NSData alloc] initWithContentsOfFile:filePath];
        self.dataLength = video.length;
        
        [self.socket writeData:video withTimeout:-1 tag:1];
        
//        BOOL dataSend = [self.socket sendData:video withTimeout:15 tag:135];
    }
    
    if ([sender isEqual:self.buttonSendPhoto]) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *filePath = [bundle pathForResource:@"CatPhoto" ofType:@"jpg"];
        NSData *photo = [[NSData alloc] initWithContentsOfFile:filePath];
        self.dataLength = photo.length;
        
        [self.socket writeData:photo withTimeout:-1 tag:2];
    }
    
    if ([sender isEqual:self.buttonSendJSON]) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *filePath = [bundle pathForResource:@"Twitter" ofType:@"json"];
        NSData *json = [[NSData alloc] initWithContentsOfFile:filePath];
        self.dataLength = json.length;
        
        [self.socket writeData:json withTimeout:-1 tag:3];
//        BOOL dataSend = [self.socket sendData:json withTimeout:15 tag:246];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AsyncSocketDelegate methods

//- (void)onUdpSocket:(AsyncUdpSocket *)sock didSendDataWithTag:(long)tag {
//    NSLog(@"Data sent.");
//}
//
//- (void)onUdpSocket:(AsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error {
//    NSLog(@"Data not sent: %@", error);
//}

//- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
//    self.labelConnectedServer.text = [NSString stringWithFormat:@"Connected to server %@ on port %hu", host, port];
//}

//- (BOOL)onSocketWillConnect:(AsyncSocket *)sock
//{
//    NSLog(@"%@", [sock description]);
//    return YES;
//}
//#pragma mark - GCDAsyncSocketDelegate methods

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    self.labelConnectedServer.text = [NSString stringWithFormat:@"Connected to server %@ on port %hu", host, port];
    
    [self.socket readDataWithTimeout:-1 tag:1];
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    self.labelConnectedServer.text = [NSString stringWithFormat:@"Sent %lu bytes of data.", self.dataLength];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    self.labelConnectedServer.text = [NSString stringWithFormat:@"Received %lu bytes of data.", (unsigned long)data.length];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    self.labelConnectedServer.text = [NSString stringWithFormat:@"Error: Socket disconnected. %@", err.localizedDescription];
    NSLog(@"We've got an error: %@", err);
}

@end
