//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/14/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(id) init {
        self = [super init];
        if(self){
            for (int rank = 1; rank <= [PlayingCard getMaxRank]; rank++) {
                for (NSString * suit in [PlayingCard getAllSuits]) {
                    PlayingCard * card = [[PlayingCard alloc] init];
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
