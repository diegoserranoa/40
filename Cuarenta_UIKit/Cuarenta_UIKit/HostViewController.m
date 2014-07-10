//
//  HostViewController.m
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "HostViewController.h"
#import "MatchmakingServer.h"

// The name of the GameKit session.
#define SESSION_ID @"Snap!"

@interface HostViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation HostViewController{
    MatchmakingServer *matchmakingServer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
	if (matchmakingServer == nil)
	{
		matchmakingServer = [[MatchmakingServer alloc] init];
		matchmakingServer.maxClients = 3;
		[matchmakingServer startAcceptingConnectionsForSessionID:SESSION_ID];
        
		self.nameTextField.placeholder = matchmakingServer.session.displayName;
        /* reload Data
        NSMutableDictionary* userInfo = [NSMutableDictionary dictionary];
        [userInfo setObject:sucursales forKey:@"sucursales"];
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:@"ReloadSucursales" object:self userInfo:userInfo];
		*/
        //[xºself.tableView reloadData];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.nameTextField action:@selector(resignFirstResponder)];
	gestureRecognizer.cancelsTouchesInView = NO;
	[self.view addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAction:(UIButton *)sender {

}

- (IBAction)exitAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return NO;
}

@end
