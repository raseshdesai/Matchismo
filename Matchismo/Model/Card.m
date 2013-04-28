//
//  Card.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/14/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match : (NSArray *) otherCards{
    int score = 0;
    for (Card * card in otherCards) {
        if([self.contents isEqualToString:card.contents]) {
            score = 1;
            break;
        }
    }
    return score;
}

@end
