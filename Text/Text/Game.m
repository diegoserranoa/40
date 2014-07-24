//
//  Game.m
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "Game.h"
#import "Card.h"
#import "Deck.h"
#import "Player.h"
#import "Stack.h"

@implementation Game
{
    NSMutableDictionary *_players;
    PlayerPosition _startingPlayerPosition;
	PlayerPosition _activePlayerPosition;
}

- (id)init
{
	if ((self = [super init]))
	{
		_players = [NSMutableDictionary dictionaryWithCapacity:4];
        _startingPlayerPosition = 0;
        _activePlayerPosition = 1;
        
        Player *player1 = [[Player alloc] init];
		player1.name = @"Diego";
		[_players setObject:player1 forKey:@"Player1"];
        
        
        Player *player2 = [[Player alloc] init];
		player2.name = @"Alguien";
		[_players setObject:player2 forKey:@"Player2"];
        
        
        [self beginGame];
	}
	return self;
}

- (void)beginGame
{
    [self dealCards];
}

- (Player *)playerAtPosition:(PlayerPosition)position
{
	NSAssert(position >= PlayerPositionBottom && position <= PlayerPositionRight, @"Invalid player position");
    
	__block Player *player;
	[_players enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
     {
         player = obj;
         if (player.position == position)
             *stop = YES;
         else
             player = nil;
     }];
    
	return player;
}

- (void)dealCards
{
	Deck *deck = [[Deck alloc] init];
	[deck shuffle];
    
	while ([deck cardsRemaining] > 0)
	{
		for (PlayerPosition p = _startingPlayerPosition; p < _startingPlayerPosition + 4; ++p)
		{
			Player *player = [self playerAtPosition:(p % 4)];
			if (player != nil && [deck cardsRemaining] > 0)
			{
				Card *card = [deck draw];
				NSLog(@"player at position %d should get card %@", player.position, card);
			}
		}
	}
}

- (Player *)activePlayer
{
	return [self playerAtPosition:_activePlayerPosition];
}

@end
