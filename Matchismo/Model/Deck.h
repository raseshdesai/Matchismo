//
//  Deck.h
//  Matchismo
//
//  Created by Rasesh Desai on 4/14/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard: (Card *) card
           atTop: (BOOL) atTop;

- (Card *) drawRandomCard;

@end
