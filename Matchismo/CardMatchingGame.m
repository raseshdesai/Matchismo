//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/20/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic, readwrite) int score;
@property (strong, nonatomic) NSMutableArray * cards;

@end

@implementation CardMatchingGame

#define MATCH_BONUS 2;
#define MATCH_PENALTY 4;
#define FLIP_COST 1;

-(NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(id) initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for (int i = 0; i < cardCount; i++) {
            Card * card = [deck drawRandomCard];
            if(!card){
                self = nil;
            } else{
                self.cards[i] = card;
            }
        }
    }
    return self;
}

-(void) flipCardAtIndex: (NSUInteger) index{
    Card * card = [self cardAtIndex:index];
    if(!card.isUnPlayable){
        if (!card.isFaceUp) {
            for (Card * otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnPlayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore != 0) {
                        card.unPlayable = YES;
                        otherCard.unPlayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else{
                        self.score -= MATCH_PENALTY;
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

-(Card *) cardAtIndex: (NSUInteger) index{
    if(index < self.cards.count){
        return (Card *)self.cards[index];
    }
    return nil;
}

@end
