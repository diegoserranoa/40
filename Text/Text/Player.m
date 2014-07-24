//
//  Player.m
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "Player.h"
#import "Card.h"
#import "Stack.h"

@implementation Player

- (id)init
{
	if ((self = [super init]))
	{
		_closedCards = [[Stack alloc] init];
		_openCards = [[Stack alloc] init];
	}
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ name = %@, position = %d", [super description], self.name, self.position];
}

- (Card *)turnOverTopCard
{
	NSAssert([self.closedCards cardCount] > 0, @"No more cards");
    
	Card *card = [self.closedCards topmostCard];
	card.isTurnedOver = YES;
	[self.openCards addCardToTop:card];
	[self.closedCards removeTopmostCard];
    
	return card;
}

@end
