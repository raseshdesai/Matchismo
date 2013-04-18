//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/13/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;

@property (nonatomic) int flipCount;

@property (strong, nonatomic) Deck * deck;

@end

@implementation CardGameViewController

-(Deck *) deck{
    if(NULL == _deck){
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flip Count: %d", self.flipCount];
}

/*
 Note: After drawing all 52 cards from deck, title for selected state will be set to null, hence the title for default state will always show up
 */
- (IBAction)flipCard:(UIButton *)sender {
    
    Card * card = [self.deck drawRandomCard];
    [sender setTitle:card.contents forState:UIControlStateSelected];
    
    sender.selected = !sender.isSelected;
    
    self.flipCount++;
}

@end
