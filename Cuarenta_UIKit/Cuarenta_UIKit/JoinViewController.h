//
//  JoinViewController.h
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchmakingClient.h"

@interface JoinViewController : UIViewController<UITextFieldDelegate, MatchmakingClientDelegate>

- (void)joinViewController:(JoinViewController *)controller didDisconnectWithReason:(QuitReason)reason;

@end
