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
-(int) match:(NSArray *)otherCards {
    
    if (otherCards.count == 2) {
        
        PlayingCard * otherCard1 = [self getPlayingCardFromArray:otherCards atIndex:0];
        PlayingCard * otherCard2 = [self getPlayingCardFromArray:otherCards atIndex:1];
        
        if ([self rankMatchesFor:self
                             and:otherCard1
                             and:otherCard2]) {
            return 20;
        }

        if ([self suitMatchesFor:self
                             and:otherCard1
                             and:otherCard2]) {
            return 5;
        }
        
        if ([self rankMatchesFor:self and:otherCard1] ||
            [self rankMatchesFor:otherCard1 and:otherCard2] ||
            [self rankMatchesFor:self and:otherCard2]) {
            return 4;
        }
        
        if ([self suitMatchesFor:self and:otherCard1] ||
            [self suitMatchesFor:otherCard1 and:otherCard2] ||
            [self suitMatchesFor:self and:otherCard2]) {
            return 1;
        }
    }
    
    return 0;
}
                             
-(PlayingCard *) getPlayingCardFromArray: (NSArray *) array
                                 atIndex: (NSUInteger) index {
    id objectInArray1 = array[index];
    if ([objectInArray1 isKindOfClass:[PlayingCard class]]) {
        return (PlayingCard *) objectInArray1;
    }
    return Nil;
}

-(BOOL) rankMatchesFor: (PlayingCard *) card1
                   and: (PlayingCard *) card2 {    
    if (card1.rank == card2.rank) {
        return YES;
    }
    return NO;
}


-(BOOL) rankMatchesFor: (PlayingCard *) card1
                   and: (PlayingCard *) card2
                   and: (PlayingCard *) card3{
    if (card1.rank == card2.rank &&
        card2.rank == card3.rank &&
        card1.rank == card3.rank) {
        return YES;
    }
    return NO;
}

-(BOOL) suitMatchesFor: (PlayingCard *) card1
                   and: (PlayingCard *) card2 {
    if ([card1.suit isEqualToString:card2.suit]) {
        return YES;
    }
    return NO;
}


-(BOOL) suitMatchesFor: (PlayingCard *) card1
                   and: (PlayingCard *) card2
                   and: (PlayingCard *) card3{
    if ([card1.suit isEqualToString:card2.suit] &&
        [card2.suit isEqualToString:card3.suit] &&
        [card1.suit isEqualToString:card3.suit]) {
        return YES;
    }
    return NO;
}


@end
