//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/14/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardMatching2.h"
#import "PlayingCardMatching3.h"

@implementation PlayingCardDeck

-(id) initWithPlayingCardMatching2 {
    self = [super init];
    if(self){
        for (int rank = 1; rank <= [PlayingCard getMaxRank]; rank++) {
            for (NSString * suit in [PlayingCard getAllSuits]) {
                PlayingCardMatching2 * card = [[PlayingCardMatching2 alloc] init];
                [card setRank:rank];
                [card setSuit: suit];
                [self addCard: card
                        atTop:YES];
            }
        }
    }
    return self;
}

-(id) initWithPlayingCardMatching3 {
    self = [super init];
    if(self){
        for (int rank = 1; rank <= [PlayingCard getMaxRank]; rank++) {
            for (NSString * suit in [PlayingCard getAllSuits]) {
                PlayingCardMatching3 * card = [[PlayingCardMatching3 alloc] init];
                [card setRank:rank];
                [card setSuit: suit];
                [self addCard: card
                        atTop:YES];
            }
        }
    }
    return self;
}

@end
