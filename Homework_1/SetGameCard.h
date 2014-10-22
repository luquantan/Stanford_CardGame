//
//  SetCardGame.h
//  Homework_1
//
//  Created by LuQuan Intrepid on 10/21/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.
//

#import "Card.h"

@interface SetGameCard : Card

//Corresponds to the different card types in Set

//@property (strong, nonatomic) NSMutableArray *symbolOfCard;

typedef NS_ENUM(NSInteger, SetGameCardColorType)
{
    SetGameCardColorType1,
    SetGameCardColorType2,
    SetGameCardColorType3,
    enum_countOfColorType
};

typedef NS_ENUM(NSInteger, SetGameCardSymbolAmount)
{
    SetGameCardSymbolAmount1,
    SetGameCardSymbolAmount2,
    SetGameCardSymbolAmount3,
    enum_countOfSymbolAmount
};

typedef NS_ENUM(NSInteger, SetGameCardFillType)
{
    SetGameCardFillType1,
    SetGameCardFillType2,
    SetGameCardFillType3,
    enum_countOfFillType
};

typedef NS_ENUM(NSInteger, SetGameCardSymbolType)
{
    SetGameCardSymbolType1,
    SetGameCardSymbolType2,
    SetGameCardSymbolType3,
    enum_countOfSymbolType
};


@property (nonatomic) SetGameCardColorType symbolColorOnCard;
@property (nonatomic) SetGameCardSymbolAmount symbolAmountOnCard;
@property (nonatomic) SetGameCardFillType symbolFillOnCard;
@property (nonatomic) SetGameCardSymbolType symbolTypeOnCard;




//+ (NSArray *)validSymbols;

@end
