//
//  LoadingViewController.h
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingViewController : UIViewController

@property (weak, nonatomic) GKSession * session;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *peerID;

@end
