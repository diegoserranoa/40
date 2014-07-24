//
//  Stack.m
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "Stack.h"
#import "Card.h"

@implementation Stack
{
	NSMutableArray *_cards;
}

- (id)init
{
	if ((self = [super init]))
	{
		_cards = [NSMutableArray arrayWithCapacity:26];
	}
	return self;
}

- (void)addCardToTop:(Card *)card
{
	NSAssert(card != nil, @"Card cannot be nil");
	NSAssert([_cards indexOfObject:card] == NSNotFound, @"Already have this Card");
	[_cards addObject:card];
}

- (NSUInteger)cardCount
{
	return [_cards count];
}

- (NSArray *)array
{
	return [_cards copy];
}

- (Card *)cardAtIndex:(NSUInteger)index
{
	return [_cards objectAtIndex:index];
}

- (void)addCardsFromArray:(NSArray *)array
{
	_cards = [array mutableCopy];
}

- (Card *)topmostCard
{
	return [_cards lastObject];
}

- (void)removeTopmostCard
{
	[_cards removeLastObject];
}

@end
