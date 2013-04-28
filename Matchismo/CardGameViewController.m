//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/13/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

-(CardMatchingGame *) game{
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:self.cardButtons.count
                                                 usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

/*
 Note: System will call "setters" on all the @properties that hold View objects [like list of buttons or label] when the application runs (...when all these buttons have been unfreeze-dried, not sure what this means YET)
 */
-(void) setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
}

-(void) updateUI{
    for (UIButton * cardButton in self.cardButtons) {
        Card * card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled]; //Selected and Disabled
        cardButton.selected = [card isFaceUp];
        cardButton.enabled = ![card isUnPlayable];
        if (card.isUnPlayable) {
            cardButton.alpha = 0.3; //reduce the transparency of the disabled cardButtons
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flip Count: %d", self.flipCount];
}

/*
 Note: After drawing all 52 cards from deck, title for selected state will be set to null, hence the title for default state will always show up
 */
- (IBAction)flipCard:(UIButton *)sender {
    
//    Card * card = [self.deck drawRandomCard];
//    [sender setTitle:card.contents forState:UIControlStateSelected];
    
    sender.selected = !sender.isSelected;
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

@end
