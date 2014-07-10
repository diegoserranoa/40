//
//  CuarentaAppDelegate.h
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCManager.h"

@interface CuarentaAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MCManager *mcManager;

@end
