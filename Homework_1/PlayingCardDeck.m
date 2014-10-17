//
//  PlayingCardDeck.m
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h" //Why not import in header file?

@implementation PlayingCardDeck

//Going to overide init method from superclass NSObject
- (instancetype) init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card]; 
            }
        }
    }
    return self;
}

@end
