//
//  Card.m
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithSuit:(Suit)suit value:(int)value
{
	NSAssert(value >= CardAce && value <= CardKing, @"Invalid card value");
    
	if ((self = [super init]))
	{
		_suit = suit;
		_value = value;
	}
	return self;
}

@end
