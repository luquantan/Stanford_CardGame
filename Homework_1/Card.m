//
//  Card.m
//  Homework_1
//
//  Created by Lu Quan Tan on 10/14/14.
//  Copyright (c) 2014 LuQuanTan. All rights reserved.

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
        
       
    }
    
   return score;
}






@end


//When a property is created, setter and getters are automagically created. Their syntax is as follows:
//@synthesize contents = _contents; //_contents is an instance variable that is set and gotten
//
//- (NSString *)contents
//{
//    return _contents;
//}
//
//- (void)setContents:(NSString *)contents;
//{
//    _contents = contents;
//}
//Note everytime the setter and getter is redefined, the user needs to create the instance variable
