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

@end
