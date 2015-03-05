//
//  ViewController.h
//  DirectSocketCameras
//
//  Created by Michael Frain on 3/4/15.
//  Copyright (c) 2015 Michael Frain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

@interface ViewController : UIViewController<GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *socket;

@end

