//
//  Player.h
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

typedef enum
{
	PlayerPositionBottom,  // the user
	PlayerPositionLeft,
	PlayerPositionTop,
	PlayerPositionRight
}
PlayerPosition;

@class Card;
@class Stack;

@interface Player : NSObject

@property (nonatomic, assign) PlayerPosition position;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int gamesWon;
@property (nonatomic, strong, readonly) Stack *closedCards;
@property (nonatomic, strong, readonly) Stack *openCards;

- (Card *)turnOverTopCard;

@end
