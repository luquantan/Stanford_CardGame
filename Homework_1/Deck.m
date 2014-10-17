//
//  Deck.m
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//


#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards; //of Card
@end


@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    
    //The of statement above is the same as, if (_cards) _cards = [[NSMutableArray Alloc]init];
    return _cards;
}


- (void)addCard:(Card *)card {
    
    [self addCard:card atTop:NO];
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }

}

- (Card *)drawRandomCard
{
    Card *randomcard = nil;
    
    if ([self.cards count]){
        
        unsigned index = arc4random() % [self.cards count];
        randomcard = self.cards[index]; //[self.cards objectAtIndexedSubscript:index];
        [self.cards removeObjectAtIndex:index];
        
    }
    
    return randomcard;
        
}

@end
