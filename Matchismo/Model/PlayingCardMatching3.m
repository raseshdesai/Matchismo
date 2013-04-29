//
//  PlayingCardMatching3.m
//  Matchismo
//
//  Created by Dhwani Desai on 4/29/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "PlayingCardMatching3.h"

@implementation PlayingCardMatching3

//overriding the match defined in super class Card for 3 Card Mode
-(int) match:(NSArray *)otherCards{
    int score = 0;
    
    if (otherCards.count == 2) {
        id objectInArray = [otherCards lastObject];
        if ([objectInArray isKindOfClass:[PlayingCard class]]) {
            PlayingCard * otherCard = (PlayingCard *) objectInArray;
            if (self.rank == otherCard.rank) {
                score = 4;
            } else if ([self.suit isEqualToString: otherCard.suit]) {
                score = 1;
            }
        }
    }
    
    return score;
}

@end
