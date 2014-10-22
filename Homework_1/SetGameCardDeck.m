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


//
//- (NSString *)makeSomeNumberOfCards:(SetGameCard *)card someNumber:(NSInteger)someNumber
//{
//    NSString *someNumberOfCards = @"";
//    
//    switch (someNumber)
//    {
//        case 1:
//            someNumberOfCards = [NSString stringWithFormat:@"%@",card.symbolOfCard];
//            break;
//        case 2:
//            someNumberOfCards = [NSString stringWithFormat:@"%@%@",card.symbolOfCard, card.symbolOfCard];
//        case 3:
//            someNumberOfCards = [NSString stringWithFormat:@"%@%@%@", card.symbolOfCard, card.symbolOfCard, card.symbolOfCard];
//        default:
//            break;
//    }
//    
//
//    return someNumberOfCards;
//}


//Create a custom initializer to properly generate a deck of SetGameCards
- (instancetype)init
{
    self = [super init];
    
    SetGameCard *card = [[SetGameCard alloc]init];
    
    int count = 0;
    
    if (self) {
        for (int i = 0; i < enum_countOfColorType; i++) {
            for (int j = 0; j < enum_countOfSymbolAmount; j++) {
                for (int k = 0; k < enum_countOfFillType; k++) {
                    for (int l = 0; l < enum_countOfSymbolType; l++) {
                        
                        card.symbolColorOnCard = i;
                        card.symbolAmountOnCard = j;
                        card.symbolFillOnCard = k;
                        card.symbolTypeOnCard = l;
                        [self addCard:card];
                        
                        
                        count++;
                        printf("This is the %i card\n", count);
                        
                        
                        
                    }
                }
            }
        }
        
    }
    return self;
}

@end
