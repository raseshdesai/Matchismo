//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/13/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardGameMatching2.h"
#import "CardGameMatching3.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastActionMsgLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSelector;
@property (nonatomic) int maxAllowableCardFacedUp;

@end

@implementation CardGameViewController

-(void) setGameModeSelector:(UISegmentedControl *)gameModeSelector{
    _gameModeSelector = gameModeSelector;
    if (!self.game) {
        [self initializeGameBasedOnSelectedMode];
    }
}

-(void) initializeGameBasedOnSelectedMode{
        if (0 == self.gameModeSelector.selectedSegmentIndex) {
            self.game = [self initialize2CardMatchingGame];
            self.maxAllowableCardFacedUp = 2;
        }
        if (1 == self.gameModeSelector.selectedSegmentIndex) {
            self.game = [self initialize3CardMatchingGame];
            self.maxAllowableCardFacedUp = 3;
        }
}

-(CardMatchingGame *) initialize2CardMatchingGame{
    return [[CardGameMatching2 alloc]initWithCardCount:self.cardButtons.count
                                            usingDeck:[[PlayingCardDeck alloc] initWithPlayingCardMatching2]];
}

-(CardMatchingGame *) initialize3CardMatchingGame{
    return [[CardGameMatching3 alloc]initWithCardCount:self.cardButtons.count
                                             usingDeck:[[PlayingCardDeck alloc] initWithPlayingCardMatching3]];
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
        cardButton.alpha = [card isUnPlayable] ?  0.3 : 1.0;
        
        if(![cardButton isSelected] && [cardButton isEnabled]){
            UIImage * cardBackImage = [UIImage imageNamed:@"cardimage1"];
            [cardButton setImage:cardBackImage forState:UIControlStateNormal];
            [cardButton setImageEdgeInsets:UIEdgeInsetsMake(3, 2, 3, 2)];
        } else{
            [cardButton setImage:Nil forState:UIControlStateNormal];
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.lastActionMsgLabel.text = [NSString stringWithFormat:@"Msg: %@", self.game.lastActionMsg];
    self.gameModeSelector.enabled = NO;
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flip Count: %d", self.flipCount];
}

/*
 Note: After drawing all 52 cards from deck, title for selected state will be set to null, hence the title for default state will always show up
 */
- (IBAction)flipCard:(UIButton *)sender {    
    if (![sender isSelected] && [self maxAllowableCardAlreadyFacedUp:self.maxAllowableCardFacedUp]) return;
    sender.selected = !sender.isSelected;
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (IBAction)resetGame {
    [self initializeGameBasedOnSelectedMode];
    [self updateUI];
    self.flipCount = 0;
    self.gameModeSelector.enabled = YES;
}

- (IBAction)changeGameMode {
    [self initializeGameBasedOnSelectedMode];
}

-(BOOL) maxAllowableCardAlreadyFacedUp: (int) maxAllowableCardFacedUp {
    int numberOfCardsSelectedAndNotDisabled = 0;
    for (UIButton * cardButton in self.cardButtons) {
        if (cardButton.isSelected && cardButton.isEnabled) {
            numberOfCardsSelectedAndNotDisabled++;
        }
    }
    if (numberOfCardsSelectedAndNotDisabled < maxAllowableCardFacedUp) {
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
