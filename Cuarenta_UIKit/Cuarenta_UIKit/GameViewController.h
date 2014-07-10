//
//  GameViewController.h
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/10/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@class GameViewController;

@protocol GameViewControllerDelegate <NSObject>

- (void)gameViewController:(GameViewController *)controller didQuitWithReason:(QuitReason)reason;

@end

@interface GameViewController : UIViewController <UIAlertViewDelegate, GameDelegate>

@property (nonatomic, weak) id <GameViewControllerDelegate> delegate;
@property (nonatomic, strong) Game *game;

@property ()

@end