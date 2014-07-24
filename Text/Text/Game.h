//
//  Game.h
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

#import "Player.h"

@class Game;

@protocol GameDelegate <NSObject>

- (void)gameDidBegin:(Game *)game;
- (void)gameShouldDealCards:(Game *)game startingWithPlayer:(Player *)startingPlayer;
- (void)game:(Game *)game didActivatePlayer:(Player *)player;
- (void)game:(Game *)game player:(Player *)player turnedOverCard:(Card *)card;

@end

@interface Game : NSObject

@property (nonatomic, weak) id <GameDelegate> delegate;

- (Player *)playerAtPosition:(PlayerPosition)position;
- (void)beginRound;
- (Player *)activePlayer;
- (void)turnCardForPlayerAtBottom;

