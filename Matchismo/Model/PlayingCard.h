//
//  PlayingCard.h
//  Matchismo
//
//  Created by Rasesh Desai on 4/16/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) getAllRanks;

+(NSArray *) getAllSuits;

+ (NSUInteger) getMaxRank;

@end
