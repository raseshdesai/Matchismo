//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Rasesh Desai on 4/20/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(id) initWithCardCount: (NSUInteger) cardCount
              usingDeck: (Deck *) deck;

-(Card *) cardAtIndex: (NSUInteger) index;

-(void) flipCardAtIndex: (NSUInteger) index;

//TODO (low priority): see if we can again get to a point where score can be readonly here
@property (nonatomic, readwrite) int score;
@property (strong, nonatomic) NSString * lastActionMsg;
@property (strong, nonatomic) NSMutableArray * cards;

@end
