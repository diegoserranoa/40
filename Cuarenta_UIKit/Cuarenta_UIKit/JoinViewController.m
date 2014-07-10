//
//  JoinViewController.m
//  Cuarenta_UIKit
//
//  Created by Brounie on 7/7/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "JoinViewController.h"

@interface JoinViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIView *tableContainer;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation JoinViewController
{
	MatchmakingClient *matchmakingClient;
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
    
	if (matchmakingClient == nil)
	{
		matchmakingClient = [[MatchmakingClient alloc] init];
        matchmakingClient.delegate = self;
		[matchmakingClient startSearchingForServersWithSessionID:SESSION_ID];
        
		self.nameTextField.placeholder = matchmakingClient.session.displayName;
        [self reloadData];
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

- (IBAction)exitAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)reloadData
{
    // reload Data
    NSMutableDictionary* userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:matchmakingClient forKey:@"matchmakingClient"];
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"ReloadJoin" object:self userInfo:userInfo];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return NO;
}

#pragma mark - MatchmakingClientDelegate

- (void)matchmakingClient:(MatchmakingClient *)client serverBecameAvailable:(NSString *)peerID
{
    // Reload Data
	[self reloadData];
}

- (void)matchmakingClient:(MatchmakingClient *)client serverBecameUnavailable:(NSString *)peerID
{
    // Reload Data
	[self reloadData];
}

@end
