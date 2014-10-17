//
//  PlayingCard.m
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            
            if (otherCard.rank == self.rank) {
                score = 4;
            } else if ([otherCard.suit isEqualToString:self.suit]) {
                score = 1;
            }
            
        }
       
        
    }
    return score;
}





//Re-defining the getter of (property contents) to give the rank and suit of a particular playing card
- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard validRanks];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}






@synthesize suit = _suit;
//We can make the code cleaner by adding class methods(start with +) to create the arrays needed
+ (NSArray *)validSuits
{
    return @[@"♣︎",@"♥︎",@"♦︎",@"♠︎"];
}
+ (NSArray *)validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


//Re-define the setter of Suit to only set the unicode characters ♣︎♥︎♦︎♠︎
- (void)setSuit:(NSString *)suit
{
    if ( [[[self class] validSuits] containsObject:suit]) {
        
        _suit = suit;
    }
}
//Re-defining the getter of Suit to return "?" is value is "nil"(un-initialized)
- (NSString *)suit
{
//    if (_suit) {
//        return _suit
//    } else {
//        return @"?";
//    }
    return _suit != nil ? _suit : @"?";
}






//Tells the user of the max Rank value(0-13), hence count of validRanks - 1.
+ (NSUInteger)maxRank
{
    return [[self validRanks] count] - 1 ;
}

//Use maxRank in the setter of Rank to prevent user from putting in an improper value
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        
        _rank=rank;
    }
}


@end
