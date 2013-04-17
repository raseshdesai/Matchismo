//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Rasesh Desai on 4/13/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;

@property (nonatomic) int flipCount;

@end

@implementation CardGameViewController

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flip Count: %d", self.flipCount];
    NSLog(@"flip count: %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

@end
