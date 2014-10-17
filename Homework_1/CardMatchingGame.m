//
//  CardMatchingGame.m
//  Homework_1
//
//  Created by LuQuan Intrepid on 10/15/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

//Redefine "readwrite" here to allow private set/get of score
@property (nonatomic,readwrite) NSInteger score;
//We need to create a data structure to store our cards
@property (strong, nonatomic) NSMutableArray *cards; // of Card

// Define 

@end

@implementation CardMatchingGame

//Lazy instantiation of our NSMutableArray
- (NSMutableArray *)cards
{
    if (!_cards) _cards= [[NSMutableArray alloc]init];
    return _cards;
}

//This is to prevent the user from using this default init.
- (instancetype)init
{
    return nil;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count ; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }

     return self;
}


//Defining two constants
static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        
        } else {
            
            
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched){
                    
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                        
                    } else {
                        
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    
                    break; //can only choose 2 cards for now
                    
                }
            }
            
            card.chosen = YES;
            self.score -= COST_TO_CHOOSE;
        }
    }
}

//To prevent user from entering index larger than the number of cards
- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
    //This says: if "index" is less than "[self.cards count]", then return "self.cards[index]. if "index" is more than "[self.cards count]", then return "nil".
}



//Display the result of the pervious match.
- (NSString *)previousMatchString:(NSArray *)previousMatch
{
    NSString *displayString = @"";
    
    
    return displayString;
}



@end
