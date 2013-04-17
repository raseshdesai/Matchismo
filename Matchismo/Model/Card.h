//
//  Card.h
//  Matchismo
//
//  Created by Rasesh Desai on 4/14/13.
//  Copyright (c) 2013 Rasesh Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnPlayable) BOOL unPlayable;

- (int) match : (NSArray *) otherCards;

@end
