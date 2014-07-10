//
//  LoadingViewController.m
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "LoadingViewController.h"
#import "GameViewController.h"
#import "Game.h"

@interface LoadingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@end

@implementation LoadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     GameViewController *gameViewController = (GameViewController *)[segue destinationViewController];
     
     Game *game = [[Game alloc] init];
     gameViewController.game = game;
     game.delegate = gameViewController;
}

- (IBAction)exitAction:(UIButton *)sender {
    // kill connection
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"QuitReasonUserQuit" object:self];
    }];
}

@end
