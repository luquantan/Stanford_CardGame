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
@property (strong, nonatomic) NSString *colorOfCard;
@property (strong, nonatomic) NSAttributedString *fill;
@property (strong, nonatomic) NSMutableString *symbolOfCard;


+ (NSArray *)validSymbols;

@end
