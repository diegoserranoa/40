//
//  Deck.h
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

@class Card;

@interface Deck : NSObject

- (void)shuffle;
- (Card *)draw;
- (int)cardsRemaining;

@end