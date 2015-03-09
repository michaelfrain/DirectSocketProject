//
//  ViewController.h
//  DirectSocketCameras
//
//  Created by Michael Frain on 3/4/15.
//  Copyright (c) 2015 Michael Frain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"
//#import "AsyncSocket.h"
//#import "AsyncUdpSocket.h"

@interface ViewController : UIViewController<GCDAsyncSocketDelegate, UITextFieldDelegate>

@property (nonatomic, strong) GCDAsyncSocket *socket;
//@property (nonatomic, strong) AsyncSocket *socket;
//@property (nonatomic, strong) AsyncUdpSocket *socket;

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property NSUInteger dataLength;

@end

