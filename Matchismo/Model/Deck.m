//
//  Deck.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/14/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong, nonatomic) NSMutableArray * cards;

@end

@implementation Deck

//Lazy initialization of cards array during call to getter
-(NSMutableArray *) cards {
    if(!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard:(Card *) card
           atTop:(BOOL) atTop {
    if(atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

/*
 Note: You can draw only from a non empty list of cards, hence the check for cards count
 */
- (Card *) drawRandomCard{
    Card * randomCard;
    if(self.cards.count > 0){ 
        NSUInteger randomIndex = arc4random() % self.cards.count;
        randomCard = self.cards[randomIndex];
        [self.cards removeObjectAtIndex:randomIndex];
    }
    return randomCard;
}

@end
