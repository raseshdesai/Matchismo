//
//  PlayingCardMatching2.m
//  Matchismo
//
//  Created by Dhwani Desai on 4/29/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "PlayingCardMatching2.h"

@implementation PlayingCardMatching2

//overriding the match defined in super class Card for 2 Card Mode
-(int) match:(NSArray *)otherCards{
    int score = 0;
    
    if (otherCards.count == 1) {
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
