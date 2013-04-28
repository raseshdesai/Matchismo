//
//  PlayingCard.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/16/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+(NSArray *) getAllRanks{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSArray *) getAllSuits{
    return @[@"♥", @"♣", @"♦", @"♠"];
}

+(NSUInteger) getMaxRank{
    return [PlayingCard getAllRanks].count - 1;
}

-(NSString *) contents{
    NSArray * rankList = [PlayingCard getAllRanks];
    return [rankList[self.rank] stringByAppendingString:self.suit];
}

-(void) setSuit:(NSString *) suit{
    if([[PlayingCard getAllSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *) suit{
    return _suit ? _suit : @"?";
}

-(void) setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard getMaxRank]){
        _rank = rank;
    }
}

//overriding the match defined in super class Card
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
