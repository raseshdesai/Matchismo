//
//  CardGameMatching3.m
//  Matchismo
//
//  Created by Dhwani Desai on 4/29/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardGameMatching3.h"

@implementation CardGameMatching3

#define MATCH_BONUS 2;
#define MATCH_PENALTY 10;
#define FLIP_COST 1;

-(void) flipCardAtIndex: (NSUInteger) index {
    Card * card = [self cardAtIndex:index];
    if(!card.isUnPlayable){
        if (!card.isFaceUp) {
            self.lastActionMsg = [@"Flipped up " stringByAppendingString: card.contents];
            
            Card * otherCard1 = Nil;
            Card * otherCard2 = Nil;
            for (Card * otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnPlayable) {
                    if(!otherCard1){
                        otherCard1 = otherCard;
                    } else {
                        otherCard2 = otherCard;
                    }
                }
            }
            
            if (otherCard1 && otherCard2) {                
                int matchScore = [card match:@[otherCard1, otherCard2]];
                if (matchScore != 0) {
                    card.unPlayable = YES;
                    otherCard1.unPlayable = YES;
                    otherCard2.unPlayable = YES;
                    int pointsGained = matchScore * MATCH_BONUS;
                    self.score += pointsGained;
                    self.lastActionMsg = [NSString stringWithFormat:@"Matched %@, %@ and %@ for %d points!", card.contents, otherCard1.contents, otherCard2.contents, pointsGained];
                } else {
                    int pointsLost = MATCH_PENALTY;
                    self.score -= pointsLost;
                    self.lastActionMsg = [NSString stringWithFormat:@"%@, %@ and %@ don't match, %d point penalty.", card.contents, otherCard1.contents, otherCard2.contents, pointsLost];
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}


@end
