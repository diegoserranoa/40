//
//  ViewController.m
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bottomPlayerCardOne;
@property (weak, nonatomic) IBOutlet UILabel *bottomPlayerCardTwo;
@property (weak, nonatomic) IBOutlet UILabel *bottomPlayerCardThree;
@property (weak, nonatomic) IBOutlet UILabel *bottomPlayerCardFour;
@property (weak, nonatomic) IBOutlet UILabel *bottomPlayerCardFive;

@property (weak, nonatomic) IBOutlet UILabel *topPlayerCardOne;
@property (weak, nonatomic) IBOutlet UILabel *topPlayerCardTwo;
@property (weak, nonatomic) IBOutlet UILabel *topPlayerCardThree;
@property (weak, nonatomic) IBOutlet UILabel *topPlayerCardFour;
@property (weak, nonatomic) IBOutlet UILabel *topPlayerCardFive;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _game = [[Game alloc] init];
    
    [_game.]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
