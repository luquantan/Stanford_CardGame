//
//  SetGameCardDeck.m
//  Homework_1
//
//  Created by LuQuan Intrepid on 10/21/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "SetGameCardDeck.h"
#import "SetGameCard.h"

@implementation SetGameCardDeck


- (NSString *)makeSomeNumberOfCards:(SetGameCard *)card someNumber:(NSInteger)someNumber
{
    NSString *someNumberOfCards = @"";
    
    switch (someNumber)
    {
        case 1:
            someNumberOfCards = [NSString stringWithFormat:@"%@",card.symbolOfCard];
            break;
        case 2:
            someNumberOfCards = [NSString stringWithFormat:@"%@%@",card.symbolOfCard, card.symbolOfCard];
        case 3:
            someNumberOfCards = [NSString stringWithFormat:@"%@%@%@", card.symbolOfCard, card.symbolOfCard, card.symbolOfCard];
        default:
            break;
    }
    

    return someNumberOfCards;
}

- (instancetype)init
{
    self = [super init];
    
    
    //I have no idea what I am doing here.
    
//    if (self) {
//        for (NSString *symbolOfCard in [SetGameCard validSymbols]) {
//            for (int i = 0; i <= 3; i++) {
//                SetGameCard *card = [[SetGameCard alloc]init];
//                
//                card.symbolOfCard = [self makeSomeNumberOfCards:card.symbolOfCard someNumber:i];
//            }
//        }
//        
//    }
    
    return self;
}

@end
