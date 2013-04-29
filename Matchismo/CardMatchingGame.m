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
@property (nonatomic) NSUInteger cardsToMatch;

@end

@implementation CardMatchingGame

#define MATCH_BONUS 3;
#define MATCH_PENALTY 2;
#define FLIP_COST 1;

-(NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(id) initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck
       withCardsToMatch: (NSUInteger) cardsToMatch {
    self = [super init];
    if(self) {
        for (int i = 0; i < cardCount; i++) {
            Card * card = [deck drawRandomCard];
            if(!card){
                self = nil;
            } else{
                self.cards[i] = card;
            }
        }
        self.lastActionMsg = @"";
        self.cardsToMatch = cardsToMatch;
    }
    return self;
}

-(void) flipCardAtIndex: (NSUInteger) index {
    Card * card = [self cardAtIndex:index];
    if(!card.isUnPlayable){
        if (!card.isFaceUp) {
            if([self maxAllowableCardAlreadyFacedUp:self.cardsToMatch]) return;
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

-(Card *) cardAtIndex: (NSUInteger) index{
    if(index < self.cards.count){
        return (Card *)self.cards[index];
    }
    return nil;
}

-(BOOL) maxAllowableCardAlreadyFacedUp: (int) maxAllowableCardFacedUp {
    int numberOfCardsWithFaceUpAndNotDisabled = 0;
    for (Card * card in self.cards) {
        if (card.isFaceUp && !card.isUnPlayable) {
            numberOfCardsWithFaceUpAndNotDisabled++;
        }
    }
    if (numberOfCardsWithFaceUpAndNotDisabled < maxAllowableCardFacedUp) {
        return NO;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%d Card Matchismo - Invalid Operation", maxAllowableCardFacedUp]
                                                    message:[NSString stringWithFormat:@"At any point you can unlock a maximum of %d cards", maxAllowableCardFacedUp]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    return YES;
}

@end
