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

-(void) flipCardAtIndex: (NSUInteger) index;

-(Card *) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) int score;
@property (strong, nonatomic) NSString * lastActionMsg;

@end
