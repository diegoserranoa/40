//
//  Stack.h
//  Text
//
//  Created by Brounie on 7/24/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//

@class Card;

@interface Stack : NSObject

- (void)addCardToTop:(Card *)card;
- (NSUInteger)cardCount;
- (NSArray *)array;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)addCardsFromArray:(NSArray *)array;
- (Card *)topmostCard;
- (void)removeTopmostCard;

@end
