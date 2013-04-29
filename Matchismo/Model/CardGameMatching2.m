//
//  CardGameMatching2.m
//  Matchismo
//
//  Created by Dhwani Desai on 4/29/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardGameMatching2.h"

@implementation CardGameMatching2

#define MATCH_BONUS 3;
#define MATCH_PENALTY 2;
#define FLIP_COST 1;

-(void) flipCardAtIndex: (NSUInteger) index {
    Card * card = [self cardAtIndex:index];
    if(!card.isUnPlayable){
        if (!card.isFaceUp) {
            self.lastActionMsg = [@"Flipped up " stringByAppendingString: card.contents];
            for (Card * otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnPlayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore != 0) {
                        card.unPlayable = YES;
                        otherCard.unPlayable = YES;
                        int pointsGained = matchScore * MATCH_BONUS;
                        self.score += pointsGained;
                        self.lastActionMsg = [NSString stringWithFormat:@"Matched %@ and %@ for %d points!", card.contents, otherCard.contents, pointsGained];
                    } else {
                        int pointsLost = MATCH_PENALTY;
                        self.score -= pointsLost;
                        self.lastActionMsg = [NSString stringWithFormat:@"%@ and %@ don't match, %d point penalty.", card.contents, otherCard.contents, pointsLost];
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
