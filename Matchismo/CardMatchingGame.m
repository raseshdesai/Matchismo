//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/20/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@end

@implementation CardMatchingGame

-(NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(id) initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck {
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
    }
    return self;
}

-(Card *) cardAtIndex: (NSUInteger) index{
    if(index < self.cards.count){
        return (Card *)self.cards[index];
    }
    return nil;
}

-(void) flipCardAtIndex: (NSUInteger) index {
    @throw [NSException
            exceptionWithName:@"MethodNotImplementedException"
            reason:@"Subclass of CardMatchingGame should be used instead which implements flipCardAtIndex."
            userInfo:nil];;
}

@end
